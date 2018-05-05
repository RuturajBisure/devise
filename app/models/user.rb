class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :password , :format => {:with => /\A(?=.*[a-zA-Z])(?=.*[0-9]).{8,}\z/, message: "must be at least 8 characters and include one number and one letter."}
  validates :username, :firstname, :lastname, :phone_number, :presence => true
  validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"
  validates :phone_number, :numericality => true, :length => { :minimum => 10, :maximum => 11 }
  
end

