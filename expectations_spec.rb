describe "Expectations2" do
  it ".." do
    
    (2 + 2).should == 4
    "foo".should_not == "bar"
    
    true.should be_true
    false.should be_false
    nil.should be_nil
    "".should be
    
    Math::PI.should be_within(0.01).of(22.0/7)
    
    
  end
end