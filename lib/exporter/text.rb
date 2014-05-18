module Exporter
  class Text

    def initialize(alien_info)
      @alien_info = alien_info
    end

    def export
      File.open(file_name, "w+") do |text|
        text << content
      end
    end

    private

    def file_name
      "data/#{@alien_info[:code_name]}_#{Time.now.to_s}.text"
    end

    def content
      @alien_info.map do |key, value|
        "#{key} : #{value}"
      end.join("\n")
    end

  end
end
