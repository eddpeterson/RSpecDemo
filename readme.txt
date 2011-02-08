rspec bowling_spec.rb --color --format nested
rspec ./ --color --format nested

# We don’t want to type --colour every time!
# Put common options in .rspec in the project root.

gem install fuubar
rspec -f Fuubar ./

# writes current folders (./) test results in specs.html file
rspec -f Fuubar -f html -o specs.html ./

# profile all specs times
rspec --profile ./

# run spec on one file for specific line
rspec -f doc ./rain_spec.rb:8

# Run only specs tagged ‘current’
rspec --tag current ./

# Run specs not tagged ‘current’
rspec --tag ~current ./

# filter by tag value
rspec --tag filter:1 ./

# filter by name <stuff>
rspec -e stuff spec/something_spec.rb

# returns self for unstubbed methods
foo = double(:foo, :size => 3).as_null_object 
foo.upcase


# Stubbing a method chain
# Often indicates law of demeter violations, but is useful for cases like named scopes, eg:
Article.recent.published
# You could use multiple doubles:
Article.stub(:recent).and_return double(:published => articles)
# But it’s easier to stub the whole chain at once:
Article.stub_chain(:recent, :published).and_return articles
Article.stub_chain("recent.published").and_return articles


# Expecting method calls
describe "Form" do
  let (:model) { double :model }
  let (:form) { Form.new model }
 
  context "when submitted" do
    it "saves the model" do
      model.should_receive(:save)
      form.submit
    end
  end
end

# Expecting calls with arguments
describe "Form" do
  let (:logger) { double :logger }
  let (:form) { Form.new logger }
 
  context "when submitted" do
    it "logs the event" do
      logger.should_receive(:info).with "Form submitted"
      form.submit
    end
  end
end

# You can specify call counts:
foo.should_receive(:bar).once
foo.should_receive(:bar).at_least(3).times

# Arguments can be less strict:
foo.should_receive(:bar).with(anything(), an_instance_of(String))
foo.should_receive(:bar).with(hash_including(:a => 1))
foo.should_receive(:bar).with(/^[a-z]*$/)

# Mock methods can return values just like stubs:
foo.should_receive(:bar).and_return "baz"

# Occasionally you need methods to be called in the right order:
it "logs the event" do
  logger.should_receive(:info).with(form.id).ordered
  logger.should_receive(:info).with("Form submitted").ordered
  form.submit
end

# If you want to experiment with mocks and stubs in irb:
require "rspec/mocks/standalone"



### Rails
rspec-rails is a drop-in replacement for Rails’s built-in testing.

Add it to your Gemfile:

group :test, :development do
  gem "rspec-rails", "~> 2.4"
end
Then run:

rails generate rspec:install


Fake ActiveRecord objects are useful in controller specs:

article = mock_model Article, :text => "Hello world"
Testing errors:

widget.should have(1).error_on(:name)


View integration
Views are stubbed by default. To render them, use render_views:

describe WidgetsController do
  render_views
 
  describe "index" do
    it "renders the index template" do
      get :index
      response.should contain("Listing widgets")
    end
  end
end



Anonymous controller
To test behaviour in ApplicationController, you can define actions on the fly in your spec:

describe ApplicationController do
  controller do
    def index
      raise ApplicationController::AccessDenied
    end
  end
 
  describe "handling AccessDenied exceptions" do
    it "redirects to the /401.html page" do
      get :index
      response.should redirect_to("/401.html")
    end
  end
end



Access helper methods via the helper object:

describe ApplicationHelper do
  describe "#page_title" do
    it "returns the value of @title" do
      assign(:title, "My Title")
      helper.page_title.should eql("My Title")
    end
  end
end


Accessing other helpers
If the helper under test calls methods in other helpers, you’ll need to include them in your spec:

describe SomeHelper do
  helper do
    include ApplicationHelper
  end
 
  ...
end


Rails routing
{ :get => "/" }.should route_to(:controller => "welcome")
 
{ :get => "/widgets" }.should_not be_routable
 
{:get => new_widget_path}.should route_to(
  :controller => "widgets", :action => "new")
