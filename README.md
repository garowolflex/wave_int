# WaveInt

WaveInt class generate linear gradient value in the range. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wave_int'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wave_int

## Usage

For example, get wave value from -10 to 10

```ruby
wave = WaveInt.new(-10, 10)
wave.value(9)  #=> 9
wave.value(10) #=> 10
wave.value(11) #=> 9
wave.value(20) #=> 0
wave.value(21) #=> -1
wave.value(30) #=> -10
wave.value(31) #=> -9
```

The order of parameters is redundant, and second parameter can be omit(default: 0).

```ruby
wave = WaveInt.new(5)
wave_array = 8.times.map {|v| wave.value(v) }
#=> [0, 1, 2, 3, 4, 5, 4, 3]
```

More simply, wave controll with repeat,
use WaveInt#set_value and WaveInt#add.

```ruby
wave = WaveInt.new(5, -2)
wave_array = 8.times.map {|v| wave.add(3) }
#=> [3, 4, 1, -2, 1, 4, 3, 0]

# if you need reset(or set start value), use set_value.
wave.set_value(0)
wave.add(2) #=> 2
wave.set_value(5)
wave.add(6) #=> -1
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/wave_int/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
