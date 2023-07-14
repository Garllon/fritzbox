module Fritzbox
  class Session
    include HTTParty
    base_uri 'http://fritz.box'

    TIMEOUT_MINUTES = 60
    LOGIN_PATH      = '/login_sid.lua'
    DEFAULT_SID     = '0000000000000000'

    def id
      return @id if valid?

      @id = get_new_id
    end

    private

    def get_new_id
      response = self.class.get(LOGIN_PATH)
      sid = Nokogiri::XML(response.body).xpath('//SID').text

      if sid == DEFAULT_SID
        username = Nokogiri::XML(response.body).xpath('//User').text
        challenge = Nokogiri::XML(response.body).xpath('//Challenge').text
        response = self.class.get("#{LOGIN_PATH}?username=#{username}&response=#{create_fritzbox_response(challenge)}")
        sid = Nokogiri::XML(response.body).xpath('//SID').text
        raise 'Login failed' if sid == DEFAULT_SID
      end

      @TIMEOUT_TIME = Time.now + TIMEOUT_MINUTES

      sid
    end

    def create_fritzbox_response(challenge)
      "#{challenge}-#{Digest::MD5.hexdigest("#{challenge}-#{Fritzbox.configuration.password}".encode('UTF-16LE'))}"
    end

    def valid?
      return false if @TIMEOUT_TIME.nil?
      @TIMEOUT_TIME > Time.now
    end
  end
end