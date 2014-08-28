require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)


def welcome
  clear_screen
  User.creator?
	puts "It's time for adventuring.  What's your name?"
	user_name = gets.chomp
  unless User.find_by name: user_name
    @current_user = new_user(user_name)
    p @current_user
  else
    potential_user = User.find_by name: user_name
    p potential_user.adventures
    potential_avatar = Avatar.find_by id: potential_user.avatar_id
    puts "Is this avatar yours? (y/n)"
    puts "#{potential_avatar.avatar}"
    case gets.chomp.downcase
    when 'y'
      @current_user = potential_user    
    when 'n'
      @current_user = new_user(user_name)
    end
  end
  menu(@current_user)
end

def new_user name
  puts "It looks like this is your first adventure.  Can I call you #{name}? (y/n)"
  case gets.chomp.downcase
  when 'y'  
    @new_user = User.create(name: name)
    profile(@new_user)
  when 'n'
    puts "Please enter a name for adventuring:"
    @new_user = User.create({name: gets.chomp})
    profile(@new_user)
  else
    puts "That didn't seem right..."
    sleep 1
    clear_screen
    new_user(name)
  end
  @new_user
end


# def prologue_runner
#   User.creator?
# end

def menu(user)
  p user.adventures
  current_chapter  = user.adventures.last.chapters.last
  @chapter = chapter
  clear_screen
  print @chapter
  puts @chapter.prompt.to_s
  linebreak
  puts @chapter.episode.to_s
  linebreak
  @chapter.choices.each do |choice|
    puts "#{choice.id} :  #{choice.prompt}"
    linebreak
  end
  puts "Enter 'choice number' to proceed"
  puts "Enter 'ac' to add an additional choice"
  puts "Enter '<' to turn back"
  puts "Enter 'p' to view your profile"
  puts "Enter 'x' to leave the adventure"
  choice_id = gets.chomp
  if choice_id == 'x'
    exit
  elsif choice_id == 'ac'
    puts "Enter a new choice for this chapter:"
    choice_text = gets.chomp
    @chapter.add_choice(choice_text)
  elsif choice_id == 'ae'
    puts "Enter an episode for this chapter:"
    episode_text = gets.chomp
	  @chapter.update(episode: episode_text)
  elsif choice_id == 'p'
    profile(@user)
  elsif Chapter.find(choice_id)
    @chapter = Chapter.find(choice_id)
    @user.adventures.last.add_chapter(@chapter)
    menu(@user, @chapter)
	else
	  menu(@user, @chapter)
  end
  menu(@user, @chapter)
end

def profile user
  clear_screen
  loop do
    puts "Looks like your profile is incomplete."
    if user.avatar_id == nil
      new_avatar(user)
    elsif user.bio == nil 
      new_bio(user)
    elsif user.fave == nil
      new_fave(user)
    else
      clear_screen
      break
    end
  end
  puts user.name.upcase
  puts Avatar.find(user.avatar_id)
  puts "Bio:" + user.bio.to_s
  puts "#{user.name}'s favorite adventure:" + user.fave.to_s
  puts "Enter 'a' to edit your avatar"
  puts "Enter 'b' to edit your biography"
  puts "Enter 'f' to edit your favorite adventure (book, movie, life, etc.)"
  puts "Enter 'm' to return to the adventure"
  case gets.chomp
  when 'a'
    new_avatar(user)
  when 'b'
    new_bio(user)
  when 'f'
    new_fave(user)
  when 'm'
    menu(user, user.adventures.last.chapters.last)
  else
    profile(user)
  end
  profile(user)
end

# def new_avatar user
#   Avatar.all.each do |avatar|
#     puts "#{avatar.id} :  #{avatar.name}  #{avatar.avatar}"
#   end
#   puts "Enter a number to select your new avatar, or type in your own ASCII:"
#   potentional_avatar = gets.chomp
#   if Avatar.find_by({id: potentional_avatar})
#     user.update({avatar_id: potentional_avatar})
#   else
#     puts "Enter a name for your creation:"
#     avatar_name = gets.chomp
#     new_avatar = Avatar.create({name: avatar_name, avatar: potentional_avatar})
#     user.update({avatar_id: new_avatar.id})
#   end
# end

# def new_bio user
#   puts "Enter a short biography:"
#   user.update({bio: gets.chomp})
# end

# def new_fave user
#   puts "Enter your favorite adventure:"
#   user.update({fave: gets.chomp})
# end

def clear_screen
  puts "\e[H\e[2J"
end

def linebreak
	puts "\n"
end

welcome