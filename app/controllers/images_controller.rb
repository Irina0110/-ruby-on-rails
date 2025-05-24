class ImagesController < AuthenticatedController
  before_action :authenticate_user!, only: [ :rate ]

  def show
    @image = Image.find(params[:id])
    @average_rating = @image.average_rating
    @user_rating = @image.values.find_by(user_id: current_user&.id)&.value
  end

  def rate
    @image = Image.find(params[:id])
    rating = params[:value].to_i

    value = @image.values.find_or_initialize_by(user_id: current_user.id)
    value.value = rating

    if value.save
      @image.update(ave_value: @image.average_rating) # обновляем кеш в поле ave_value
      redirect_to @image, notice: "Спасибо за оценку!"
    else
      redirect_to @image, alert: "Оценка должна быть от 1 до 5."
    end
  end
end
