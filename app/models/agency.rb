class Agency < ActiveRecord::Base
  validates_presence_of :name, :email, :client_last_name, :client_first_name
  validates :mobile_phone, :length => { :is => 10 }
  validates :phone, :length => { :is => 10 }
  validates :zip_code, :length => {:is => 5}
  validates :email, :uniqueness => :true

  has_many :stays

  after_create :send_admin_mail


  def active_for_authentication? 
    super && approved? 
  end 


  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(self).deliver
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end 
end
