shared_examples_for "a single-element array" do
  it { should_not be_empty }
  it { should have(1).element }
end

describe ["foo"] do
  it_behaves_like "a single-element array"
end

describe [42] do 
  it_behaves_like "a single-element array"
end




shared_examples_for "a collection object" do
  describe "<<" do
    it "adds objects to the end of the collection" do
      collection << 1
      collection << 2
      collection.to_a.should eq([1,2])
    end
  end
end

describe Array do
  it_behaves_like "a collection object" do
    let(:collection) { Array.new }
  end
end

