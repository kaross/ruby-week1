def roman_to_int roman_numeral 
  num = 0
  idx = 0
  roman = roman_numeral.upcase 

  while idx < roman.length
    case roman[idx]
    when 'M'
      num += 1000
      idx += 1
    when 'C'
      if roman[idx+1] == 'M'
        num += 900
        idx += 2
      elsif roman[idx+1] == 'D'
        num += 400
        idx += 2
      else
        num += 100
        idx += 1
      end
    when 'D'
      num += 500
      idx += 1
    when 'X'
      if roman[idx+1] == 'C'
        num += 90
        idx += 2
      elsif roman[idx+1] == 'L'
        num += 40
        idx += 2
      else
        num += 10
        idx += 1
      end 
    when 'L'
      num += 50
      idx += 1
    when 'I'
      if roman[idx+1] == 'X'
        num += 9
        idx += 2
      elsif roman[idx+1] == 'V'
        num += 4
        idx += 2
      else
        num += 1
        idx += 1
      end
    when 'V'
      num += 5
      idx += 1
    else
      puts "Error! The letter #{roman[idx]} is not a valid roman numeral!"
      exit
    end
  end

  num
end

puts "Enter the roman numeral you want to see as an integer"
roman = gets.chomp
puts roman_to_int(roman)