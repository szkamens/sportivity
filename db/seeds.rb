require 'faker'

############################# Random Pictures UNSPLASH #############################
# TENNIS
tennis_pic = "https://source.unsplash.com/1600x900/?tennis"
# FOOTBALL
football_pic = "https://source.unsplash.com/1600x900/?soccer"
# BASKETBALL
basketball_pic = "https://source.unsplash.com/1600x900/?basketball"
# RUNNING
running_pic = "https://source.unsplash.com/1600x900/?running"
# VOLEYBALL
voleyball_pic = "https://source.unsplash.com/1600x900/?voleyball"
# YOGA
yoga_pic = "https://source.unsplash.com/1600x900/?yoga"

############################# Gender & User Name generator #############################
# Gender generator, with length of 4 characters and choosing Male or Female.
def generate_username(gender)
  name = ""
  while name.length < 4
    if gender == "Male"
      name = Faker::Name.male_first_name
    else
      name = Faker::Name.female_first_name
    end
  end
  name
end

############################# descriptions for "User" table #############################
# Descriptions for the "User" table.
descriptions = []

descriptions << "Doing sports with me it will be a great oportunity to level up your skills!"
descriptions << "Sport lover!"
descriptions << "I just moved to Tel Aviv and wanna practice sports with other people"
descriptions << "Looking for another people to play around my area!"
descriptions << "I consider myself a good partner to do sports!"
descriptions << "I pay the coke dont matter the result!"
descriptions << "Wondering playing with people of my same skill level!"
descriptions << "I use to play this sport when I was child!"

############################# Destroy database #############################
## Cleaning Database
puts 'Cleaning database...'
Player.destroy_all
p 1
Activity.destroy_all
p 2
SportUser.destroy_all
p 3
Sport.destroy_all
p 4
User.destroy_all
p 5


############################# SPORTS TABLE #############################
## "Sports" table seed
  # Creating Sports
puts 'Creating Sports...'

sports = {}

%w[Basketball Tennis Football Running Volleyball Yoga].each do |name|
  sport = Sport.create!(name: name)
  sports[name.downcase.to_sym] = sport
end

puts 'Sports Created!'

############################# ACTIVITY & PLAYERS & USER TABLE #############################


# ///// ARRAY OF LOCATIONS ////
locations = ["Arlozorov 100, Tel Aviv", "Balfour 200, Tel Aviv", "Begin 350, Tel Aviv",
            "Ben Gurion 380, Tel Aviv", "Bialik 180, Tel Aviv", "Dizengoff 100, Tel Aviv",
            "Herzl 400, Tel Aviv", "Rabin 580, Tel Aviv", "Ibn Gabirol 200, Tel Aviv",
            "Ibn Gabirol 250, Tel Aviv", "Ibn Gabirol 50, Tel Aviv", "Ibn Gabirol 70, Tel Aviv",
            "Dizengoff 130, Tel Aviv", "Dizengoff 500, Tel Aviv", "Dizengoff 120, Tel Aviv",
            "Balfour 230, Tel Aviv", "Balfour 100, Tel Aviv", "Balfour 240, Tel Aviv"]



# ///////////// CREATING AN ACTIVITY BY HAND BY ARIEL (FOOTBALL) /////////////

ariel = User.create!(email: 'ariel@ariel.com', password: '123456', gender: 'Male', username: 'ariel')

puts "creating ariels_soccer_match"
SportUser.create!(user: ariel, sport: sports[:football], skill_level: 'Intermediate')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
ariels_soccer_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * 60),
  player_limit: 10,
  location: locations.sample,
  skill_level: 'Intermediate',
  user: ariel,
  sport: sports[:football],
  title: "Friendly 5-on-5 football",
  description: "Come and play soccer with my team!"
)
puts "ariels_soccer_match created"
ariels_soccer_match.add_player(ariel)

schneur = User.create!(email: 'schneur@schneur.com', password: '123456', gender: 'Male', username: 'schneur')

puts "creating schneurs_tennis_match"
SportUser.create!(user: schneur, sport: sports[:tennis], skill_level: 'Intermediate')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
schneurs_tennis_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 10,
  location: locations.sample,
  skill_level: 'Intermediate',
  user: schneur,
  sport: sports[:tennis],
  title: "tennis singles. We have severals courts to play in!",
  description: "Come & Join me. The loser pays the coke!"
)
puts "schneurs_tennis_match created"
schneurs_tennis_match.add_player(schneur)

naftali = User.create!(email: 'naftali@naftali.com', password: '123456', gender: 'Male', username: 'naftali')

puts "creating naftalis_yoga_session"
SportUser.create!(user: naftali, sport: sports[:yoga], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
naftalis_yoga_session = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 20,
  location: locations.sample,
  skill_level: 'Pro',
  user: naftali,
  sport: sports[:yoga],
  title: "yoga with Nati",
  description: "Come & Relax with nice people!"
)
puts "naftalis_yoga_session created"
naftalis_yoga_session.add_player(naftali)

vincent = User.create!(email: 'vincent@vincent.com', password: '123456', gender: 'Male', username: 'vincent')

puts "creating vincents_running_session"
SportUser.create!(user: vincent, sport: sports[:running], skill_level: 'Beginner')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
vincents_running_session = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 50,
  location: locations.sample,
  skill_level: 'Beginner',
  user: vincent,
  sport: sports[:running],
  title: "Run Vincent run!",
  description: "I will teach you the best technic for running in hard surfaces!"
)
puts "vincents_running_session created"
vincents_running_session.add_player(vincent)

