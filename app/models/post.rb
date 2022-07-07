class Post < ApplicationRecord
  # has_one_attached :picture
  belongs_to :user


  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.common_name || country.iso_short_name
  end

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: %i[title brand],
                  using: {
                    tsearch: { prefix: true }
                  }
end
