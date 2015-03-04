require 'vigilem/assembly/version'

require 'vigilem/evdev/stat'
require 'vigilem/win32_api/stat'

module Vigilem
  module Assembly
    # :nodoc:
    class NoAvailableHandler < StandardError
      # @param  [String || NilClass] msg defaults to "None of `#{Core::Stat.all}' report #available?"
      def intialize(msg=nil)
        super(msg || "None of `#{Core::Stat.all}' report #available?")
      end
    end
   module_function
    
    # find's an available handler and installs it
    # @param  [Hash] opts
    # @option opts [Array<Regexp || String, String>] :platform_defaults [os_pattern, gem_name],
    #         the default gem for os_pattern, if os_pattern matches this os
    #         and there are mulitple handlers available, install this gem_name
    #         and raises ArgumentError when the default matches more than one Stat
    # @param  [Proc] block
    # @raise  NoAvailableHandler, when the platform default matches more than one Stat
    # @return the return value of stat.install
    def install_handler(opts={}, &block)
      stat = find_stat(opts, &block)
      stat.install
    end
    
    # 
    # like ::install_handler but throws an NoHandlerAvailable
    # @see  ::install_hadler
    def install_handler!(opts={}, &block)
      stat = find_stat(opts, &block)
      raise NoAvailableHandler unless stat
      stat.install
    end
    
    # find's an available handler 
    # @param  [Hash] opts
    # @option opts [Array<Regexp || String, Array<String> || String>] :platform_defaults [os_pattern, gem_name],
    #         the default gem for os_pattern, if os_pattern matches this os
    #         and there are mulitple handlers available, install this gem_name
    #         and raises ArgumentError when the default matches more than one Stat
    # @param  [Proc] block
    # @raise  ArgumentError, when the platform default matches more than one Stat
    # @return [Stat || NilClass]
    def find_stat(opts={}, &block)
      stats = Core::Stat.all_available
      # @fixme just grabs first
      stat = if stats.size > 1
        [*opts[:platform_defaults]].map do |os_pattern, gem_name| 
          if System.check[:os][os_pattern]
            stats.select {|stat| stat.gem_name == gem_name }
            if stats.size > 1
              raise ArgumentError, "multiple handlers match :platform_defaults"\
                                "#{os_pattern} => #{gem_name} matches #{stats}"
            else
              stats.first
            end
          end
        end.flatten.compact.first
      else
        stats.first
      end
    end
    
  end
end
