require 'spec_helper'
require 'exporter/pdf'

describe "Pdf" do

  before(:each) do
    @pdf = Exporter::Pdf.new(
      code_name:       "rikee",
      blood_color:     "saffron",
      no_of_antennas:  3,
      no_of_legs:      5,
      home_town:       "zoooma",
      file_format:     "pdf"
    )
  end

  describe "#file_name" do
    it "should return file name" do
      time = Time.now

      Time.stub(:now, time) do
        @pdf.file_name.must_equal("data/rikee_#{time}.pdf")
      end
    end
  end

  describe "#export" do
    it "should save file in pdf" do
    end
  end
end
