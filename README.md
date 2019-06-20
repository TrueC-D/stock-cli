#To do 
  Original page that has the categories leads to a sublink, click sub link then get to page with listed stocks.  Need to scrape 1) category names, category links on 1st page, 1.5) each.with_index, collect category names and let user select category by entering the associated index key.  Use .send method 2) main category link on 2nd page, 3) Stock names on 3rd page, 4) associate indecies with this name, and 4) % change for associated stock. 
  
  Establish a Has many through relationship.  Patrons have many stocks.  Patrons have many categories through stocks.  Stocks belong to Patrons, Stocks belong to categories.  Categories have many stocks, categories have many stocks through patrons.
  
  Most important to hilight is that patrons have many stocks through categoreies.


# Stock::Cli

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/cli`. To experiment with that code, run `./bin/run` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stock-cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stock-cli

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'alethea'/stock-cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Stock::Cli project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'alethea'/stock-cli/blob/master/CODE_OF_CONDUCT.md).
