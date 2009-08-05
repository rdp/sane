require File.dirname(__FILE__) + '/../lib/sane'

class TestSane; end

describe TestSane do

  before do
    #Object.send(:remove_const, 'Klass') rescue nil
  end

  it "should have working __DIR__" do
    __DIR__.should_not == nil
  end

  it "should write to files" do
   filename = __DIR__ + '/test'
   File.write(filename, "abc")
   assert(File.exist?(filename))
   File.delete filename
  end

  class A
    def go; 3; end
    aliaz :go2 => :go
  end

  it "should aliaz right" do
    A.new.go2.should == 3
  end
   
end
