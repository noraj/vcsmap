# frozen_string_literal: true

require 'http'
require 'yaml'
require 'nokogiri'

# TODO: include only if needed
require 'vcsmap/cli'
require 'vcsmap/csv_writer'
require 'vcsmap/progress_bar'

require 'vcsmap/helpers'
require 'vcsmap/plugin'
require 'vcsmap/plugin_list'
require 'vcsmap/provider'

# TODO: work on require_all
require 'vcsmap/plugins/base_plugin'
require 'vcsmap/plugins/aws_access_token'
require 'vcsmap/plugins/facebook_client_secrets'
require 'vcsmap/plugins/filezilla_xml'
require 'vcsmap/plugins/github_sublimesettings'
require 'vcsmap/plugins/google_oauth'
require 'vcsmap/plugins/instagram_tokens'
require 'vcsmap/plugins/solr_dataconfig'
require 'vcsmap/plugins/wordpress_config'

require 'vcsmap/providers/github'

require 'vcsmap/version'
