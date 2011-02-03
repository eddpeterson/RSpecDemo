

describe  "Something" do 
  before :all do
    puts "per-context setup"
  end
  
  before do 
    puts "per-example setup"
  end
  
  after do 
    puts "per-example teardown"
  end
  
  after :all do
    "per-context teardown"
  end
  
  
  
  it "spec 1" do 
  end
  
  it "spec 2" do
  end
  
end