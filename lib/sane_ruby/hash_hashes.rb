# extracted from from http://blog.playlouder.com/2008/05/07/an-interesting-ruby-hash-semantics-gotcha/

class Hash
 def hash
   inject(0) {|hash,pair| hash ^ pair.hash}
 end

 def eql?(other)
   self == other
 end
end