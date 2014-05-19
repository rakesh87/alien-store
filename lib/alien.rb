# require all files inside exporters
#Dir["exporter/*.rb"].each { |file| require file }
require 'errors'
require 'exporter/pdf'
require 'exporter/text'

class Alien

  def initialize(options)
    @code_name    = options[:code_name]
    @blood_color  = options[:blood_color]
    @antennas     = options[:no_of_antennas]
    @legs         = options[:no_of_legs]
    @home_town    = options[:home_town]
    @file_format  = options[:file_format].to_s.capitalize
  end

  def export
    exporter.export
  end

  def to_hash
    {
      code_name: @code_name,
      blood_color: @blood_color,
      antennas: @antennas,
      legs: @legs,
      home_town: @home_town,
      file_format: @file_format
    }
  end

  private

  def exporter_klass
    return unless Exporter.constants.include?(@file_format.to_sym)
    Exporter.const_get(@file_format)
  end

  def exporter
    exporter_klass.new(to_hash)
  rescue => ex
    raise Errors::InvalidFileFormat
  end

end
