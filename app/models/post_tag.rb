class PostTag < ApplicationRecord
  belongs_to :post
  validates :tag, uniqueness: { scope: :post_id }
end
