start_time = Time.now + (60 * 60 * 24 * 7) # 1 week

User.create!(email: 'bob@bob.com', password: '123456', username: 'bob1', gender: 'Male')
User.create!(email: 'sally@sally.com', password: '123456', username: 'sally1', gender: 'Female')
User.create!(email: 'tom@tom.com', password: '123456', username: 'tom1', gender: 'Male')
User.create!(email: 'john@john.com', password: '123456', username: 'john1', gender: 'Male')
User.create!(email: 'mary@mary.com', password: '123456', username: 'mary1', gender: 'Female')
User.create!(email: 'adam@adam.com', password: '123456', username: 'adam1', gender: 'Male')

Sport.create!(name: 'Running')
Sport.create!(name: 'Basketball')
Sport.create!(name: 'Tennis')

Activity.create!(start_time: start_time, end_time: start_time + (60 * 60), player_limit: 2, description: "if you want to sweat it up join here", title: "Running partner needed", location: "Gan sacher", skill_level: 'Beginner', sport_id: 2, user_id: 2)
Activity.create!(start_time: start_time, end_time: start_time + (60 * 60), player_limit: 8, description: "4 on 4 happening at rechovot park", title: "4 on 4 game", location: "Rechovot Park", skill_level: 'Intermediate', sport_id: 1, user_id: 1)


Player.create!(activity: Activity.last, user: User.find(1), invitation: false) #bob
Player.create!(activity: Activity.first, user: User.find(2), invitation: false) #sally
Player.create!(activity: Activity.first, user: User.find(3), invitation: false) #tom
Player.create!(activity: Activity.first, user: User.find(4), invitation: false) #john
Player.create!(activity: Activity.first, user: User.find(5), invitation: false) #mary
Player.create!(activity: Activity.first, user: User.find(6), invitation: false) #adam