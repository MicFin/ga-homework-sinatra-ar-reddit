require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql', database: 'new-reddit', host: 'localhost'}

class Subreddit < ActiveRecord::Base
  has_many :submissions
end

class Submission < ActiveRecord::Base
  belongs_to :subreddit
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :submission
  has_many :subcomments
end

class Subcomment < ActiveRecord::Base
  belongs_to :comment
end

# Home - Shows the most popular submissions from all subreddits
get "/reddit/" do
  @subreddits = Subreddit.all
  erb :reddit_main_page
end

get "/new/" do
  erb :create_subreddit
end

post '/create/' do
  Subreddit.create(title: params[:title])
  redirect "/reddit/"
end
