class NominationsController < ApplicationController
  before_action :set_nomination, only: [:show, :edit, :update, :destroy]
  before_action :set_nomination_type
  before_action :manager_or_admin_only, :except => [:list, :expired]
respond_to :json, :html
  include DocumentService

  def expired
  end

  # GET /boats
  # GET /boats.json
  def index
    @nominations = Nomination.all
    if params[:status].nil?
      params[:status] = ["0","1","2"]
    end
    @statuses = [:entered, :approved, :scored, :deleted]
    #puts @nominations.inspect
    @nominations = @nominations.where(
    "nominee_first_name like ? OR nominee_last_name like ? OR " + \
    "nominating_official_first_name like ? OR nominating_official_last_name like ? OR " + \
    "nominating_point_of_contact_first_name like ? OR nominating_point_of_contact_last_name like ?",
    "%#{params[:search]}%","%#{params[:search]}%",
     "%#{params[:search]}%","%#{params[:search]}%",
     "%#{params[:search]}%","%#{params[:search]}%") unless params[:search].blank?
    @nominations = @nominations.where("award_option_id = ?","#{params[:award]}") unless params[:award].blank?
    @nominations = @nominations.where("nomination_type_id = ?","#{params[:nomination_type]}") unless params[:nomination_type].blank?
    @nominations = @nominations.where(status: params[:status]) unless params[:status].blank?
    @nominations = @nominations.page params[:page] #User.all
    @nomination_types = NominationType.all.pluck(:code,:id)
  end

  def edit
    @info = NominationType.where(["code = ?", @nomination.nomination_type.code]).first
    @info.year = @nomination.nomination_year
    @info.id = @nomination.nomination_type_id
    @nomination_type = @nomination.nomination_type.code
    @nomination_types = NominationType.all.pluck(:code,:id)
    @award_options = AwardOption.all.pluck(:name,:id)
    @callback = "#"
    @manage_nomination = true
    @remove_submission_packet = nil
    #puts @nomination.submission_packet.blank?
    #puts @nomination.submission_packet
  end

  def show
    @nomination = Nomination.find(params[:id])
    #depending on the nomination type, choose the appropriate controller

    @info = NominationType.where(["code = ?", @nomination.nomination_type.code]).first
    @info.year = @nomination.nomination_year
    @info.id = @nomination.nomination_type_id
    @nomination_type = @nomination.nomination_type.code
    @nomination_types = NominationType.all.pluck(:code,:id)
    @award_options = AwardOption.all.pluck(:name,:id)
    @callback = "#"
    @manage_nomination = true

    unless current_user.admin?
      unless @user == current_user
        redirect_to action: "index", :alert => "Access denied."
      end
    end
  end

  def list
    @nominations = Nomination.all
    @nomination_types = NominationType.all
  end

  # PATCH/PUT /boats/1
  # PATCH/PUT /boats/1.json
  def update
    #puts "START***"
    respond_to do |format|
      if @nomination.update(nomination_params)

        # if build-submission-packet is checked, then create packet
        if params[:remove_submission_packet] == "yes"

          @nomination.remove_submission_packet!
          @nomination.save

        end

        if params[:build_submission_packet] == "yes"

          #TODO
          # determine which documents to merge based on nomination type
          # for packard, should, achievement, development:  submission_form_award_narrative and endorsement_letter
          # for logistic: ???
          # for product_support: ???



          begin
            case @nomination.nomination_type.code
            when true
            else
              submission_packet_contents_base64 = CreatePDF(@nomination.submission_form_award_narrative.current_path,  @nomination.endorsement_letter.current_path)
            end
            binpdf = Base64.decode64(submission_packet_contents_base64)
            file3 = Tempfile.new(['foo','.pdf'])
            begin
              File.open(file3, "wb") do |f|
                f.write(binpdf)
              end
            ensure
               file3.close
               @nomination.submission_packet = file3
               file3.unlink   # deletes the temp file
            end
            @nomination.save!
          rescue => e
            puts e.inspect
          end

        end

        # merge all approved packets for this nomination type
        begin
          out = MergePDF(@nomination.nomination_type_id)
        rescue => e
          puts e.inspect
        end

        format.html { redirect_to edit_nomination_url(@nomination), notice: 'Nomination was successfully updated.' }
        format.json { render :index, status: :ok, location: @nomination }
      else

        @info = NominationType.where(["code = ?", @nomination.nomination_type.code]).first
        @info.year = @nomination.nomination_year
        @info.id = @nomination.nomination_type_id
        @nomination_type = @nomination.nomination_type.code
        @nomination_types = NominationType.all.pluck(:code,:id)
        @award_options = AwardOption.all.pluck(:name,:id)
        @callback = "#"
        @manage_nomination = true
        @remove_submission_packet = nil
        format.html { render :edit }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    @nomination.destroy
    respond_to do |format|
      format.html { redirect_to nominations_url, notice: 'Nomination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_awards
    @award = AwardOption.joins(:nomination_type).where("nomination_type_id  = ?", params[:id]).pluck(:name,:id)
    puts @award
    puts "done"
    respond_to do |format|
      format.js
    end
  end

  private

    def manager_or_admin_only
      unless current_user.admin? || current_user.manager?
        redirect_to :root, :alert => "Access denied."
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_nomination
      @nomination = Nomination.find(params[:id])
      if @nomination.nomination_type.code == "Logistic"
        @nominataion = ProductSupport.find(params[:id])
      end
    end

    def set_nomination_type
       @nomination_type = nomination_type
    end

    def nomination_type
        Nomination.nomination_types.include?(params[:type]) ? params[:type] : "Nomination"
    end

    def nomination_type_class
        nomination_type.constantize
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nomination_params
      params.require(:nomination).permit(
      :unit_commander_title,
      :unit_commander_first_name,
      :unit_commander_last_name,
      :unit_commander_suffix,
      :unit_commander_phone,
      :unit_commander_email,
      :unit_commander_organization,
      :nominating_official_title,
      :nominating_official_first_name,
      :nominating_official_last_name,
      :nominating_official_suffix,
      :nominating_official_phone,
      :nominating_official_email,
      :nominating_point_of_contact_title,
      :nominating_point_of_contact_first_name,
      :nominating_point_of_contact_last_name,
      :nominating_point_of_contact_suffix,
      :nominating_point_of_contact_phone,
      :nominating_point_of_contact_email,
      :nominating_point_of_contact_organization_address_1,
      :nominating_point_of_contact_organization_address_2,
      :nominating_point_of_contact_city,
      :nominating_point_of_contact_state,
      :nominating_point_of_contact_zip,
      :nominating_point_of_contact_country,
      :award_option_id,
      :nominee_title,
      :nominee_first_name,
      :nominee_last_name,
      :nominee_suffix,
      :nominee_position_title,
      :nominee_email,
      :nominee_organization,
      :nominee_command,
      :endorsement_letter,
      :submission_form_award_narrative,
      :nominee_organization_logo,
      :nomination_type_id,
      :nomination_year,
      :nominee_team_name,
      :submission_form_award_narrative_cache,
      :endorsement_letter_cache,
      :nominee_organization_logo_cache,
      :submission_word_document,
      :submission_pdf,
      :submission_word_document_cache,
      :submission_pdf_cache,
      :status,
      :remove_submission_packet,
      :submission_packet,
      :submission_packet_cache)
    end


end
