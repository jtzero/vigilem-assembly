require 'vigilem/dom'

require 'vigilem/core/device'

require 'vigilem/evdev/stat'
require 'vigilem/win32_api/stat'

module Vigilem
module Assembly
  # 
  # provides an entry point to DOM events
  class DOMKeyboard < Core::Device
    
    # imports the DOMAdapter
    def initialize
      
      on_os(/win32|mingw32|mswin|cygwin/) do
        require 'vigilem/win32_api/dom'
        
        import Win32API::DOM::Adapter.new
      end
      
      # the handler checks to see if it can exist
      on_input_system(/evdev/) do
        require 'vigilem/evdev/dom'
                                      # @todo identify the 'main' keyboard
        import Evdev::DOM::Adapter.new(Evdev::Device.name_grep(/keyboard/).first)
      end
      
      super()
    end
    
  end
end
end
