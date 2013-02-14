#encoding: utf-8
AdminUser.create(:email => "thomas@oxynum.fr", :password => "azertyuiop", :password_confirmation => "azertyuiop")
AdminUser.create(:email => "rudy@oxynum.fr", :password => "poiuytreza", :password_confirmation => "poiuytreza")
AdminUser.create(:email => "samy@oxynum.fr", :password => "bleuciel", :password_confirmation => "bleuciel")

Room.create(name: "La petite canette", description: "Venez passer un moment de plaisir dans notre magnifique suite au bord de la méditéranée. Un bonheur pour tout la famille", dimension: "50m2 de suface", number_of_rooms: 1, sleeping: "Lit double queen size 180x210", week_price: 660, day_price: 95)
Room.create(name: "La petite canette 2", description: "Venez passer un moment de plaisir dans notre magnifique suite au bord de la méditéranée. Un bonheur pour tout la famille", dimension: "50m2 de suface", number_of_rooms: 1, sleeping: "Lit double queen size 180x210", week_price: 660, day_price: 95)
Room.create(name: "La petite canette 3", description: "Venez passer un moment de plaisir dans notre magnifique suite au bord de la méditéranée. Un bonheur pour tout la famille", dimension: "50m2 de suface", number_of_rooms: 1, sleeping: "Lit double queen size 180x210", week_price: 660, day_price: 95)
Room.create(name: "La petite canette 4", description: "Venez passer un moment de plaisir dans notre magnifique suite au bord de la méditéranée. Un bonheur pour tout la famille", dimension: "50m2 de suface", number_of_rooms: 1, sleeping: "Lit double queen size 180x210", week_price: 660, day_price: 95)