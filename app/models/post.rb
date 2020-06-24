class Post < ApplicationRecord
  belongs_to :user

  enum status: { unpublished: 0, published: 1, archived: 2 }
end
