  # app/models/post.rb
  class Post < ApplicationRecord
    belongs_to :category
    validates :title, presence: true
    validates :content, presence: true
  end