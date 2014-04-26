require 'RMagick'
include Magick

class Collage


  # Usage
  #
  # Collage.new.draw_collage(["ellora.jpg"]*9,"collage.jpg")
  # Collage.new.draw_collage(["ellora.jpg"]*9,"collage.jpg",options:{total_image_size: 455,tile_size: 150})


  def draw_collage(tiles, output_file, options: {total_image_size: 680, tile_size: 220})
    bg = Image.new(options[:total_image_size],options[:total_image_size]) # blank background image

    (0..2).to_a.each do |outer|
      (0..2).to_a.each do |inner|

        # calculate on which no image from tiles to work on
        image_index = (outer + 1) * (inner + 1)

        x = calculate_x(inner,options[:tile_size])
        y = calculate_x(outer,options[:tile_size])

        # image object to work upon
        image = ImageList.new(tiles[image_index - 1 ])
        image = image.resize_to_fit(options[:tile_size],options[:tile_size])
        # add images to bg
        bg.composite!(image, x, y, OverCompositeOp)
      end
    end

    bg.write(output_file)
    output_file
  end

  private

  def calculate_x(inner,tile_size)
    x = inner * tile_size + 5
    x = x + ( inner *  5) if inner > 0
    x
  end

  def calculate_y(outer,tile_size)
    y = (outer * tile_size) + 5
    y = y + (outer * 5) if outer > 0
    y
  end

  # def convert_pixels_to_cms(pixels, dpi)
  #   return (pixels / dpi) * 2.54
  # end

end