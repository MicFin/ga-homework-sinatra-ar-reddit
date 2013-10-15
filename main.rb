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
  @submissions = Submission.all
  erb :reddit_main_page
end

# Shows form to create a subreddit
get "/new/" do
  erb :create_subreddit
end

# shows form to create a submission
get "/new/:id/submission/" do
  @subreddit = Subreddit.find(params[:id])
  erb :create_submission
end

# Shows the most popular submissions from a specific subreddit
get "/reddit/:id/" do
  @subreddit = Subreddit.find(params[:id])
  erb :subreddit_view
end 

post '/create/' do
  Subreddit.create(title: params[:title])
  redirect "/reddit/"
end

post '/create/:id/submission/' do
  @subreddit = Subreddit.find(params[:id])
  @subreddit.submissions.create(title: params[:title], body: params[:body], link:params[:link])
  redirect "/reddit/"
end




