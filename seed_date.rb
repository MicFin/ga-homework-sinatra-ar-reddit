  Subreddit.new("sports")
  Subreddit.new("news")
  Subreddit.new("finance")

  Submission.new("Patriots", "What an awesome game!")
  Submission.new("Red Sox", "That a boy Papi")
  Submission.new("BOOM PAPI!", "http://www.usatoday.com/story/sports/mlb/2013/10/13/tigers-red-sox-alcs-game-2-max-scherzer-david-ortiz/2978113/")

  Comment.new("He Sux", "BIG PAPI IS A FAT HO")
  Comment.new("I LOVE BRADY", "that is the way you do it")

# Shows form for creating a new subreddit


# # Shows newest submissions from all subreddits
# get "/newest" do
#   erb :
# end



# post '/posts/comment/:id/create' do
#  @subreddit = SubReddit.find(params[:id])
#  @subreddit.submissions.create(title: params[:title], body: params[:body])
#   redirect "/"
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