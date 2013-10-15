require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql', database: 'new-reddit', host: 'localhost'}

class SubReddit < ActiveRecord::Base
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

class SubComment < ActiveRecord::Base
  belongs_to :comment
end

# Home - Shows the most popular submissions from all subreddits
get "/reddit/" do
  @subreddits = SubReddit.all
  erb :reddit_main_page
end

# Shows form for creating a new subreddit
get "/new/" do
  erb :create_subreddit
end

# # Shows newest submissions from all subreddits
# get "/newest" do
#   erb :
# end

# post '/create/' do
#   SubReddit.create(title: params[:title])
#   redirect "/reddit/"
# end

# post '/posts/comment/:id/create' do
#  @subreddit = SubReddit.find(params[:id])
#  @subreddit.submissions.create(title: params[:title], body: params[:body])
#   redirect "/"
# end
# # Shows the most popular submissions from a specific subreddit
# get "/r/sub-reddit-name" do
# end 

# # Shows newest submissions for this subreddit
# get "/r/sub-reddit-name/newest" do 
# end

# # Shows form for creating new submission to a subreddit
# get "/r/sub-reddit-name/new" do
#   erb :create_submission
# end

# # Shows a specific submission's comment page in a specific subreddit. Maybe you can add new comments from a form here?
# get "/r/sub-reddit-name/submission-name" do 
# end