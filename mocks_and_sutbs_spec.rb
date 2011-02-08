class MocksAndSutbsSpec1
  def valid?
    false
  end
  
  def find criteria
    "1"
  end
end



describe MocksAndSutbsSpec1 do
  let(:myObject) { MocksAndSutbsSpec1.new }
                   
  it "should be valid" do
    myObject.stub(:valid?).and_return true
    myObject.valid?.should be_true
  end
  
  it "should find 2" do
    myObject.stub(:find).with(2).and_return 2
    result = myObject.find 2
    result.should == 2
  end
  
  #Successive calls can return different values:
  #foo.stub(:bar).and_return 1, 2, 3
  #foo.bar
    # => 1
  #foo.bar
    # => 2
  #foo.bar
    # => 3
  #foo.bar
    # => 3
  
  it "should stub all methods so that they do not throw exceptions" do
    foo = double(:foo, :size => 3).as_null_object
    foo.upcase
  end
  
  
end




