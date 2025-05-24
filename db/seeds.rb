# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Справочник стран
countries = [
  { name: "Россия" },
  { name: "США" },
  { name: "Франция" },
  { name: "Германия" },
  { name: "Италия" },
  { name: "Испания" },
  { name: "Великобритания" },
  { name: "Китай" },
  { name: "Япония" },
  { name: "Турция" }
]

countries.each do |country_attrs|
  Country.find_or_create_by!(country_attrs)
end

# Справочник городов
cities = [
  { name: "Москва", country_name: "Россия" },
  { name: "Санкт-Петербург", country_name: "Россия" },
  { name: "Сочи", country_name: "Россия" },
  { name: "Нью-Йорк", country_name: "США" },
  { name: "Лос-Анджелес", country_name: "США" },
  { name: "Майами", country_name: "США" },
  { name: "Париж", country_name: "Франция" },
  { name: "Марсель", country_name: "Франция" },
  { name: "Берлин", country_name: "Германия" },
  { name: "Мюнхен", country_name: "Германия" },
  { name: "Рим", country_name: "Италия" },
  { name: "Милан", country_name: "Италия" },
  { name: "Барселона", country_name: "Испания" },
  { name: "Мадрид", country_name: "Испания" },
  { name: "Лондон", country_name: "Великобритания" },
  { name: "Манчестер", country_name: "Великобритания" },
  { name: "Пекин", country_name: "Китай" },
  { name: "Шанхай", country_name: "Китай" },
  { name: "Токио", country_name: "Япония" },
  { name: "Осака", country_name: "Япония" },
  { name: "Стамбул", country_name: "Турция" },
  { name: "Анкара", country_name: "Турция" }
]

cities.each do |city_attrs|
  country = Country.find_by(name: city_attrs[:country_name])
  City.find_or_create_by!(name: city_attrs[:name], country: country)
end

# Сбросим старые переводы
Translation.delete_all

# Заголовки и основные кнопки
Translation.create!(locale: 'ru', key: 'site.title', value: 'Оценка отелей')
Translation.create!(locale: 'en', key: 'site.title', value: 'Hotel Ratings')

Translation.create!(locale: 'ru', key: 'site.contacts', value: 'Контакты')
Translation.create!(locale: 'en', key: 'site.contacts', value: 'Contacts')

Translation.create!(locale: 'ru', key: 'site.rating', value: 'Рейтинг')
Translation.create!(locale: 'en', key: 'site.rating', value: 'Rating')

Translation.create!(locale: 'ru', key: 'site.login', value: 'Войти')
Translation.create!(locale: 'en', key: 'site.login', value: 'Login')

Translation.create!(locale: 'ru', key: 'site.logout', value: 'Выйти')
Translation.create!(locale: 'en', key: 'site.logout', value: 'Logout')

Translation.create!(locale: 'ru', key: 'site.signup', value: 'Регистрация')
Translation.create!(locale: 'en', key: 'site.signup', value: 'Sign up')

Translation.create!(locale: 'ru', key: 'site.enter_email', value: 'Введите email')
Translation.create!(locale: 'en', key: 'site.enter_email', value: 'Enter email')

Translation.create!(locale: 'ru', key: 'site.enter_password', value: 'Введите пароль')
Translation.create!(locale: 'en', key: 'site.enter_password', value: 'Enter password')

Translation.create!(locale: 'ru', key: 'site.enter_password_confirmation', value: 'Введите пароль еще раз')
Translation.create!(locale: 'en', key: 'site.enter_password_confirmation', value: 'Enter password again')

Translation.create!(locale: 'ru', key: 'site.signup_button', value: 'Зарегистрироваться')
Translation.create!(locale: 'en', key: 'site.signup_button', value: 'Sign up')

Translation.create!(locale: 'ru', key: 'main.add_hotel', value: 'Добавить отель')
Translation.create!(locale: 'en', key: 'main.add_hotel', value: 'Add hotel')

