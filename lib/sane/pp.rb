# stolen from pp.rb
# load 'pp' library on demand
module Kernel
  private
  def pp(*objs)
     undef pp # avoid a warning
     require('pp') || load('pp.rb') # allow for them to have loaded pp before sane
     pp(*objs) # use the new method
  end 

end
