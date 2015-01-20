# AeroOperatorProviderClient

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'operator_provider_client', path: '(*)/operadorPrestador_gem'
    
    (*) = path a la gem
    
And then execute:

    $ bundle

Or install it yourself as:

    $ gem install operator_provider_client

## Usage
  Add in the model:
  
 
 * Operator.rb
 ```ruby
class Operator < AeroAPI::Operator
end
```

 * Provider.rb
  ```ruby
class Provider < AeroAPI::Provider
end
```


Ej:

  ```ruby
Operator.providers_names
Operator.find(1)
Operator.all

Providers.first
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/aero_operator_provider_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
