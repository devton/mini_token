# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mini_token}
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Antonio Roberto Silva"]
  s.date = %q{2010-10-16}
  s.description = %q{Generate simple tokens for short url and other things}
  s.email = %q{forevertonny@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".bundle/config",
     ".document",
     ".gitignore",
     ".rvmrc",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "db/mini_token.db",
     "db/mini_token_test.db",
     "lib/mini_token.rb",
     "mini_token.gemspec",
     "test/helper.rb",
     "test/test_mini_token.rb"
  ]
  s.homepage = %q{http://github.com/devton/mini_token}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Simple token generator}
  s.test_files = [
    "test/helper.rb",
     "test/test_mini_token.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sequel>, [">= 3.16.0"])
      s.add_runtime_dependency(%q<sqlite3-ruby>, [">= 1.3.1"])
    else
      s.add_dependency(%q<sequel>, [">= 3.16.0"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 1.3.1"])
    end
  else
    s.add_dependency(%q<sequel>, [">= 3.16.0"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 1.3.1"])
  end
end

