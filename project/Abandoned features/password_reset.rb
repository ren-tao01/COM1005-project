=begin
require "net/http"
require "logger"
require "sequel"

DB = Sequel.sqlite("users.sqlite3", logger: Logger.new("db.log"))

def existsCheck(db, email_address)
    db.execute( "select 1 from Products where promoID = ?",
                [id] ).length > 0
end

def validate_email_address(email_address)
  email_address =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
end

def send_mail(email, subject, body)
  response = Net::HTTP.post_form(URI("http://www.dcs.shef.ac.uk/cgi-intranet/public/FormMail.php"),
                                 "recipients" => email,
                                 "subject" => subject,
                                 "body" => body)
  response.is_a? Net::HTTPSuccess
end

email = nil
until validate_email_address(email)
  puts "Please enter a valid recipient email address:"
  email = gets.chomp
end

subject = "Reset your password"

body = "To reset your password, paste the following characters to the password reset URL: /" + random_string

puts "Sending email..."
if send_mail(email, subject, body)
  puts "Email sent ok."
else
  puts "Send failed."
end
=end