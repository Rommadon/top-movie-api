class Api::MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_movie, only: [:show, :update, :destroy]

  # GET /movies
  def show
      @movies = Movie.all
      render json: @movies
  end

  # POST /movies
  def create
      @movie = Movie.new(movie_params)

      if @movie.save
          render json: @movie
      else
          render error: {error: 'Failed to add movie record'}, status: 400
      end
  end

  # GET /movies/:id
  def show
    render json: @movie
  end

  # PUT /movies/:id
  def update
    @movie.update(movie_params)
    head :no_content
  end

  # DELETE /movies/:id
  def destroy
    @movie.destroy
    head :no_content
  end

  private

  def movie_params
      params.require(:movie).permit(:name, :year, :genre)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end