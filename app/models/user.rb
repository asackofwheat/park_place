class User < ApplicationRecord

  has_secure_password

  validates :password, 
            :length => { :in => 8..24 }, 
            :allow_nil => true

  validates :email,
            presence: true

  validates :first_name,
            presence: true

  validates :last_name,
            presence: true

  has_many :user_parks
  has_many :parks, through: :user_parks
  has_many :posts

end