Translation.create!(locale: 'ru', key: 'main.all_hotels', value: 'Все отели')
Translation.create!(locale: 'en', key: 'main.all_hotels', value: 'All hotels')

Translation.create!(locale: 'ru', key: 'main.no_hotels', value: 'Нет отелей, соответствующих условиям поиска.')
Translation.create!(locale: 'en', key: 'main.no_hotels', value: 'No hotels matching your search.')

Translation.create!(locale: 'ru', key: 'main.details', value: 'Подробнее')
Translation.create!(locale: 'en', key: 'main.details', value: 'Details')

# Форма отеля
Translation.create!(locale: 'ru', key: 'hotel.name', value: 'Название отеля')
Translation.create!(locale: 'en', key: 'hotel.name', value: 'Hotel name')

Translation.create!(locale: 'ru', key: 'hotel.description', value: 'Описание')
Translation.create!(locale: 'en', key: 'hotel.description', value: 'Description')

Translation.create!(locale: 'ru', key: 'hotel.country', value: 'Страна')
Translation.create!(locale: 'en', key: 'hotel.country', value: 'Country')

Translation.create!(locale: 'ru', key: 'hotel.city', value: 'Город')
Translation.create!(locale: 'en', key: 'hotel.city', value: 'City')

Translation.create!(locale: 'ru', key: 'hotel.images', value: 'Фотографии')
Translation.create!(locale: 'en', key: 'hotel.images', value: 'Images')

Translation.create!(locale: 'ru', key: 'hotel.create', value: 'Создать')
Translation.create!(locale: 'en', key: 'hotel.create', value: 'Create')

Translation.create!(locale: 'ru', key: 'hotel.back', value: 'Назад на главную')
Translation.create!(locale: 'en', key: 'hotel.back', value: 'Back to Home')

# Рейтинг
Translation.create!(locale: 'ru', key: 'hotel.average_rating', value: 'Средний рейтинг')
Translation.create!(locale: 'en', key: 'hotel.average_rating', value: 'Average rating')

Translation.create!(locale: 'ru', key: 'hotel.your_rating', value: 'Ваша оценка (1-5)')
Translation.create!(locale: 'en', key: 'hotel.your_rating', value: 'Your rating (1-5)')

Translation.create!(locale: 'ru', key: 'hotel.rate_title', value: 'Оценить отель')
Translation.create!(locale: 'en', key: 'hotel.rate_title', value: 'Rate hotel')

Translation.create!(locale: 'ru', key: 'hotel.rate', value: 'Оценить')
Translation.create!(locale: 'en', key: 'hotel.rate', value: 'Rate')

Translation.create!(locale: 'ru', key: 'hotel.already_rated', value: 'Вы уже оценили этот отель.')
Translation.create!(locale: 'en', key: 'hotel.already_rated', value: 'You have already rated this hotel.')

Translation.create!(locale: 'ru', key: 'filter.name', value: 'Название')
Translation.create!(locale: 'en', key: 'filter.name', value: 'Name')

Translation.create!(locale: 'ru', key: 'filter.min_rating', value: 'Мин. рейтинг')
Translation.create!(locale: 'en', key: 'filter.min_rating', value: 'Min. rating')

Translation.create!(locale: 'ru', key: 'filter.max_rating', value: 'Макс. рейтинг')
Translation.create!(locale: 'en', key: 'filter.max_rating', value: 'Max. rating')

Translation.create!(locale: 'ru', key: 'filter.search', value: 'Поиск')
Translation.create!(locale: 'en', key: 'filter.search', value: 'Search')

# Прочее
Translation.create!(locale: 'ru', key: 'hotel.no_photos', value: 'Нет фото')
Translation.create!(locale: 'en', key: 'hotel.no_photos', value: 'No photo')

Translation.create!(locale: 'ru', key: 'hotel.add_photo', value: 'Загрузить фото')
Translation.create!(locale: 'en', key: 'hotel.add_photo', value: 'Upload photo')

