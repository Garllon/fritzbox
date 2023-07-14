module Fritzbox
  class Switch
    include HTTParty
    base_uri 'http://fritz.box'

    COMMANDS = {
      on: 'setswitchon',
      off: 'setswitchoff',
      state: 'getswitchstate'
    }

    def self.get_all_devices
      url = self.get("/webservices/homeautoswitch.lua?sid=#{Fritzbox.configuration.session.id}&switchcmd=getswitchlist")
    end

    def initialize(ain)
      @ain = ain
    end

    def name
      return @name if @name

      response = get_request(command: 'getswitchname')
      raise "Error: No device with ain: #{@ain} found." if response.code != 200

      @name = response.body
    end

    COMMANDS.each do |method_name, command_string|
      define_method(method_name) do
        get_request(command: command_string)
      end
    end

    private

    def get_request(command:)
      url = "/webservices/homeautoswitch.lua?sid=#{Fritzbox.configuration.session.id}&switchcmd=#{command}&ain=#{@ain}"
      self.class.get(url)
    end
  end
end