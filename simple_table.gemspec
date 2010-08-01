Gem::Specification.new do |s|
  s.name         = "simple_table"
  s.version      = '0.0.3'
  s.authors      = ["Sven Fuchs", "Raphaela Wrede"]
  s.email        = "raphaela.wrede@gmail.com"
  s.homepage     = "http://github.com/rwrede/simple_table"
  s.summary      = "[summary]"
  s.description  = "[description]"

  s.files        = Dir['{app,config,lib,public}/**/*']
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'
  s.add_dependency 'activesupport', '~> 3.0.0.beta4'
end