require 'require_all' # require_all, require_rel
require_rel 'enumerable-extra' # for #map(:symbol)

# a method like puts but all on one line--very much like java's println, quite useful
def println *args
 print *args
 puts
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

 # for this to work in 1.9, please follow directions: http://wiki.github.com/mark-moseley/ruby-debug
 # for 1.8, run gem install ruby-debug
 def _dbg
   require 'rubygems'
   require 'ruby-debug'
   debugger
 end

end

if RUBY_VERSION < '1.9'
  # TODO require 'unique_require' # require things in the right order, on 1.8.x
end
