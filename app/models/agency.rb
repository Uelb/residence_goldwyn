class Agency < ActiveRecord::Base
  attr_accessible :clien_last_name, :client_first_name, :email, :name, :password, :tva_number
end
