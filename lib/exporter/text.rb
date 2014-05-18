module Exporter
  class Text

    def initialize(alien_info)
      @alien_info = alien_info
    end

    def file_name
      "data/#{@alien_info[:code_name]}_#{Time.now.to_s}.text"
    end

    def export
      File.open(file_name, "a+") do |f|
        @alien_info.each do |key, value|
          f << "#{key} : #{value} \n"
        end
      end
    end

  end
end
