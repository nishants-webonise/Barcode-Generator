module ApplicationHelper
  require 'cgi'
  require 'barby'
  require 'barby/outputter/png_outputter'
  require 'barby/barcode/code_128'
  require 'barby/barcode/code_25_interleaved'
  require 'barby/barcode/code_25_iata'
  require 'barby/barcode/code_39'
  require 'barby/barcode/code_93'
  require 'barby/barcode/gs1_128'
  require 'barby/barcode/ean_13'
  require 'barby/barcode/bookland'
  #require 'barby/barcode/upc_a'
  #require 'barby/barcode/upc_e'
  require 'barby/barcode/ean_8'
  require 'barby/barcode/upc_supplemental'
  require 'barby/barcode/qr_code'
  #require 'barby/barcode/rqrcode'
  require 'barby/barcode/data_matrix'
  #require 'barby/barcode/semacode'
  #require 'barby/barcode/pdf_417'

  # generate a PNG barcode image from the given data,
  # using a default symbology of Code128 type B
  # return a URI relative to the document root

  def barcode_image_uri(data,symbology)

    # check to see if we don't already have this barcode image
    filename = CGI.escape(symbology) + '_' + CGI.escape(data) + '.png'
    fname = Rails.root.to_s + "/public/Barcodes/"  + filename

    # if the barcode image doesn't already exist then generate and save it
    if ! File.exists?(fname)

      str = 'Barby::'+symbology+'.new("'+data+'")'

      begin
        barcode = eval str
      rescue Exception => exc
        barcode = Barby::Code128B.new(data)   # fall back to Code128 type B
      end

      File.open(fname, 'w') do |f|
        f.write barcode.to_png
      end

    end
    logger.info("#########{}")
    "#{filename}"
  end
end
