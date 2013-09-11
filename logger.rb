def logger block_description, &block
  puts "Beginning block #{block_description}"
  ret_val = block.call.inspect
  puts "Block #{block_description} completed, returned #{ret_val}"
end

logger 'takes picture' do 
  logger 'prepare for picture' do 
    puts "Say cheese!"
    "Everyone says cheese."
  end
  puts "FLASH!"
  "Picture was taken."
end

