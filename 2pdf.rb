
require 'pdfkit'

PDFKit.configure do | config |
  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
end


site = ARGV[0]

#need to deal with http and https (hmmm...https defaults back to http no?)
#note https bug - 
page = PDFKit.new("https://" + "#{site}")
#probably better to accept with or without https and strip if https = true

file = page.to_file("#{site}".gsub(%r{/|\\}, '_') + ".pdf")
# file = page.to_file("myfile.pdf")

#launch pdf viewer from cli - open #{file}


