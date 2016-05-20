module DocumentService

  def CreatePDF(nomination_id, submission_doc, endorsement_letter)
    require 'base64'
    require 'faraday'
    #require 'ruby-filemagic'
    require 'mime/types'


    url = "http://msdoc-converter.usaascvb.info"
    #TIMEOUT_SECONDS = 10

    conn = Faraday.new(:url => url) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.request  :multipart
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  :net_http  # make requests with Net::HTTP
    end

    # auto detect file's file-type
    #fm = FileMagic.new(FileMagic::MAGIC_MIME)

    # check if submission_doc is already a PDF
    #mime_type = fm.file(submission_doc)
    file1 = File.open(submission_doc, "rb")

    if not file1.path.downcase.include? "pdf"

      # uploading a file:
      payload = {}
      contents = file.read
  #    file.close
      enc   = Base64.encode64(contents)
      payload[:submission] = enc

      # "Multipart" middleware detects files and encodes with "multipart/form-data":
      out =conn.post '/rest/restappcfc2/convertDocxService', payload

      file1 = Tempfile.new('foo')
      begin
        File.open(file1, "wb") do |f|
          f.write(out.body)
        end
      ensure
         #file1.close
         #file.unlink   # deletes the temp file
      end

    else

      file1 = File.open(submission_doc, "rb")

    end

    # check if endorsement_letter is already a PDF
    file2 = File.open(endorsement_letter, "rb")
    #mime_type = fm.file(endorsement_letter)

    if not file2.path.downcase.include? "pdf"

      # uploading a file:
      payload = {}

      contents = file2.read
  #    file2.close
      enc   = Base64.encode64(contents)
      payload[:submission] = enc

      # "Multipart" middleware detects files and encodes with "multipart/form-data":
      out =conn.post '/rest/restappcfc2/convertDocxService', payload

      file2 = Tempfile.new('foo')
      begin
        File.open(file2, "wb") do |f|
          f.write(out.body)
        end
      ensure
         #file2.close
         #file.unlink   # deletes the temp file
      end

    else
      file2 = File.open(endorsement_letter, "rb")
    end

    # let's combine the PDFs
    #pdf = CombinePDF.new
    #pdf << CombinePDF.load(file1.path) # one way to combine, very fast.
    #pdf << CombinePDF.load(file2.path)
    #pdf.save "combined.pdf"
    puts file1.path
    puts file2.path

    payload = {}
    contents = file1.read
    enc   = Base64.encode64(contents)
    payload[:submission] = enc

    contents = file2.read
    enc   = Base64.encode64(contents)
    payload[:endorsement] = enc

    # output file
    out =conn.post '/rest/restappcfc2/combinePDF', payload

    if out.success?
      @nomination = Nomination.find(nomination_id)
      file3 = Tempfile.new(['foo','.pdf'])
      begin
        File.open(file3, "wb") do |f|
          f.write(out.body)
        end
      ensure
         file3.close
         @nomination.submission_packet = file3
         file3.unlink   # deletes the temp file
      end

      @nomination.save!
    end
    #puts out.body
    file1.close
    file2.close
  end

end
