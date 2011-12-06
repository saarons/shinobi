# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "shinobi/version"

Gem::Specification.new do |s|
  s.name        = "shinobi"
  s.version     = Shinobi::VERSION
  s.authors     = ["Sam Aarons"]
  s.email       = ["samaarons@gmail.com"]
  s.homepage    = "https://github.com/saarons/shinobi"
  s.summary     = "shinobi allows lpadmin to stay in sync with Columbia's NINJA printing system"

  s.rubyforge_project = "shinobi"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "cups"
  s.add_runtime_dependency "multi_json"
  
  s.add_development_dependency "rake"
end
