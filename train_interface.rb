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

def passenger_menu
  loop do
    puts "\n\n ******* PASSENGER MENU ******** \n\n"
    puts "Press ['l'] to list all trains lines in the system_menu"
    puts "Press ['v'] to view all the stations in the system"
    puts "Press ['stops'] to see all the stops in a train line"
    puts "Press ['lines'] to see all the train lines going to a station"
    puts "Press ['m'] to go back to main menu"
    menu_choice = gets.chomp.downcase
    if menu_choice == 'l'
      list_trains
    elsif menu_choice == 'v'
      list_stations
    elsif menu_choice == 'stops'
      list_stops
    elsif menu_choice == 'lines'
      list_lines
    elsif menu_choice == 'm'
      main_menu
    else
      puts "That is not a valid option."
    end
  end
end

def add_train
  puts "What is the name of the train you would like to add?"
  train_name = gets.chomp
  new_train = Train.new({:name => train_name})
  new_train.save
  puts "New Train Created!"
  main_menu
end

def add_station
  puts "What is the name of the station you would like to add?"
  station_name = gets.chomp
  new_station = Station.new({:name => station_name})
  new_station.save
  puts "New Station Created!"
  main_menu
end

main_menu



