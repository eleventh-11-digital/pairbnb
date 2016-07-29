class StaticController < ApplicationController
  def home
  	if params[:query].present?
  		Listing.reindex
      @listings = Listing.search(params[:query], autocomplete: true)

    else
      @listings = Listing.all
    end
  end
  
  # def autocomplete
  #   render json: Listing.search(params[:query], autocomplete: true, limit: 10).map(&:property_name)
  # end

end
