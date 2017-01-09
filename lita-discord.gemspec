Gem::Specification.new do |spec|
  spec.name          = 'lita-discord'
  spec.version       = '0.1.0'
  spec.authors       = ['Cas Eliëns']
  spec.email         = ['cas.eliens@gmail.com']
  spec.description   = 'Discord Adapter for Lita'
  spec.summary       = 'Adapter to connect Lita to Discord'
  spec.homepage      = 'https://github.com/cascer1/lita-discord'
  spec.license       = 'GPL-3.0+'
  spec.metadata      = {'lita_plugin_type' => 'adapter'}

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '>= 4.7'
  spec.add_runtime_dependency 'discordrb', '>= 3.1.1'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rspec', '>= 3.0.0'
end
