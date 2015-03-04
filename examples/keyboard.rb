require 'vigilem/keyboard'

require 'vigilem/core'

Signal.trap("INT") { exit 1 }

k = (TestKeyboard = Keyboard.new do 
  after_init { puts 'loaded' }
end).new

q = nil
t = nil

until q
  t = k.read_one_nonblock()
  
  puts t.inspect if t
  
  #k.read_one()
end