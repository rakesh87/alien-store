require 'ostruct'
require 'spec_helper'
require 'alien'

describe "Alien" do

  before (:each) do
    @alien = Alien.new(
      code_name:       "rikee",
      blood_color:     "saffron",
      no_of_antennas:  3,
      no_of_legs:      5,
      home_town:       "zoooma",
      file_format:     "pdf"
    )

    @alien_1 = Alien.new(
      code_name:       "rikee",
      blood_color:     "saffron",
      no_of_antennas:  3,
      no_of_legs:      5,
      home_town:       "zoooma",
      file_format:     "text"
    )

    @alien_2 = Alien.new(
      code_name:       "rikee",
      blood_color:     "saffron",
      no_of_antennas:  3,
      no_of_legs:      5,
      home_town:       "zoooma",
      file_format:     "random"
    )
  end

  it "should get Alien attributes" do
    @alien.to_hash.must_equal({
      code_name: "rikee",
      blood_color: "saffron",
      antennas: 3,
      legs: 5,
      home_town: "zoooma",
      file_format: "Pdf"
    })
  end

  it "should get class name" do
    @alien.send(:exporter_klass).must_equal Exporter::Pdf
    @alien_1.send(:exporter_klass).must_equal Exporter::Text
    @alien_2.send(:exporter_klass).must_be_nil
  end

  it "should return Exporter class" do
    @alien.stub(:exporter_klass, OpenStruct) do
      @alien.send(:exporter).must_equal OpenStruct.new(@alien.to_hash)
    end
  end

  it "export file" do
    exporter_mock = Minitest::Mock.new

    exporter_mock.expect(:export, true)

    @alien.stub(:exporter, exporter_mock) do
      @alien.send(:export).must_equal true
    end

    exporter_mock.verify
  end

end
