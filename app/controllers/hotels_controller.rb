class HotelsController < AuthenticatedController
  before_action :set_locale

  def show
    @hotel = Hotel.find(params[:id])
    @average_rating = @hotel.values.average(:value)&.round(2) || 0
    @images = @hotel.images
  end

  def rate
    @hotel = Hotel.find(params[:id])
    existing_value = @hotel.values.find_by(user: current_user)
    if existing_value
      redirect_to @hotel, alert: "Вы уже оценили этот отель!"
    else
      @value = @hotel.values.new(user: current_user, value: params[:score], hotel_id: @hotel.id)
      if @value.save
        redirect_to @hotel, notice: "Оценка сохранена"
      else
        redirect_to @hotel, alert: "Ошибка: #{@value.errors.full_messages.join(', ')}"
      end
    end
  end

  def upload_image
    @hotel = Hotel.find(params[:id])
    image = @hotel.images.build(file: params[:file])
    image.save
    redirect_to @hotel
  end

  def index
    @hotels = Hotel.all
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params.except(:images))
    if @hotel.save
      if params[:hotel][:images]
        params[:hotel][:images].each do |img|
          image = @hotel.images.create(file: img, name: img.original_filename)
          unless image.persisted?
            Rails.logger.error "Image not saved: #{image.errors.full_messages.join(', ')}"
          end
        end
      end
      redirect_to root_path, notice: "Отель успешно создан"
    else
      render :new
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :description, :country_id, :city_id, images: [])
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
