module Errors

  class InvalidFileFormat < StandardError
    def message
      'Invalid File Format.'
    end
  end

end
