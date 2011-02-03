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