module DocumentService

  def CreatePDF(submission_doc, endorsement_letter)
    require 'base64'
    require 'faraday'
    require 'mime/types'


    url = "http://msdoc-converter.usaascvb.info"
    #TIMEOUT_SECONDS = 10

    conn = Faraday.new(:url => url) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.request  :multipart
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  :net_http  # make requests with Net::HTTP
    end

    ########## read the submission_doc and convert it if not already PDF ###########
    # check if submission_doc is already a PDF
    fileIn = File.open(submission_doc, "rb")
    submission_contents = fileIn.read

    if not fileIn.path.downcase.include? "pdf"

      # uploading a file:
      payload = {}
      enc   = Base64.encode64(submission_contents)
      payload[:submission] = enc
      out = conn.post '/rest/restappcfc2/convertDocxService', payload
      submission_contents_base64_encoded = out.body

    end
    fileIn.close

    ########## read the endorsement_letter and combine with submission_doc ###########
    fileIn = File.open(endorsement_letter, "rb")
    endorsement_contents = fileIn.read

    if not fileIn.path.downcase.include? "pdf"

      ### return error as we expect PDF ###
      raise "endorsement letter wrong format"

    else

      # uploading a file:
      payload = {}
      payload[:submission] = submission_contents_base64_encoded
      enc  = Base64.encode64(endorsement_contents)
      payload[:endorsement] = enc
      out = conn.post '/rest/restappcfc2/combinePDF', payload

      if not out.success?
        raise response.error!
      end

      submission_packet_contents_base64_encoded = out.body

    end
    fileIn.close
    return submission_packet_contents_base64_encoded

  end

end
