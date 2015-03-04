require 'spec_helper'

require 'vigilem/keyboard'

describe Vigilem::Assembly::DOMKeyboard do
  
  #@todo create some sort expectancy here, read_many, read_nonblock, ioctl etc
  
  # this is very rickety 
  describe '#initialize' do
    
    module FakeDOM
      class Adapter
        def initialize(*args, &block)
        end
      end
    end
    
    it %q<loads win32_api when RbConfig::CONFIG['host_os'] == "mswin"> do
      allow(RbConfig::CONFIG).to receive(:[]).with('host_os') { 'mswin' }
      allow(described_class).to receive(:require) { true }
      stub_const("Vigilem::Win32API::DOM", FakeDOM)
      
      described_class.new
    end
    
    it %q<loads evdev when Core::System.check[:input_system][/evdev/] == true> do
      allow(RbConfig::CONFIG).to receive(:[]).with('host_os') { '' }
      allow(Vigilem::Core::System.check[:input_system]).to receive(:[]).with(/evdev/) { true }
      allow(described_class).to receive(:require) { true }
      stub_const("Vigilem::Evdev::DOM", FakeDOM)
      
      described_class.new
    end
  end
end
