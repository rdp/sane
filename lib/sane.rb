
# currently accepts either a glob [something with * in it]
# or a filename
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