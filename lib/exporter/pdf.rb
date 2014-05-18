require 'prawn'

module Exporter
  class Pdf

    def initialize(alien_info)
      @alien_info = alien_info
      @document   = Prawn::Document.new
    end

    def export
      @document.text(content)
      @document.render_file(file_name)
    end

    private

    def file_name
      "data/#{@alien_info[:code_name]}_#{Time.now.to_s}.pdf"
    end

    def content
      @alien_info.map do |key, value|
        "#{key} : #{value}"
      end.join("\n")
    end

  end
end
