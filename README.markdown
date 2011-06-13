# ClientSideValidations for Rails 2.x #

This gem provides a thin wrapper for [ClientSideValidations](https://github.com/bcardarella/client_side_validations)

## Installation ##

*This gem requires the [jquery-ujs](https://github.com/rails/jquery-ujs) gem. Please install that before continuing.*

Add the gem to your `config/environment.rb` file:

```ruby
  config.gem 'client_side_validations-rails_2', :lib => 'client_side_validations/rails_2'
```

Run the `gems:install` `rake` task:

```
rake gems:install
```

Run the generator

```
script/generate client_side_validations
```

This will install two files

```
config/initializers/client_side_validations.rb
public/javascripts/rails.validations.js
```

## Usage ##

Please follow the instructions for [Rails 3.0 on the ClientSideValidations README](https://github.com/bcardarella/client_side_validations)

## Legal ##

Brian Cardarella &copy; 2011

[@bcardarella](http://twitter.com/bcardarella)

[Licensed under the MIT license](http://www.opensource.org/licenses/mit-license.php)

