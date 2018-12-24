# Next Steps

Moving forward, I would clean up this code so it is less repetitive, especially the EmailParser::Email.print_emails method which is rather long and complex. After this I would make the gem more user friendly -- easier to read and aware of user errors (ex. they misspell the name of a conversation). I would also do a fair amount of quality control to be 100% confident in my code and if the parsing mechanism would hold true for every incoming email.

# EmailParser

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/email_parser`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'email_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install email_parser

## Usage

To begin the program, run 'ruby bin/email_parser' in the terminal and follow the prompts. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<github username>/email_parser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EmailParser project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<github username>/email_parser/blob/master/CODE_OF_CONDUCT.md).
