unless Kernel.respond_to?(:require_relative, true)
  
module Kernel
  module_function
  def require_relative(relative_feature)
    c = caller.first
    # could be spec.sane.rb:127
    # or e:/abc.rb:127
    e = c.rindex(/:\d+/)
    file = $`
    if /\A\((.*)\)/ =~ file # eval, etc.
      raise LoadError, "require_relative is called in #{$1}"
    end
    absolute_feature = File.expand_path(File.join(File.dirname(file), relative_feature))
    require absolute_feature
  end
end

end