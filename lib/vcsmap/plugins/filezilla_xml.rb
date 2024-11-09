# frozen_string_literal: true

module Vcsmap
  module Plugin
    class FilezillaXml < Vcsmap::Plugin::BasePlugin
      def initialize
        @search_string = 'filename:filezilla.xml+Pass'
        @host_regex = %r{<Host>(.*)</Host>}
        @username_regex = %r{<User>(.*)</User>}
        @password_regex = %r{<Pass>(.*)</Pass>}
        @encoded_password_regex = %r{<Pass encoding="base64">(.*)</Pass>}
        @port_regex = %r{<Port>(.*)</Port>}
      end

      def credentials(file)
        @host = capture_match(@host_regex, file)
        @user = capture_match(@username_regex, file)
        @pass = find_password(file)
        @port = capture_match(@port_regex, file)
        ['FTP', @host, @port, @user, @pass]
      end

      def table_header
        %w[Protocol Host Port Username Password]
      end

      private

      def find_password(file)
        @pass = capture_match(@password_regex, file)
        @base64_pass = capture_match(@encoded_password_regex, file)

        return @pass unless @pass.empty?
        return Base64.decode64(@base64_pass) unless @base64_pass.empty?

        ''
      end
    end
  end
end
