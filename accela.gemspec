$:.push File.expand_path('../lib', __FILE__)
require 'accela/version'

Gem::Specification.new do |s|
  s.name           = 'accela'
  s.summary        = 'Accela Ruby Client Library'
  s.description    = 'This gem provides access to the HTTP Accela API'
  s.version        = Accela::Version::String
  s.author         = 'Accela'
  s.email          = 'devsupport@accela.com'
  s.has_rdoc       = false
  s.files          = Dir.glob ['README.md', 'LICENSE', 'lib/**/*.{rb}', 'spec/**/*', '*.gemspec']
  s.homepage       = 'https://developer.accela.com/'
  s.license        = 'MIT'
  s.add_dependency   'httparty', '~> 0.13'
end
