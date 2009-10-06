class Regexp
   def +(other)
     if other.is_a?(Regexp)
       if self.options == other.options
         Regexp.new(source + other.source, options)
       else
         Regexp.new(source + other.to_s, options)
       end
     else
       Regexp.new(source + Regexp.escape(other.to_s), options)
     end
   end
end