Translation.create!(locale: 'ru', key: 'hotel.photos', value: 'Фотографии')
Translation.create!(locale: 'en', key: 'hotel.photos', value: 'Photos')

Translation.create!(locale: 'ru', key: 'hotel.select_multiple_files', value: 'Можно выбрать несколько файлов')
Translation.create!(locale: 'en', key: 'hotel.select_multiple_files', value: 'You can select multiple files')

Translation.create!(locale: 'ru', key: 'hotel.select_country', value: 'Сначала выберите страну')
Translation.create!(locale: 'en', key: 'hotel.select_country', value: 'Select country first')

Translation.create!(locale: 'ru', key: 'hotel.loading_cities', value: 'Загрузка...')
Translation.create!(locale: 'en', key: 'hotel.loading_cities', value: 'Loading...')

Translation.create!(locale: 'ru', key: 'hotel.select_city', value: 'Выберите город')
Translation.create!(locale: 'en', key: 'hotel.select_city', value: 'Select city')

# Контакты
Translation.create!(locale: 'ru', key: 'main.contacts.title', value: 'Свяжитесь с нами')
Translation.create!(locale: 'en', key: 'main.contacts.title', value: 'Contact Us')

Translation.create!(locale: 'ru', key: 'main.contacts.contact_info', value: 'Контактная информация')
Translation.create!(locale: 'en', key: 'main.contacts.contact_info', value: 'Contact Information')

Translation.create!(locale: 'ru', key: 'main.contacts.address', value: 'Адрес')
Translation.create!(locale: 'en', key: 'main.contacts.address', value: 'Address')

Translation.create!(locale: 'ru', key: 'main.contacts.phone', value: 'Телефон')
Translation.create!(locale: 'en', key: 'main.contacts.phone', value: 'Phone')

Translation.create!(locale: 'ru', key: 'main.contacts.email', value: 'Email')
Translation.create!(locale: 'en', key: 'main.contacts.email', value: 'Email')

Translation.create!(locale: 'ru', key: 'main.contacts.working_hours', value: 'Время работы')
Translation.create!(locale: 'en', key: 'main.contacts.working_hours', value: 'Working Hours')

Translation.create!(locale: 'ru', key: 'main.contacts.write_us', value: 'Напишите нам')
Translation.create!(locale: 'en', key: 'main.contacts.write_us', value: 'Write to Us')

Translation.create!(locale: 'ru', key: 'main.contacts.your_name', value: 'Ваше имя')
Translation.create!(locale: 'en', key: 'main.contacts.your_name', value: 'Your Name')

Translation.create!(locale: 'ru', key: 'main.contacts.message', value: 'Сообщение')
Translation.create!(locale: 'en', key: 'main.contacts.message', value: 'Message')

Translation.create!(locale: 'ru', key: 'main.contacts.send', value: 'Отправить')
Translation.create!(locale: 'en', key: 'main.contacts.send', value: 'Send')

Translation.create!(locale: 'ru', key: 'main.contacts.working_hours_schedule.weekdays', value: 'Понедельник - Пятница: 9:00 - 18:00')
Translation.create!(locale: 'en', key: 'main.contacts.working_hours_schedule.weekdays', value: 'Monday - Friday: 9:00 AM - 6:00 PM')

Translation.create!(locale: 'ru', key: 'main.contacts.working_hours_schedule.saturday', value: 'Суббота: 10:00 - 16:00')
Translation.create!(locale: 'en', key: 'main.contacts.working_hours_schedule.saturday', value: 'Saturday: 10:00 AM - 4:00 PM')

Translation.create!(locale: 'ru', key: 'main.contacts.working_hours_schedule.sunday', value: 'Воскресенье: выходной')
Translation.create!(locale: 'en', key: 'main.contacts.working_hours_schedule.sunday', value: 'Sunday: Closed')
