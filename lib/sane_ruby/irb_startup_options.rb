if defined? IRB
  require 'irb/completion'
  IRB.conf[:AUTO_INDENT] = true
  IRB.conf[:PROMPT_MODE] = :SIMPLE 
  #require 'irb/ext/save-history' # this one might mess with peoples' local settings of it tho...
end
