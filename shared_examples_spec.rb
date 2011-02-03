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