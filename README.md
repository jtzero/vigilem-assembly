# Vigilem::Assembly
  Provides assembling functionality for Vigilem
  It will dynamically install handlers based on Vigilem::Core::Stat attributes
  @see vigilem-evdev-stat or vigilem-win32_api-stat
  
## Installation
  $ gem install vigilem-assembly
  
## examples
```ruby
  require 'vigilem/assembly'
  
  Vigilem::Assembly.install_handler
```
or
```ruby
  require 'vigilem/assembly'
  
  Vigilem::Assembly.install_handler! # which will error if no handler found
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/vigilem-assembly/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
