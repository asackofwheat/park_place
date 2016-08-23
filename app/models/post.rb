class Post < ApplicationRecord

  belongs_to :user
  belongs_to :park

  validates :body, presence: true

end
