# NestedDelete

NestedDelete is a single-file gem that uses Ruby Refinements to provide
an easy way to delete 1-n provided keys from a nested hash structure

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nested_delete'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nested_delete

## Usage

```
  
  class Foo
    using NestedDelete
  end

  hash = {:one => 1, "two" => "2", :ary => [{three: 3}]}
  hash.nested_delete!(:one, "two", :three)
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
