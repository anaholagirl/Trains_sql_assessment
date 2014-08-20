require './lib/train.rb'
require './lib/station.rb'
require 'pg'

DB = PG.connect({:dbname => 'train_system'})

def main_menu
  loop do
    puts "\n\n ******* MAIN MENU ******** \n\n"
    puts "Press ['s'] if you are a member of the train system staff"
    puts "Press ['p'] if you are a train passenger"
    puts "Press ['x'] to exit the system"
    menu_choice = gets.chomp.downcase
    if menu_choice == 's'
      system_menu
    elsif menu_choice == 'p'
      passenger_menu
    elsif menu_choice == 'x'
      puts "Goodbye!"
      exit
    else
      puts "That is not a valid option."
    end
  end
end

def system_menu
  loop do
    puts "\n\n ******* SYSTEM MENU ******** \n\n"
    puts "Press ['t'] to add a train line"
    puts "Press ['s'] to add a station"
    puts "Press ['as'] to add a stop to a train line"
    puts "Press ['at'] to add a train line to a station"
    puts "Press ['rt'] to remove a train line"
    puts "Press ['rs'] to remove a station"
    puts "Press ['m'] to go back to the main menu"
    menu_choice = gets.chomp.downcase
    if menu_choice == 't'
      add_train
    elsif menu_choice == 's'
      add_station
    elsif menu_choice == 'as'
      add_train_stop
    elsif menu_choice == 'at'
      add_station_line
    elsif menu_choice == 'rt'
      remove_train
    elsif menu_choice == 'rs'
      remove station
    elsif menu_choice == 'm'
      main_menu
    else
      puts "That is not a valid option."
    end
  end
end
main_menu


