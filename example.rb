def popular_sport_posts
  popular_posts = []

  if user.posts.where(category: 'sport').any?
    sport_posts = user.posts.where(category: 'sport')
    return sport_posts if sport_posts.size == 1

    if sport_posts.size > 1 && sport_posts.size < 11
      sport_posts.each do |post|
        popular_posts << post if post.comments.where(published: true).present?
      end
    end
  end

  if sport_posts.size > 10
    sport_posts.each do |post|
      next unless post.comments.where(published: true).present?

      post.comments.each do |comment|
        if comment.created_at < 30.days.ago
          popular_posts << post
          break
        end
      end
    end
  end

  popular_posts
end
