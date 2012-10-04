#encoding: utf-8
AdminUser.create(:email => "thomas@oxynum.fr", :password => "azertyuiop", :password_confirmation => "azertyuiop")
AdminUser.create(:email => "rudy@oxynum.fr", :password => "poiuytreza", :password_confirmation => "poiuytreza")
AdminUser.create(:email => "samy@oxynum.fr", :password => "bleuciel", :password_confirmation => "bleuciel")

Room.create(:name => "Duo Room", :sleeping => "2 lits simples ou 1 lit double", :number_of_rooms => 2, :dimension => "35 m2", :description => "Chambre supérieure, idéale pour un repos bien mérité")