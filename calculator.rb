def say(msg)
  puts "=> #{msg}"
end

say "Enter your first number:"
num1 = gets.chomp

say "Enter your second number:"
num2 = gets.chomp

say "What operation do you want to perform? (1) Add (2) Subtract (3) Multiply (4) Divide:"
oper = gets.chomp

say "OK here is your output:"
if oper == '1'
  puts num1.to_i + num2.to_i
elsif oper == '2'
  puts num1.to_i - num2.to_i
elsif oper == '3'
  puts num1.to_i * num2.to_i
else
  puts num1.to_f / num2.to_f
end

    