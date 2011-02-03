describe 42 do
  it { should be_even }
  it { should_not be_zero }
end

describe Array do
  it { should be_empty }
  it { should have(0).items }
end

describe [1, 2, 3, 3] do
  its(:size) { should == 4 }
  its("uniq.size") { should == 3 }
end


# Explicit subject
describe "An array containint 1, 2, 3, 3" do 
  subject { [1, 2, 3, 3] }
  its(:size) { should == 4 }
end

describe Array do
  it "is empty" do
    subject.should be_empty
  end
end
