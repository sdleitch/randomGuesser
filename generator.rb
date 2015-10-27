require 'securerandom'
generated = String.new

puts "Type out a long string of binary (1s and 0s):"
human = gets.chomp

until human.length > 40_000
  human += human
end

human = human[0..39_999]

40_000.times do
  generated += SecureRandom.random_number(2).to_s
end

genArray = generated.scan(/..../)
genCount = Hash.new
genArray.each do |value|
  if genCount.has_key?(value)
    genCount[value] += 1
  else
    genCount[value] = 1
  end
end

humArray = human.scan(/..../)
humCount = Hash.new
humArray.each do |value|
  if humCount.has_key?(value)
    humCount[value] += 1
  else
    humCount[value] = 1
  end
end

p genCount
p humCount

genCount.each do |key, value|
  puts key.to_s + "\nComputer: "  + value.to_s + "\nHuman: " + humCount[key].to_s
end
