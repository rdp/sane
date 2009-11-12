# some uber useful gems
require 'rubygems'
require 'require_all'
require 'backports/tools.rb' # backports
require 'backports/1.9/io' # File.binread
require 'hash_set_operators' # not sure why these aren't in core
require_rel 'sane' # require all sub files

class Sane
 def self.install_local!
   require 'fileutils'
   require 'rbconfig'

   Dir.chdir File.dirname(__FILE__) do
     for file in Dir['*'] do
       FileUtils.cp_r file, Config::CONFIG['sitelibdir'] # copy subdirs, too
     end
     installed_sane =  Config::CONFIG['sitelibdir'] + '/' + 'sane.rb'
     old_contents = File.read installed_sane
     File.write installed_sane, "require 'faster_rubygems'\n" + old_contents
     puts 'hardened sane with this gem version (and faster rubygems) to ' + installed_sane

   end

 end

end


