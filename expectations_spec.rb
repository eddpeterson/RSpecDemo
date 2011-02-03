describe "Expectations2" do
  it ".." do
    
    (2 + 2).should == 4
    "foo".should_not == "bar"
    
    true.should be_true
    false.should be_false
    nil.should be_nil
    "".should be
    
    Math::PI.should be_within(0.01).of(22.0/7)
    
    7.should == 7
    [1, 2, 3].should == [1, 2, 3]
    "this is a string".should =~ /^this/
    "this is a string".should_not =~ /^that/
    String.should === "this is a string"
    
    37.should be == 37
    37.should be < 100
    37.should be <= 38
    37.should be >= 2
    37.should be > 7
    
    # These two are identical:
    [1, 2, 3].should have(3).items
    [1, 2, 3].should have_exactly(3).items

    [1, 2, 3].should have_at_least(2).items
    [1, 2, 3].should have_at_most(4).items

    # "items" is just syntactic sugar:
    [1, 2, 3].should have(3).numbers

    [1, 2, 3].should include(2)
    [1, 2, 3].should include(1, 2)
    {:a => 1, :b => 2}.should include(:a => 1)

    [1, 2, 3].should =~ [2, 3, 1]
    [:a, :c, :b].should_not =~ [:a, :c]
    
    "Edijs".should include("ij")
    # These two are identical:
    "This is a string".should =~ /^This/
    "This is a string".should match(/^This/)
    
    [].should be_empty
    42.should be_even
    {:a => 1, :b => 2}.should have_key(:a)
    
    "foo".should be_an_instance_of(String)     # Exact class
    "foo".should_not be_an_instance_of(Object) #

    "foo".should be_a_kind_of(Object)          # Match subclasses
    "foo".should be_an(Object)                 #

    "foo".should respond_to(:upcase)
    "foo".should respond_to(:upcase, :downcase)
    "foo".should respond_to(:upcase).with(0).arguments
    
    # WHAT'S THAT ???
    #expect{ array << 42 }.to change{ array.size }.from(0).to(1)
    #expect{ array << 42 }.to change{ array.size }.by(1)
    
    expect { 4/2 }.to_not raise_error
    expect { 4/0 }.to raise_error
    expect { 4/0 }.to raise_error(ZeroDivisionError)
    expect { 4/0 }.to raise_error(ZeroDivisionError, "divided by 0")

    expect { throw :foo }.to throw_symbol
    expect { throw :foo }.to throw_symbol(:foo)
    expect { throw :foo, 7 }.to throw_symbol(:foo, 7)
    
    # obj.should exist
    Pathname("/etc/passwd").should exist
    
    # not recommended due to undescriptive error message
    10.should satisfy { |v| v % 5 == 0 }
    
    
    
  end
end

