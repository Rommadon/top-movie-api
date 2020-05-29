class WelcomeController < ActionController::Base
  layout 'application'

  def index
    @movies = Movie.all
  end
end
