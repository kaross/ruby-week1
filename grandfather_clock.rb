def grandfather_clock &block
  now = Time.new.hour
  if now > 12
    now -= 12
  end

  now.times {block.call}
end

grandfather_clock do 
  puts 'DONG!'
end

grandfather_clock do 
  puts 'CUCKOO'
end

