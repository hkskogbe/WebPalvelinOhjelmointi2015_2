class RatingsController < ApplicationController
  def index

	Rails.cache.write("beer top 3", Beer.top(3)) if cache_does_not_contain_data_or_it_is_too_old("beer top 3")
    @best_beers = Rails.cache.read "beer top 3"

	Rails.cache.write("ratings", Rating.all) if cache_does_not_contain_data_or_it_is_too_old("ratings")
    @ratings = Rails.cache.read "ratings"

	Rails.cache.write("recent ratings", Rating.recent) if cache_does_not_contain_data_or_it_is_too_old("recent ratings")
    @recent = Rails.cache.read "recent ratings"
	
	Rails.cache.write("brewery top 3", Brewery.top(3)) if cache_does_not_contain_data_or_it_is_too_old("brewery top 3")
    @best_breweries = Rails.cache.read "brewery top 3"
	
	Rails.cache.write("style top 3", Style.top(3)) if cache_does_not_contain_data_or_it_is_too_old("style top 3")
    @best_styles = Rails.cache.read "style top 3"
	
	Rails.cache.write("user top 3", User.most_active(3)) if cache_does_not_contain_data_or_it_is_too_old("user top 3")
    @most_active = Rails.cache.read "user top 3"
	
#   @ratings = Rating.all
#	@recent = Rating.recent
#	@best_breweries = Brewery.top(3)
#	@best_beers = Beer.top(3)
#	@best_styles = Style.top(3)  
#	@most_active = User.most_active(3)
  end

  def cache_does_not_contain_data_or_it_is_too_old(n)
	return Rails.cache.fetch(n).nil?
  end

  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def create
    @rating = Rating.new params.require(:rating).permit(:score, :beer_id)

    if current_user.nil?
      redirect_to signin_path, notice:'you should be signed in'
    elsif @rating.save
      current_user.ratings << @rating  ## virheen aiheuttanut rivi
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new
    end
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.delete if current_user == rating.user
    redirect_to :back
  end
end
