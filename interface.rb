# Welcome to your Christmas List
# Please, select a action to begin:
# [list, add, delete, import, mark as bought!]
# > 
require_relative 'app'

action = 1

def print_menu
  puts '🎄🎅🏼'* 5
  puts "Welcome to your Christmas List!"
  puts "Please, select a action to begin:"
  puts "1 - List\n2 - Add new Gift\n3 - Delete\n4 - Import From Web\n5 - Mark Item as bought\n0 - Quit"
  print "> "
end

def add_gifts
  puts "What is the gift name?"
  name_input = gets.chomp
  puts "What is the gift price?"
  price_input = gets.chomp.to_i
  gift = {name: name_input, price: price_input, bought: 0}
  add(gift)
end

def list_gifts
  # 1 - Playstation 5 | R$ 4999
  gifts = all_gifts
  gifts.each_with_index do |gift, index|
    checkbox = gift[:bought].zero? ? "[ ]" : "[X]" 
    # => checkbox = "[X]" || "[ ]"
    puts "#{index + 1} - #{checkbox} #{gift[:name]} | R$ #{gift[:price]}"
  end
end

def dispatch(action_number)
  case action_number
  when 1
    list_gifts
  when 2
    add_gifts
  else
    puts "Invalid option, Try again!"
  end
end

until action.zero? do 
  print_menu
  action = gets.chomp.to_i
  dispatch(action)
end

