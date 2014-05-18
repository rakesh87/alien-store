require 'spec_helper'
require 'exporter/pdf'
require 'tempfile'

describe "Pdf" do

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
    it "sets alien_info and Prawn::Document object" do
      pdf_exporter = Exporter::Pdf.new(@alien_info_hash)
      pdf_exporter.instance_variable_get(:@alien_info).must_equal @alien_info_hash
    end
  end

  describe "#export" do
    it "should save file in pdf" do
      tf = Tempfile.new('rakesh.pdf')

      pdf_exporter = Exporter::Pdf.new(@alien_info_hash)

      pdf_exporter.stub(:file_name, tf) do
        pdf_exporter.export
      end

      tf.read.wont_be :empty?
      tf.unlink
    end
  end

  # Private Methods

  describe "#file_name" do
    it "should return file name" do
      time = Time.now
      pdf_exporter = Exporter::Pdf.new(@alien_info_hash)

      Time.stub(:now, time) do
        pdf_exporter.send(:file_name).must_equal("data/rikee_#{time}.pdf")
      end
    end
  end

  describe "#content" do
    it "joins hash elements into a string" do
      pdf_exporter = Exporter::Pdf.new(@alien_info_hash)
      pdf_exporter.send(:content).must_equal(
        "code_name : rikee\nblood_color : saffron\nno_of_antennas : 3\nno_of_legs : 5\nhome_town : zoooma\nfile_format : pdf"
      )
    end
  end
end
