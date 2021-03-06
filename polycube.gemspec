# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "polycube"
  spec.version       = 0.1
  spec.authors       = ["Jordan Anderson"]
  spec.email         = ["jordandrsn@gmail.com"]

  spec.summary       = "Wrapper for Polycube"
  spec.description   = "Wrapper for Polycube"
  spec.homepage      = "https://github.com/jordanderson"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.require_paths = ["lib", "."]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
