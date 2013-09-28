class User < ActiveRecord::Base
  has_many :dockets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, #:confirmable,
       	 :lockable, :timeoutable and :omniauthable
       	 
       	 validates_presence_of :firstname, :surname
       	 validates :username, :presence => true, :uniqueness => true      	 
end
