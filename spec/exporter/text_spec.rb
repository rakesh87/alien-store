require 'spec_helper'
require 'exporter/pdf'

describe "Text" do

  before(:each) do
    @text = Exporter::Text.new(
      code_name:       "rikee",
      blood_color:     "saffron",
      no_of_antennas:  3,
      no_of_legs:      5,
      home_town:       "zoooma",
      file_format:     "pdf"
    )
  end

  it "should return file name" do
    time = Time.now

    Time.stub(:now, time) do
      @text.file_name.must_equal("data/rikee_#{time}.text")
    end
  end

  it "should save file in text" do

  end

end
