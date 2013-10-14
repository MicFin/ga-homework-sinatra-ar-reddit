require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql', database: 'reddit_db', host: 'localhost'}

class SubReddit < ActiveRecord::Base
  has_many :submissions
end

class Submission < ActiveRecord::Base
  belongs_to :subreddit
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :submission
end

# Home - Shows the most popular submissions from all subreddits
get `/` do
end

# Shows form for creating a new subreddit
get `/new` do
end

# Shows newest submissions from all subreddits
get `/newest` do
end

# Shows the most popular submissions from a specific subreddit
get `/r/sub-reddit-name` do
end 

# Shows newest submissions for this subreddit
get `/r/sub-reddit-name/newest` do 
end

# Shows form for creating new submission to a subreddit
get `/r/sub-reddit-name/new` do
end

# Shows a specific submission's comment page in a specific subreddit. Maybe you can add new comments from a form here?
get `/r/sub-reddit-name/submission-name` do 
end