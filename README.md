# EnumTemporality

This gem is an extension of Rails' enum. It adds 2 new methods on records and 2 new scopes.

If we take a Book class that have the following enum: `enum status: { proposed: 0, written: 1, published: 2 }`, then we define:
- `Book.status_before_published` that returns every `Book` where the status is before `published`
- `Book.status_after_published` that returns every `Book` where the status is after `published`
- `new_book.status_before_published?` that returns `true` if `new_book` status is before `published`
- `new_book.status_after_published?` that returns `true` if `new_book` status is after `published`

The main goal of this gem is to replace the `new_book.status_before_type_cast < Book.statuses['published']` syntax that I find way too verbose and annoying to write.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'enum_temporality'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install enum_temporality

## Usage

Just add the option `_temporality: true` to your existing enum, for exemple 
```ruby
  enum status: { 
    proposed: 0, 
    written: 1, 
    published: 2 
  }, _temporality: true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MaxenceFlatlooker/enum_temporality.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT) (see LICENSE.txt).
