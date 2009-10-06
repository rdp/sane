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
   File.write(filename, "abc\n")
   assert(File.exist?(filename))
   if RUBY_PLATFORM =~ /mswin|mingw/
     assert(File.binread(filename) == "abc\r\n") # it should have written it out *not* in binary mode
   end
   File.delete filename
  end

  class A
    def go; 3; end
    alias_h :go2 => :go
  end

  it "should aliaz right" do
    A.new.go2.should == 3
  end

  it "should have a singleton_class method" do
    class A; end
    A.singleton_class.module_eval { def go; end }
    A.go
  end

  it "should have a binread method" do
    File.open("test_bin", "wb") do |f|; f.write "a\r\n"; end
    assert File.binread("test_bin") == "a\r\n"
  end  

  it "should have a binwrite method" do
   File.binwrite 'test_bin', "a\r\n"
   assert File.binread("test_bin") == "a\r\n"
  end

  it "should hash hashes right" do
    a = {}

    a[{:a => 3, :b => 4}] = 3
    assert a[{:b => 4, :a => 3}] == 3
    assert a[{:b => 3, :a => 4}] == nil
  end

  it "should allow regexes to be added" do
    /a/ + /b/
  end
 
   
end
