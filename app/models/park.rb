class Park < ApplicationRecord

  has_many :user_parks
  has_many :users, through: :user_parks
  has_many :posts
  has_many :park_features
  has_many :features, through: :park_features

  accepts_nested_attributes_for :features, reject_if: :all_blank, allow_destroy: true

  def self.find_park(name)
    Park.where("parkname = ?", name.upcase)
  end

  def self.park_exist?(name)
    !Park.find_park(name).empty?
  end

end
