class PixelConverter
  class ArgumentError < Exception
  end

  attr_reader :filehandle

  def initialize(filehandle)
    unless filehandle.respond_to? :read
      raise ArgumentError, "filehandle does not respond to #read"
    end
    @filehandle = filehandle
  end

  def to_rgb_matrix
    get_raw_rgb
  end

  private

  def get_raw_rgb
    IO.popen(converter_command, 'r+') do |converter|
      while line = filehandle.read(16 * 1024)
        converter.puts line
      end
      converter.close_write
      converter.read
    end
  end

  def converter_command
    "convert -scale 32x - - | convert -colors 64 -scale 256x - txt:-"
  end

end
