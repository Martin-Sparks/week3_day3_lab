require("pry")
require_relative("../models/artist")
require_relative("../models/albums")


artist1 = Artist.new({"artist_name" => "Queen"})

artist1.save()

binding.pry
nil