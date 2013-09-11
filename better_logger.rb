$NESTING_LEVEL = 0

def logger block_description, &block
  indent = ' ' * $NESTING_LEVEL 
  puts indent + "Beginning block #{block_description}"
  $NESTING_LEVEL += 1
  ret_val = block.call.inspect
  $NESTING_LEVEL -= 1
  puts indent + "Block #{block_description} completed, returned #{ret_val}"
end

logger 'takes picture' do 
  logger 'prepare for picture' do 
    puts "Say cheese!"
    "Everyone says cheese."
  end
  puts "FLASH!"
  "Picture was taken."
end