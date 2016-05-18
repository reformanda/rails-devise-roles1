require 'combine_pdf'

pdf = CombinePDF.new
pdf << CombinePDF.load("file1.pdf") # one way to combine, very fast.
pdf << CombinePDF.load("file2.pdf")
pdf.save "combined.pdf"
