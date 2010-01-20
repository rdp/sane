$:.unshift File.expand_path('../lib')
require 'rubygems'
require 'fast_require' if RUBY_VERSION >= '1.9'
require File.dirname(__FILE__) + '/../lib/sane'
require 'spec/autorun'

class Object
  alias :yes :should   # a.yes == [3]
  def yes!
    self
  end
end

class FalseClass
  def yes!
    raise 'failed' # a.true!
  end
end

describe Sane do

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

  it "should have __dir__ too" do
    __dir__.should_not be_nil
  end

  class A
    def go; 3; end
  end

  it "should have a singleton_class method" do
    class A; end
    A.singleton_class.module_eval { def go; end }
    A.go
  end

  it "should have a binread method" do
    File.open("bin_test", "wb") do |f|; f.write "a\r\n"; end
    assert File.binread("bin_test") == "a\r\n"
  end  

  it "should have a binwrite method" do
   File.binwrite 'bin_test', "a\r\n"
   assert File.binread("bin_test") == "a\r\n"
  end

  it "should hash hashes right" do
    a = {} # this fails in 1.8.6, or works, rather

    a[{:a => 3, :b => 4}] = 3
    assert a[{:b => 4, :a => 3}] == 3
    assert a[{:b => 3, :a => 4}] == nil
    a = {:a => 3}
    a - {:a => 4}
    assert a.length == 1
 
  end

# my first implementation of this was *awful* LOL
# leave out for now
# just use enumerator.to_a
#  it "should allow for brackets on enumerators" do
#    require 'backports' # ugh
#    assert "ab\r\nc".lines[0] == "ab\r\n"
#  end

  it "should have verbose looking float#inspect" do
     assert(  (1.1 - 0.9).inspect.include?('0.2000000')) # 0.20000000000000006661 or something close to it
  end

  it "should return false if you call File.executable? non_existent_file" do
    assert !File.executable?('nonexistent')
  end

  it "should have ave method" do
    [1,2,3].ave.should == 2
  end

  it "should have a pps method " do
    pps 1,2,3
  end

  it "should allow for map_by" do
   ["1"].map_by(:to_i).should == [1]
   ["1"].collect_by(:to_i).should == [1]
   a = ["1"]
   a.map_by!(:to_i)
   a.yes == [1]
   a == [1]
  end
  
  it "should allow for contain? and include?" do
    assert "a".include?( "a")
    assert "a".contain?( "a")
    assert !("a".contain? "b")
  end

  it "should have include and contain for arrays" do
    assert ['a'].include?( "a")
    assert ['a'].contain?( "a")
  end

  it "should have blank? and empty? for arrays and strings" do
    assert ''.blank?
    assert ''.empty?
    assert [].blank?
    assert [].empty?
  end

  it "should have a select!" do
   a = [1,2,3].select!{|n| n < 3}
   a.length.should == 2
   a = [1,2,3]
   a.select!{|n| n < 3}
   a.length.should == 2
  end

  it "should have File.filename" do
    File.filename("abc/ext.xt").should == "ext.xt"
  end
  
  it "should have an auto-loading pp method" do
    pp 1,2,3
    pp 1,2,3
  end
  
  it "should work if you require 'pp' before hand" do
    system("ruby -v -I../lib files/pp_before_hand.rb").should be_true    
  end
  
  it "should have require_relative" do
    FileUtils.touch 'go.rb'    
    require_relative 'go.rb'
    FileUtils.rm 'go.rb'
  end
  
  it "should be able to require from a subdir" do
   require_relative 'subdir/go.rb'
  end
   
end
