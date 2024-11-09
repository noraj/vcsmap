# frozen_string_literal: false

require 'minitest/autorun'
require 'vcsmap'

describe Vcsmap::Plugin::AwsAccessToken do
  let(:plugin) { Vcsmap::Plugin::AwsAccessToken.new }

  let(:file) do
    <<-EOS
      [contoso]
      aws_access_key_id = AKIAED8B369A90EDAB2A
      aws_secret_access_key = EAB37ae33174B8A2B0f0/3798C78ca26EAB37AE3
    EOS
  end

  describe '#capture_match' do
    it 'must return the matched AWS key pair' do
      credentials = plugin.credentials(file)

      expected = ['AKIAED8B369A90EDAB2A', 'EAB37ae33174B8A2B0f0/3798C78ca26EAB37AE3']
      expect(credentials).must_equal expected
    end
  end
end
