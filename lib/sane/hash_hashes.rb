# extracted from from http://blog.playlouder.com/2008/05/07/an-interesting-ruby-hash-semantics-gotcha/

if RUBY_VERSION < '1.8.7'
# see http://kpumuk.info/ruby-on-rails/memo-5-use-ary-uniq-method-carefully-in-ruby 

class Hash
 def hash
   inject(0) {|hash,pair| hash ^ pair.hash}
 end

 def eql?(other)
   self == other
 end
end

end