class UserFollowing < ApplicationRecord
  belongs_to :follower, class_name: 'User', counter_cache: :followers_count
  belongs_to :following, class_name: 'User', counter_cache: :followings_count
end

# follower_id, following_id, is_following_favourite
