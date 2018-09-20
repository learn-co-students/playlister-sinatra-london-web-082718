class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    slug = slug.split('-').join(' ')
    Artist.where('name LIKE ?', slug)[0]
  end
end
