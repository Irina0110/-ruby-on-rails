$(document).on('turbolinks:load', function() {
  var i18n = $('#js-i18n').data();

  // При загрузке страницы делаем селект города неактивным
  $('#hotel_city_id').prop('disabled', true).empty().append('<option value="">' + i18n.selectCountry + '</option>');
});

// Делегируем обработчик на изменение страны
$(document).on('change', '#hotel_country_id', function() {
  var i18n = $('#js-i18n').data();
  var country_id = $(this).val();
  $('#hotel_city_id').empty().append('<option value="">' + i18n.loadingCities + '</option>').prop('disabled', true);

  if (country_id) {
    $.get('/cities/by_country', { country_id: country_id }, function(data) {
      $('#hotel_city_id').empty().append('<option value="">' + i18n.selectCity + '</option>');
      $.each(data, function(i, city) {
        $('#hotel_city_id').append($('<option>', { value: city.id, text: city.text }));
      });
      $('#hotel_city_id').prop('disabled', false); // Активируем селект после загрузки городов
    });
  } else {
    $('#hotel_city_id').empty().append('<option value="">' + i18n.selectCountry + '</option>').prop('disabled', true);
  }
});
