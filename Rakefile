require 'jeweler'
Jeweler::Tasks.new do |s|

  s.name = %q{sane}
  s.version = "0.2.2"

  # 0.2.2: add Regex+Regex, bug fixes
  # 0.2.0:
  #       add irb simple prompt, auto indent by default [sane defaults!]
  #     1: add $: << '.', don't do Hash#hash on 1.9
  # 0.1.
  #     9 add irb autocompletion on by default [if you're in an IRB session, that is]
  #     8 add Hash#hash
  #     7 add File.binwrite
  #       rename aliaz alias_h [ for alias hash ]
  #     6 add File.binread [1.9 has it, 1.8 not]
  #     5 remove #sum method [not rails compat]
  #     4 add _dbg as a file
  # 0.1.3 require 'pp' with _dbg
  # 0.1.2 add singleton_class
  # 0.1.1 add aliaz

  s.homepage = 'http://github.com/rogerdpack/sane_ruby'
  s.authors = ["Roger Pack"]
  s.description = s.summary =  %q{Helper methods for ruby to make it easier to work with out of the box--things that are missing from core but should be there}
  s.email = ["rogerdpack@gmail.com"]

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