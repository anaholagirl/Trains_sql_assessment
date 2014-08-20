# require './lib/train.rb'
# require './lib/station.rb'
# require 'pg'

# DB = PG.connect({:dbname => 'train_system'})

# def main_menu
#   loop do
#     puts "Press ['s'] if you are a member of the train system staff"
#     puts "Press ['p'] if you are a train patron"
#     puts "Press ['x'] to exit the system"
#     menu_choice = gets.chomp.downcase
#     if menu_choice == 's'
#       system_menu
#     elsif menu_choice == 'p'
#       patron_menu
#     elsif menu_choice == 'x'
#       puts "Goodbye!"
#       exit
#     else
#       puts "That is not a valid option.  Please choose again."
#     end
#   end
# end
# main_menu
