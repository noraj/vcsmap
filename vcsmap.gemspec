# frozen_string_literal: true

require_relative 'lib/vcsmap/version'

Gem::Specification.new do |s|
  s.name        = 'vcsmap'
  s.version     = Vcsmap::VERSION
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ['MIT']
  s.summary     = 'Scans public repositories for sensitive information.'
  s.description = 'A plugin-based tool to scan public version control systems for sensitive information.'
  s.authors     = ['Melvin LAMMERTS']
  s.email       = 'hi@melvin.sh'
  s.homepage    = 'https://github.com/melvinsh/vcsmap'

  s.files       = Dir['bin/*', 'lib/**/*.rb', 'LICENSE.md']
  s.bindir      = 'bin'
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.required_ruby_version = ['>= 3.0.0', '< 4.0']

  s.add_runtime_dependency('csv', '~> 3.3')
  s.add_runtime_dependency('http', '~> 5.2')
  s.add_runtime_dependency('nokogiri', '~> 1.16', '>= 1.16.7')
  s.add_runtime_dependency('ostruct', '~> 0.6.1')
  s.add_runtime_dependency('tty-progressbar', '~> 0.18.2')
  s.add_runtime_dependency('tty-table', '~> 0.12.0')
end
