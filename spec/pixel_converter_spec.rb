require 'spec_helper'
require 'tempfile'

describe PixelConverter do

  it 'accepts a filehandle' do
    expect do
      converter = described_class.new( Tempfile.new('bar') )
    end.to_not raise_error
  end

  it "raises if it can't #read from the input" do
    expect do
      converter = described_class.new( "" )
    end.to raise_error
  end

  it "converts a file to an rgb matrix" do
      input_file = File.open('spec/example_files/djcp.jpg')
      converter = described_class.new( input_file )
      converter.to_rgb_matrix
      puts converter.inspect
  end

end
