require 'zip'
require 'pathname'

class Zipper

  def export(input_filenames,zipfile_name)
    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      input_filenames.each do |filename|
        # Two arguments:
        # - The name of the file as it will appear in the archive
        # - The original file, including the path to find it
        zipfile.add(Pathname.new(filename).basename.to_s,filename)
      end
    end
    zipfile_name
  end
end