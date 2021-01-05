# frozen_string_literal: true

module Products
  #:nodoc
  class SportsQuery
    def initialize(scope = Post.all)
      @scope = scope
    end

    def sport_posts
      scope.where(category: 'sports')
    end

    def sport_posts_count
      sport_posts.count
    end

    def sport_posts_with_published_comments
      sport_posts.joins(:comments).where(comments: { published: true })
    end

    def sport_posts_with_recent_published_comments
      sport_posts_with_published_comments.where('DATE(comments.created_at) > ?', 30.days.ago)
    end
  end
end
