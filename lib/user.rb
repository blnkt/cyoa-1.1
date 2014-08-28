class User < ActiveRecord::Base
	attr_accessor :new_password, :new_password_confirmation, :first_adventure
  
	has_many :adventures
  has_many :avatars

	# validates_confirmation_of :new_password, :if=>:password_changed?
 #  before_save :hash_new_password, :if => :password_changed?
  
  def self.authenticate(name, password)
  end
  


  def add_avatar name
  	if Avatar.find(name)
  	  User.update(avatar_id: name)
    else
    	Avatar.create({image: name})
    end
  end

  # def add_bio bio
  # 	@bio = bio
  # end

  # def add_fave fave
  # 	@fave = fave
  # end

  # def self.name_checker username
  # 	@@users.each do |user|
  # 		if user.name == username
  # 			return true
  # 		else
  # 			return false
  # 		end
  # 	end
  # end

  def add_password password
  	@password = password
  end

  def password_changed?
    !@new_password.blank?
  end
end