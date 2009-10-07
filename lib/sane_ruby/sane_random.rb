require 'require_all' # a necessary gem

# abstracted from require 'facets/file' ===>
class File

  # Writes the given data to the given path and closes the file.  This is
  # done in binary mode, complementing <tt>IO.read</tt> in standard Ruby.
  #
  # Returns the number of bytes written.
  #
  # CREDIT: facets/Gavin Sinclair

  def self.write(path, data)
    File.open(path, "w") do |file|
      return file.write(data)
    end
  end unless self.respond_to?(:write)

  def self.binread(path)
    File.open(path, "rb") do |file|
      return file.read
    end
  end unless self.respond_to?(:binread)

  def self.binwrite(path, data)
    File.open(path, "wb") do |file|
      return file.write(data)
    end
  end

end


# more helpers
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
  def _dbg
    require 'rubygems'
    require 'pp' # who would want debug without pp? not I
    begin
      require 'ruby-debug'
      debugger
    rescue LoadError => e
      throw "unable to load ruby-debug gem for _dbg... #{e}"
    end
  end

  # a method like puts but all on one line--very much like java's println
  def sprint *args
    print *args
    puts
  end

  def alias_h hash
    hash.each_pair {|new, old|
      alias_method new, old
    }
  end

  def singleton_class
    class << self; self; end
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

if RUBY_VERSION >= '1.9.2'
  $: << '.' # for some reason loading files from the cwd was taken out.  That is not sane.
end
