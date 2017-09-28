class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :artist_name, :genre_name, :note_contents

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    else
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    if self.genre
      self.genre.name
    else
    end
  end

  def note_contents=(contents)
     contents.each do |content|
       note = Note.find_or_create_by(content: content)
       self.notes << note
     end
   end

   def note_contents

     arr = self.notes.select {|note| note.content.size > 0 }
     arr.map {|note| note.content}
   end

end