omer = User.create!(email: 'omer@omer.com', password: '123456', gender: 'Male', username: 'omer')

puts "creating omers_basketball_match"
SportUser.create!(user: omer, sport: sports[:basketball], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
omers_basketball_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 16,
  location: locations.sample,
  skill_level: 'Pro',
  user: omer,
  sport: sports[:basketball],
  title: "I use to play with NBA players!",
  description: "Now I like playing for hobby. Glad if you join me! 4 teams of 4 players!"
)
puts "omers_basketball_match created"
omers_basketball_match.add_player(omer)

david = User.create!(email: 'david@david.com', password: '123456', gender: 'Male', username: 'david')

puts "creating davids_basketball_match"
SportUser.create!(user: david, sport: sports[:basketball], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
davids_basketball_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 8,
  location: locations.sample,
  skill_level: 'Pro',
  user: david,
  sport: sports[:basketball],
  title: "Best Israel basketball match!",
  description: "Are you sure you can defeat me and my friends?"
)
puts "davids_basketball_match created"
davids_basketball_match.add_player(david)

yair = User.create!(email: 'yair@yair.com', password: '123456', gender: 'Male', username: 'yair')

puts "creating yairs_basketball_match"
SportUser.create!(user: yair, sport: sports[:basketball], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
yairs_basketball_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 4,
  location: locations.sample,
  skill_level: 'Pro',
  user: yair,
  sport: sports[:basketball],
  title: "Come and try your skills!",
  description: "Prefer practicing Karate... but let give it a try to this sport!"
)
puts "yairs_basketball_match created"
yairs_basketball_match.add_player(yair)


Player.create!(activity: davids_basketball_match, user: omer, accepted_at: Time.now)
Player.create!(activity: yairs_basketball_match, user: omer, accepted_at: Time.now)

# ///// ARRAY OF EVENTS OR ACTIVITIES ////

activities_to_do = [ariels_soccer_match, schneurs_tennis_match,
                    naftalis_yoga_session, vincents_running_session, omers_basketball_match,
                    davids_basketball_match, yairs_basketball_match]

# /////////////////////////////////// ITERATE JOINING GAME SOCCER-INTERMIDATE ///////////////////////////////////

puts "Creating Male Players(game joiners) & Users(game host) for the game.....SOCCER-INTERMIDATE"

5.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  SportUser.create!(user: user, sport: sports[:football], skill_level: 'Intermediate')
  SportUser.create!(user: user, sport: sports[:basketball], skill_level: 'Intermediate')
  choosen_match = activities_to_do.sample
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
  end
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


puts "Creating Female Players(game joiners) & Users(game host) for the game.....SOCCER-INTERMIDATE"

3.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  end
  SportUser.create!(user: user, sport: sports[:football], skill_level: 'Intermediate')
  SportUser.create!(user: user, sport: sports[:basketball], skill_level: 'Intermediate')
    choosen_match = activities_to_do.sample
    while choosen_match.player_limit <= choosen_match.players.count
      choosen_match = activities_to_do.sample
    end
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)

  puts "Player #{user.username} created"
end


# /////////////////////////////////// ITERATE JOINING GAME TENNIS-INTERMIDATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game..... TENNIS-INTERMIDATE"

3.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  SportUser.create!(user: user, sport: sports[:tennis], skill_level: 'Intermediate')
  SportUser.create!(user: user, sport: sports[:football], skill_level: 'Intermediate')
  choosen_match = activities_to_do.sample
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
  end
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


puts "Creating Female Players(game joiners) & Users(game host) for the game..... TENNIS-INTERMIDATE"

4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  end
  SportUser.create!(user: user, sport: sports[:tennis], skill_level: 'Intermediate')
  SportUser.create!(user: user, sport: sports[:football], skill_level: 'Intermediate')
    choosen_match = activities_to_do.sample
    while choosen_match.player_limit <= choosen_match.players.count
      choosen_match = activities_to_do.sample
    end
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)

  puts "Player #{user.username} created"
end

# /////////////////////////////////// ITERATE JOINING GAME YOGA-PRO ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game..... YOGA-PRO"

4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  SportUser.create!(user: user, sport: sports[:yoga], skill_level: 'Pro')
  SportUser.create!(user: user, sport: sports[:running], skill_level: 'Beginner')
  choosen_match = activities_to_do.sample
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
  end
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


puts "Creating Female Players(game joiners) & Users(game host) for the game..... YOGA-PRO"

2.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  end
  SportUser.create!(user: user, sport: sports[:yoga], skill_level: 'Pro')
  SportUser.create!(user: user, sport: sports[:running], skill_level: 'Beginner')
    choosen_match = activities_to_do.sample
    while choosen_match.player_limit <= choosen_match.players.count
      choosen_match = activities_to_do.sample
    end
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)

  puts "Player #{user.username} created"
end

# /////////////////////////////////// ITERATE JOINING GAME RUNNING-BEGGINER ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....RUNNING-BEGGINER"

5.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  SportUser.create!(user: user, sport: sports[:running], skill_level: 'Beginner')
  SportUser.create!(user: user, sport: sports[:basketball], skill_level: 'Pro')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


puts "Creating Female Players(game joiners) & Users(game host) for the game.....RUNNING-BEGGINER"

5.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  end
  SportUser.create!(user: user, sport: sports[:running], skill_level: 'Beginner')
  SportUser.create!(user: user, sport: sports[:basketball], skill_level: 'Pro')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)

  puts "Player #{user.username} created"
end

puts "Connecting Chatrooms"
Chatroom.connect_all_chatrooms
