namespace :dev do

  task fetch_user: :environment do
    User.destroy_all

    #set URL for HTTP Request
    url = "https://uinames.com/api/?ext&region=england"

    15.times do
      
      # fetch user data from https://uinames.com/
      response = RestClient.get(url)

      # Parse json to ruby hash
      data = JSON.parse(response.body)

      # create user
      user = User.create!(
        name: data["name"],
        email: data["email"],
        password: data["password"],
        gender: data["gender"],
        age: data["age"],
        region: data["region"],
        phone: data["phone"],
        avatar: data["photo"]
      )

      puts "created user #{user.name}"
    end

    puts "now you have #{User.count} users data"

    # ----------------
    # response format
    # ----------------
    #{"name"=>"Patricia", "surname"=>"Quintero", "gender"=>"female", "region"=>"Mexico", "age"=>26, "title"=>"ms", "phone"=>"(683) 252 4017", "birthday"=>{"dmy"=>"11/02/1991", "mdy"=>"02/11/1991", "raw"=>666322033}, "email"=>"patricia_91@example.com", "password"=>"Quintero91*%", "credit_card"=>{"expiration"=>"3/19", "number"=>"3697-4239-2793-9139", "pin"=>4067, "security"=>393}, "photo"=>"https://uinames.com/api/photos/female/6.jpg"}
  end

end
