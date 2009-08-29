# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sane}
  s.version = "0.1.6" 
  
  # 0.1.
  #     6 add File.binread [1.9 has it, 1.8 not]
  #     5 remove #sum method [not rails compat]
  #     4 add _dbg as a file
  # 0.1.3 require 'pp' with _dbg
  # 0.1.2 add singleton_class
  # 0.1.1 add aliaz

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.homepage = 'http://github.com/rogerdpack/sane_ruby'
  s.authors = ["Roger Pack"]
  s.description = s.summary =  %q{Helper methods for ruby to make it easier to work with out of the box--things that are missing from core but should be there}
  s.email = ["rogerdpack@gmail.com"]
  s.extra_rdoc_files = ["README"]
  s.files = ["README", "lib/sane.rb", "lib/sane_ruby/enumerable-extra.rb", "lib/_dbg.rb"]
  s.rdoc_options = ["--main", "README"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      # TODO gemify unique_require, then uncomment this line
      # s.add_runtime_dependency(%q<unique_require>)

      s.add_runtime_dependency("require_all", ['>= 1.1'])
      # s.add_development_dependency(%q<newgem>, [">= 1.4.1"])

      # don't need it yet..too big...maybe?
      #s.add_runtime_dependency("facets")
    else
      #  s.add_dependency(%q<ParseTree>, [">= 3.0.3"])
    end
  else
    # s.add_dependency(%q<ParseTree>, [">= 3.0.3"])
  end
end
