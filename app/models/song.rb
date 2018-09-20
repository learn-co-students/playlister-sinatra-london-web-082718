class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    # binding.pry
    @song = Song.find(id)
    @song.name.downcase.tr(' ', '-')
    # binding.pry
  end

  def self.find_by_slug(slug)
    # binding.pry
    Song.all.find{|song| song.slug == slug}
  end

end
