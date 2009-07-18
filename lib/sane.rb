# currently accepts either a glob [something with * in it]
# or a filename
# TODO depend on require_all once they fix their issues
# and also don't load themselves apropo on 1.9, etc. etc.
# which I'm not too worried about anyway tho
def require_rel glob # we don't allow for requiring directories currently :)
  dir = File.dirname(caller[0]) + '/'
  if glob.include? '*'
    files = Dir[dir + glob]
  else
    files = [dir + glob]
  end
  for file in files
   if(!File.exist?(file) && File.exist?(file + '.rb'))
    require file + '.rb'
   else
    require file
   end
  end
end

def println *args
 print *args
 puts
end

=begin rdoc

doctest: loads from subdir with a full name
>> dir = Dir.pwd
>> Dir.chdir('..') do; require dir + "/test_sane/load"; end
>> $here
=> 1

doctest: Also,  like a normal require, you can leave off the .rb suffix
>> Dir.chdir('..') do; require dir + "/test_sane/load2"; end 
>> $here2
=> 1

=end


class Object

 # a helper for collection.include?
 def in? collection
   collection.include?(self)
 end
  
 # assert(some statement)
 # or
 # assert(some statement, "some helper string")
 def assert(should_be_true, string = nil)
   if(!should_be_true)
    raise "assertion failed #{string}"
   end
 end
   
end

require_rel 'enumerable-extra' # for #map :symbol
