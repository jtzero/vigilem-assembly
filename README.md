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
  This will load one of the default Stat's @see [Vigilem::Win32API::Stat](https://github.com/jtzero/vigilem-win32_api-stat), [Vigilem::Evdev::Stat](https://github.com/jtzero/vigilem-evdev-stat)
  it checks ```Vigilem::Stat.all``` to load the Stats.
or
```ruby
  require 'vigilem/assembly'
  
  Vigilem::Assembly.install_handler! # which will error if no handler found
```
##During Gem install
```ruby
  #ext/Rakefile
  require 'vigilem/assembly'
  
  task :assemble do
    Vigilem::Assembly.install_handler
  end
  
  task default: :assemble
```

## Creating a new Stat
```ruby
  require 'ffi'
  
  require 'vigilem/assembly'
  
  class CocoaStat < Vigilem::Core::Stat
    extend FFI::Library
    # by default self.new automatically adds the Stat to 
    # the list of stats
    def initialize(version=nil)
      options = {}
      options[:version] = version
      options[:platforms] = /darwin/
      super('Cocoa', 'my-cocoa-api', options) do 
        begin
          !!ffi_lib('/System/Library/Frameworks/Cocoa.framework/Cocoa')
        rescue LoadError
          false
        end
      end
    end
    
    def self.default
      @default ||= new
    end
    
  end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/vigilem-assembly/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
