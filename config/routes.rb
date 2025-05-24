Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }, sign_out_via: [ :delete ]

  # Главная страница
  root "main#index"

  # Статические страницы
  get "contacts", to: "main#contacts", as: "main_contacts"
  get "help",     to: "main#help",     as: "main_help"
  get "about",    to: "main#about",    as: "main_about"

  # Оценки
  resources :ratings, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]

  # Основное: маршруты для изображений (отелей)
  resources :images do
    member do
      post :rate  # POST /images/:id/rate — пользователь ставит оценку
    end
  end

  resources :hotels, except: [ :index ] do
    member do
      post :rate
      post :upload_image
    end
  end

  get "cities/by_country", to: "cities#by_country"

  get "ratings", to: "ratings#index"
end
