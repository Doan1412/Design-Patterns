class ArticlesController < ApplicationController
  def index
    @articles = Article
                .accessible_by(current_ability)
                .popular_with_video_type
    # @articles = PopularVideoQuery.new.call Article
  end
end
