require("pry")
require_relative("../models/artist")
require_relative("../models/albums")


artist1 = Artist.new({"artist_name" => "Queen"})
artist1.save()

album1 = Albums.new({"title" => "greatest hits",
                        "genre" => "rock",
                         "artist_id" => artist1.id})
album1.save()

binding.pry
nil