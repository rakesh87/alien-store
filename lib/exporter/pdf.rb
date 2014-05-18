require 'prawn'

module Exporter
  class Pdf

    def initialize(alien_info)
      @alien_info = alien_info
    end

    def file_name
      "data/#{@alien_info[:code_name]}_#{Time.now.to_s}.pdf"
    end

    def export
      Prawn::Document.generate(file_name) do |pdf|
        @alien_info.each do |key, value|
          pdf.text "#{key} : #{value} \n"
        end
      end
    end

  end
end
