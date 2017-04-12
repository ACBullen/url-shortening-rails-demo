require 'launchy'
class ShortenedUrlInterface

  def initialize(email = find_user_from_input_email)
    @email = email
    @user = User.find_by(email: email)
  end

  def find_user_from_input_email
    puts "Please enter your funky fresh email: "
    p "> "
    email = gets.chomp
  end

  def run
    choice = prompt
    if choice == 's'
      get_long_url
    elsif choice == 'v'
      get_short_url
    else
      puts "... that wasn't a valid choice, you unfresh dog."
    end
  end

  def prompt
    puts "Would you like to shorten a Url or visit a shorten Url"
    puts "(s/v)"
    p "> "
    choice = gets.chomp
  end

  def get_long_url
    puts "What funky fresh Url do you want to shorten, dog?"
    long_url = gets.chomp
    ShortenedUrl.shorten_my_url(@user, long_url)
    short_url = ShortenedUrl.last.shortened_url
    puts "Righteous. Your shortened Url is #{short_url}!"
  end

  def get_short_url
    all_urls = ShortenedUrl.all
    all_urls.each do |url|
      puts "#{url.id} : #{url.shortened_url}"
    end
    puts "Which Url would you like to visit?(by id)"
    p '> '
    get_id = gets.chomp
    short_url_object = ShortenedUrl.find_by(id: get_id)
    puts "Sweet bro, sending you to #{short_url_object.long_url}"
    Launchy.open(short_url_object.long_url)
    Visit.record_visit!(@user, short_url_object)

  end
end
if __FILE__ == $0
  a = ShortenedUrlInterface.new
  a.run
end
