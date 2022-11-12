class User < ApplicationRecord
  has_many :tweets, dependent: :destroy, counter_cache: :tweets_count

  has_many :follower_tweets, -> { distinct }, through: :followers, source: :tweets
  has_many :following_tweets, -> { distinct }, through: :followings, source: :tweets

  has_many :follower_ids, class_name: 'UserFollowing', foreign_key: 'following_id', dependent: :destroy, inverse_of: :follower, counter_cache: :followers_count
  has_many :followers, through: :follower_ids, source: :follower

  has_many :following_ids, class_name: 'UserFollowing', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :following, counter_cache: :followings_count
  has_many :followings, through: :following_ids, source: :following
  has_many :faviourites, -> { where(is_following_favourite: true) }, through: :following_ids, source: :following
end

# user
# name, tweets_count, followers_count, followings_count

# follower_id, following_id
# u1, u2
# u1, u3
# u2, u1

# u1.followers = [u2]
# u1.followings = [u2, u3]

# u2.followers = [u1]
# u2.followings = [u1]

# u3.followers = [u1]
# u3.following = []
