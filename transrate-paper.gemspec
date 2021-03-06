Gem::Specification.new do |gem|
  gem.name          = 'transrate-paper'
  gem.authors       = [ "Richard Smith-Unna", "Chris Boursnell" ]
  gem.email         = "rds45@cam.ac.uk"
  gem.licenses      = ["MIT"]
  gem.homepage      = 'https://github.com/Blahah/transrate-paper'
  gem.summary       = "transrate paper and all code to generate from scratch"
  gem.description   = "paper to test transrate"
  gem.version       = "0.1"

  gem.files = `git ls-files`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = %w( lib )

  gem.add_dependency 'distribution', '~> 0.7', '>= 0.7.1'
  gem.add_dependency 'crb-blast', '~> 0.5', '>= 0.5.0'
  gem.add_dependency 'fixwhich', '~> 1.0', '>= 1.0.2'
  gem.add_dependency 'bindeps', '~> 1.1', '>= 1.1.2'
  gem.add_dependency 'transrate', '>= 1.0.0.beta3'
  gem.add_dependency 'trollop', '~> 2.1', '>= 2.1.1'

  gem.add_development_dependency 'rake', '~> 10.3', '>= 10.3.2'
  gem.add_development_dependency 'turn', '~> 0.9', '>= 0.9.7'
  gem.add_development_dependency 'simplecov', '~> 0.8', '>= 0.8.2'
  gem.add_development_dependency 'shoulda-context', '~> 1.2', '>= 1.2.1'
  gem.add_development_dependency 'coveralls', '~> 0.7'
end
