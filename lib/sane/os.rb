class OS

 # OS.windows?
 # true if on windows [and/or jruby]
 # false if on linux or cygwin
 def self.windows?
  require 'rbconfig'
  RbConfig::CONFIG['host_os'] =~ /mswin|mingw/
 end

end