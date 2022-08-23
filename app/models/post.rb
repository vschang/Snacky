class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  validates :title, :rating, :country, :review, :brand, presence: true
  geocoded_by :address
  after_validation :geocode
  # , if: :will_save_change_to_address?

  def country_name
    ISO3166::Country[country]
  end

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: %i[title brand],
                  using: {
                    tsearch: { prefix: true }
                  }
end
