RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    actual % expected == 0
  end
end
 
describe 10 do
  it { should be_a_multiple_of(5) }
end
