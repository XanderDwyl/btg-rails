# -*- encoding: utf-8 -*-
# stub: ultrahook 0.1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "ultrahook"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Vinay Sahni"]
  s.date = "2015-07-20"
  s.description = "UltraHook lets you receive webhooks on localhost.  It relays HTTP POST requests sent from a public endpoints (provided by the ultrahook.com service) to private endpoints accessible from your computer."
  s.email = "vinay@sahni.org"
  s.executables = ["ultrahook"]
  s.files = ["bin/ultrahook"]
  s.homepage = "http://www.ultrahook.com"
  s.licenses = ["Commercial"]
  s.rubygems_version = "2.5.1"
  s.summary = "Receive webhooks on localhost"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 1.8.0"])
    else
      s.add_dependency(%q<json>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<json>, [">= 1.8.0"])
  end
end
