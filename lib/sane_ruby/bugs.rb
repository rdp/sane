
class File
 def File.executable? *args
   File.stat(*args).executable?
 end
end


if RUBY_VERSION == '1.9.1'
 # 1.9.1 bug
 if File.basename(__FILE__).frozen?
   class File
        class << self
         alias :original_basename :basename
        def File.basename *args
           original_basename(*args).dup
        end
         end
   end
 end
           
end


=begin
rubydoctest: non frozen
>> File.basename(__FILE__).frozen?
=> false

=end