require 'require_all' # require_all, require_rel gem
require_rel 'enumerable-extra' # for #map(:symbol)

# require 'facets/file' ===>
class File

  # Writes the given data to the given path and closes the file.  This is
  # done in binary mode, complementing <tt>IO.read</tt> in standard Ruby.
  #
  # Returns the number of bytes written.
  #
  # CREDIT: Gavin Sinclair

  def self.write(path, data)
    File.open(path, "wb") do |file|
      return file.write(data)
    end
  end unless self.respond_to?(:write)

end



class Object

  # a helper for collection.include?
  def in? collection
    collection.include?(self)
  end unless respond_to? :in

  # ex: assert(some statement)
  # or
  # assert(some statement, "some helper string")
  def assert(should_be_true, string = nil)
    if(!should_be_true)
      raise "assertion failed #{string}"
    end
  end unless respond_to? :assert

  # helper to bring up a debugger
  # for this to work in 1.9, please follow directions: http://wiki.github.com/mark-moseley/ruby-debug
  # for 1.8, run gem install ruby-debug
  def _dbg
    require 'rubygems'
    require 'ruby-debug'
    debugger
  end

  # a method like puts but all on one line--very much like java's println, quite useful
  def println *args
    print *args
    puts
  end

  def aliaz hash
    hash.each_pair {|new, old|
      alias_method new, old
    }
  end
end

if RUBY_VERSION < '1.9'
  # TODO require 'unique_require' # require things in the right order, on 1.8.x
end

# taken from http://oldrcrs.rubypal.com/rcr/show/309

module Kernel
  BASE_DIR = Dir.getwd
  def __DIR__
    dir = (/^(.+)?:\d+/ =~ caller[0]) ? File.expand_path(File.dirname($1), BASE_DIR) : nil
    dir += '/' if dir
    dir
  end unless defined?(__DIR__)
end
