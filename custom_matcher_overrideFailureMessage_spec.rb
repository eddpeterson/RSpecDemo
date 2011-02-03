RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    actual % expected == 0
  end
 
  failure_message_for_should do |actual|
    "Hei, expected that #{actual} would be a multiple of #{expected}"
  end
 
  failure_message_for_should_not do |actual|
    "Hei, expected that #{actual} would not be a multiple of #{expected}"
  end
 
  description do
    "Hei, be multiple of #{expected}"
  end
end


RSpec::Matchers.define :be_a_multiple_of_3 do
  match do |number|
    number % 3 == 0
  end
end


describe 3 do
  it { should be_a_multiple_of_3 }
end

describe 3 do
  it { should be_a_multiple_of 4 }
end