require "prawn"

class ImageToPdf

  def single_image(image,output_file_name)
    Prawn::Document.generate(output_file_name) do |pdf|
      pdf.image image
    end
  end

  def multiple_images(images,output_file_name)
    Prawn::Document.generate(output_file_name,margin: [0,0], size: [680,680]) do |pdf|
      images.each_with_index do |image,index|
        pdf.image image
        pdf.start_new_page if (index + 1) < images.size
      end
    end
  end
end