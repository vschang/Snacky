class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  def country_name
    c = ISO3166::Country[self.country]
    return c.translations[I18n.locale.to_s] || c.name
  end

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: %i[title brand],
                  using: {
                    tsearch: { prefix: true }
                  }
end
