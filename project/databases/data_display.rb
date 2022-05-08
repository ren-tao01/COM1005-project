require "logger"
require "sequel"

puts "Displaying the users table"
DB = Sequel.sqlite("users.sqlite3")
users = DB[:users]
roles_table = DB[:roles]

puts "id role first_name surname username gender " + 
      "field pairing_status outgoing_request requested_to"
users.each do |x|
    puts "#{x[:id]} #{x[:role]} #{x[:first_name]} #{x[:surname]} #{x[:username]} " +
          "#{x[:password]} #{x[:gender]} #{x[:field]} #{x[:pairing_status]} " +
          "#{x[:outgoing_request]} #{x[:requested_to]}"
end

puts "--------------------- \n roles:"
roles_table.each do |y|
  puts "#{y[:id]} #{y[:role]}"
end