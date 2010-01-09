# stolen from pp.rb
# load 'pp' library on demand
module Kernel
  private
  def pp(*objs) # :doc:
    require 'pp'
    pp *objs # use the new method
  end
end
