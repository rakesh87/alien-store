require 'spec_helper'
require 'exporter/text'

describe Exporter::Text do

  before(:each) do
    @alien_info_hash = {
      code_name:       "rikee",
      blood_color:     "saffron",
      no_of_antennas:  3,
      no_of_legs:      5,
      home_town:       "zoooma",
      file_format:     "pdf"
    }
  end

  describe "#initialize" do
    it "sets alien_info" do
      text_exporter = Exporter::Text.new(@alien_info_hash)
      text_exporter.instance_variable_get(:@alien_info).must_equal @alien_info_hash
    end
  end

  describe "#file_name" do
    it "should return PDF file_name" do
      time = Time.now
      text_exporter = Exporter::Text.new(@alien_info_hash)

      Time.stub(:now, time) do
        text_exporter.file_name.must_equal("data/rikee_#{time}.text")
      end
    end
  end

  describe "#export" do
    it "should save file in text" do

    end
  end

end
