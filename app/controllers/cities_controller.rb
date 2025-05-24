class CitiesController < ApplicationController
  def by_country
    @cities = City.where(country_id: params[:country_id])
    render json: @cities.map { |c| { id: c.id, text: c.name } }
  end
end
