require 'httmultiparty'
class SomeClient
  include HTTMultiParty
  base_uri 'http://msdoc-converter.usaascvb.info/rest/restappcfc2/convertDocxService'
end

response = SomeClient.post('/', :query => {
  :submission => IO.binread('2016-achievement-submission.docx')}, 
  :detect_mime_type => true
 # :headers => { 'Content-Type' => 'application/msdoc' }
 )

out = IO.binwrite("file1.pdf", response)

