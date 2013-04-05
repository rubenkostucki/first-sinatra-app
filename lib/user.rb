class User
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :first_name,      String    # A varchar type string, for short strings
  property :last_name,       String      # A text block, for longer string data.
  property :special_skill,   Text # A text block, for longer string data.
  property :created_at,      DateTime  # A DateTime, for any date you might like.

  has n, :comments
end




class Comment
  include DataMapper::Resource

  property :id,         Serial
  property :text,       Text
  property :created_at, DateTime

  belongs_to :user
end