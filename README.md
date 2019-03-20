# NestedDelete

NestedDelete is a single-file gem that uses Ruby [Refinements](https://docs.ruby-lang.org/en/2.4.0/syntax/refinements_rdoc.html) to provide
an easy way to delete 1-n provided keys from a nested hash structure.

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
  
  # Add the using refinement call below to your class
  class Foo
    using NestedDelete

    def delete_some_keys

  	hash = {:one => 1, "two" => "2", :ary => [{three: 3}]}
  	hash.nested_delete!(:one, "two", :three)

    end
  end

```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
