# extracted from from http://blog.playlouder.com/2008/05/07/an-interesting-ruby-hash-semantics-gotcha/

if RUBY_VERSION < '1.9' # not sure if this is needed for 1.8.7 or not...
# see http://kpumuk.info/ruby-on-rails/memo-5-use-ary-uniq-method-carefully-in-ruby and test it :)

class Hash
 def hash
   inject(0) {|hash,pair| hash ^ pair.hash}
 end

 def eql?(other)
   self == other
 end
end

end