# ConvertUnit
[![Build Status](https://travis-ci.org/tanvir002700/convert_unit.svg?branch=master)](https://travis-ci.org/tanvir002700/convert_unit)
[![Coverage Status](https://coveralls.io/repos/github/tanvir002700/convert_unit/badge.svg?branch=master)](https://coveralls.io/github/tanvir002700/convert_unit?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/6e3e7ff7c7b040d1680d/maintainability)](https://codeclimate.com/github/tanvir002700/convert_unit/maintainability)
[![Gem Version](https://badge.fury.io/rb/convert_unit.svg)](https://rubygems.org/gems/convert_unit) 
[![Downloads](https://img.shields.io/gem/dt/convert_unit.svg)](https://rubygems.org/gems/convert_unit)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/tanvir002700/convert_unit/master.svg)](https://github.com/tanvir002700/convert_unit)
[![license](https://img.shields.io/github/license/tanvir002700/convert_unit.svg)](https://github.com/tanvir002700/convert_unit/blob/master/LICENSE)

## Introduction

A Ruby Library for dealing with different types of unit conversion.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'convert_unit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install convert_unit

## Usage

```ruby
require 'convert_unit'

meter = ConvertUnit::Length.new(1, 'km')
meter.to('km') #=> ConvertUnit::Length.new(1000, 'm')

# Comparisons
ConvertUnit::Length.new(1, 'km') == ConvertUnit::Length.new(1000, 'm')  #=> true
ConvertUnit::Length.new(1, 'km') == ConvertUnit::Length.new(1, 'm')     #=> false

ConvertUnit::Length.new(1, 'km') === ConvertUnit::Length.new(1, 'km')   #=> true
ConvertUnit::Length.new(1, 'km') === ConvertUnit::Length.new(1000, 'm') #=> false

# Arithmetic
ConvertUnit::Length.new(1, 'km') + ConvertUnit::Length.new(1, 'km') == ConvertUnit::Length.new(2, 'km')
ConvertUnit::Length.new(1, 'km') + ConvertUnit::Length.new(1000, 'm') == ConvertUnit::Length.new(2, 'km')
ConvertUnit::Length.new(1000, 'm') + ConvertUnit::Length.new(1, 'km') == ConvertUnit::Length.new(2000, 'm')
ConvertUnit::Length.new(1000, 'm') - ConvertUnit::Length.new(1, 'km') == ConvertUnit::Length.new(0, 'm')

# Valid units argument list
ConvertUnit::Length::UNITS_SYMBOL       #=> { "millimeter"=>"mm", "centimeter"=>"cm", "meter"=>"m",
                                        #     "kilometer"=>"km", "inche"=>"in", "feet"=>"ft", "yard"=>"yd", 
                                        #     "mile"=>"mi" }
                                        #
                                        # both short and full form are accepted in argument and case insensitive.

```

## Available options for conversion

Name       | Units
:---------:|:------------------------------:
Length     | mm, cm, m, km, in, ft, yd, mi
Area       | mm2, cm2, m2, in2, ft2, yd2
Mass       | g, kg, tonne, sh_ton, l_ton, lb, oz
Volume     | cm3, m3, ltr, in3, ft3, us_gal, imp_gal, us_brl
Density    | g/ml kg/m3 lb/ft3 lb/in3
Volumetric Liquid flow | l/sec l/min m3 ft3/min ft3/hr gal/min brl/d
Volumetric Liquid flow | nm3/hr scfh scfm
Mass Flow              | kg/h lb/h kg/s t/h
High Pressure          | bar psi kpa mpa kgf/cm2 mm_hg atm
Low Pressure           | mh2o fth2o cmhg inhg inh2o pa
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tanvir002700/convert_unit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
See the [Contribution Guidelines](https://github.com/tanvir002700/convert_unit/blob/master/CONTRIBUTING.md)


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ConvertUnit project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/tanvir002700/convert_unit/blob/master/CODE_OF_CONDUCT.md).
