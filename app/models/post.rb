class Post < ApplicationRecord
  validates :context, {presence: true, length: {maximum: 140}}
end
