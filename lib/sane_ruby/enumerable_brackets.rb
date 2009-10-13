module Enumerable
 def [](pos)
   idx = 0
   self.each{|item|
     return item if idx == pos
     idx += 1
   }
 end
end
 
