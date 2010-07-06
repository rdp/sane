class Thread
  def self.join_all
    Thread.each{|t| t.join unless t == Thread.current}
  end
end