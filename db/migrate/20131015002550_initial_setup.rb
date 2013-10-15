  class InitialSetup < ActiveRecord::Migration
  def up
    create_table :subreddits do |t|
      t.string :title
      t.timestamps
    end
  
    create_table :submissions do |t|
      t.string :title
      t.string :body
      t.string :link
      t.integer :up_votes, default: 0
      t.integer :down_votes, default: 0
      t.integer :subreddit_id
      t.timestamps
    end
  
    create_table :comments do |t|
      t.string :title
      t.string :body
      t.integer :up_votes, default: 0
      t.integer :down_votes, default: 0
      t.integer :submission_id
      t.timestamps
    end

    create_table :subcomments do |t|
      t.string :title
      t.string :body
      t.integer :comment_id
      t.timestamps
    end
  end

  def down
    drop_table :subreddits
    drop_table :submissions
    drop_table :comments
    drop_table :subcomments
  end
end