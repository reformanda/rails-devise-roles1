require 'net/http/post/multipart'

url = URI.parse('http://msdoc-converter.usaascvb.info/rest/restappcfc2/convertDocxService')

File.open("./2016-achievement-submission.docx") do |jpg|
  req = Net::HTTP::Post::Multipart.new url.path,
    "file" => UploadIO.new(jpg,  "application/msdoc", "file")
  res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)

  puts res.inspect
  puts res.body
end
end

