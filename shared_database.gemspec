# frozen_string_literal: true

# No Copyright 2023

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)  # search 
require "shared_database/version"

Gem::Specification.new do |s|
    s.name        = 'shared_database'
    s.version     = SharedDatabase::VERSION
    s.summary     = "Defines a shared database across projects using ActiveRecord and Postgresql."
    s.description = "Custom Gem that defines a database using ActiveRecord and Postgresql. The purpose is maintain consistency of schema of a shared database across multiple different Ruby applications, using Rails framework and non-Rails (native Ruby)."
    s.authors     = ["Javier Heng", "Gan Chin Song"]
    s.email       = ["1006027@mymail.sutd.edu.sg", "1006283@mymail.sutd.edu.sg"]
    s.files       = Dir.glob("lib/**/.rb") + Dir.glob("bin/*") + Dir.glob("*.md") + Dir.glob("docs/*.md")
    s.require_paths = %w[lib]
    # s.executables = 
    # s.bindir

    s.required_ruby_version = ">=2.7.0"

    s.add_dependency 'pg', '~> 0.20'
    s.add_dependency 'activerecord', '~> 4.2.11'
    s.add_dependency 'dotenv'
    s.add_dependency 'bigdecimal', '~> 1.4'

    s.add_development_dependency 'rake'
    s.add_development_dependency 'rspec'
    s.add_development_dependency 'irb'
    s.add_development_dependency 'sqlite3', '~> 1.3.0'

    s.homepage    = 'https://github.com/Service-Design-Studio/1d-final-project-2023-sds-2023-team-06'
    s.metadata    = { "source_code_uri" => 'https://github.com/Service-Design-Studio/1d-final-project-2023-sds-2023-team-06' }
  end