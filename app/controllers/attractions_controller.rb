class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height))
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height))

  end

  def ride
    @user = current_user
    @attraction = Attraction.find(params[:id])

    ride = Ride.create(user_id: @user.id , attraction_id: @attraction.id)

    flash[:notice] = ride.take_ride

    redirect_to user_path(@user)

  end

end
