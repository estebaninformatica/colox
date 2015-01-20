# AeroGeographyClient

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'geography_client', path: '(*)/operadorPrestador_gem'
    
    (*) = path a la gem
    
And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geography_client

## Usage
  Add in the model:
  
 
 * Area.rb
 ```ruby
class Area < AeroAPI::Area
end
```

 * Country.rb
  ```ruby
class Country < AeroAPI::Country
end
```

 * Destination.rb
  ```ruby
class Destination < AeroAPI::Destination
end
```

 * Region.rb
  ```ruby
class Region< AeroAPI::Region
end
```

Ej:

  ```ruby
Region.find(1)
Destination.all

```
Las regiones tienen paises, los paises tiene areas(Ciudades), las areas tiene destinos.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/aero_operator_provider_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
