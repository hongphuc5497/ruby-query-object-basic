# frozen_string_literal: true

require_relative './sports_query.rb'

def popular_sport_posts(user, sports_query = SporsQuery.new(user.posts))
  sport_posts_count = sports_query.sport_posts_count

  if sport_posts_count < 2
    sports_query.sport_posts
  elsif sport_posts_count < 11
    sports_query.sport_posts_with_published_comments
  else
    sports_query.sport_posts_with_recent_published_comments
  end
end
