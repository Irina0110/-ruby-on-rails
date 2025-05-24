class RatingsController < AuthenticatedController
  # Получение всех оценок
  def index
    @countries = Country.all
    @cities = City.all

    @hotels = Hotel.all

    # Фильтрация по имени
    if params[:name].present?
      @hotels = @hotels.where("name ILIKE ?", "%#{params[:name]}%")
    end

    # Фильтрация по стране
    if params[:country_id].present?
      @hotels = @hotels.where(country_id: params[:country_id])
    end

    # Фильтрация по городу
    if params[:city_id].present?
      @hotels = @hotels.where(city_id: params[:city_id])
    end

    # Фильтрация по диапазону рейтинга
    if params[:min_rating].present? || params[:max_rating].present?
      @hotels = @hotels.select do |hotel|
        avg = hotel.values.average(:value).to_f
        min = params[:min_rating].present? ? params[:min_rating].to_f : 0
        max = params[:max_rating].present? ? params[:max_rating].to_f : 5
        avg >= min && avg <= max
      end
    end
  end

  # Показать отдельную оценку
  def show
    @rating = Rating.find(params[:id])
  end

  # Форма для добавления новой оценки
  def new
    @rating = Rating.new
  end

  # Создание новой оценки
  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to @rating, notice: "\u041E\u0446\u0435\u043D\u043A\u0430 \u0431\u044B\u043B\u0430 \u0443\u0441\u043F\u0435\u0448\u043D\u043E \u0441\u043E\u0437\u0434\u0430\u043D\u0430."
    else
      render :new
    end
  end

  # Форма для редактирования оценки
  def edit
    @rating = Rating.find(params[:id])
  end

  # Обновление оценки
  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      redirect_to @rating, notice: "\u041E\u0446\u0435\u043D\u043A\u0430 \u0431\u044B\u043B\u0430 \u0443\u0441\u043F\u0435\u0448\u043D\u043E \u043E\u0431\u043D\u043E\u0432\u043B\u0435\u043D\u0430."
    else
      render :edit
    end
  end

  # Удаление оценки
  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to ratings_path, notice: "\u041E\u0446\u0435\u043D\u043A\u0430 \u0431\u044B\u043B\u0430 \u0443\u0441\u043F\u0435\u0448\u043D\u043E \u0443\u0434\u0430\u043B\u0435\u043D\u0430."
  end

  private

  # Параметры для оценки
  def rating_params
    params.require(:rating).permit(:score, :review)
  end
end
