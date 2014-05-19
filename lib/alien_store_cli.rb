require 'thor'
require 'alien'

class AlienStoreCLI < Thor

  default_task :register
  desc "register", "Asks alien to enter their information and stores it in the provided format"

  method_option :code_name, type: :string, required: true
  method_option :blood_color, type: :string, required: true
  method_option :no_of_antennas, type: :numeric, required: true
  method_option :no_of_legs, type: :numeric, required: true
  method_option :home_town, type: :string, required: true
  method_option :file_format, type: :string, required: true

  def register
    Alien.new(options).export
  end

end
