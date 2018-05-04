# config/initializers/kaminari.rb
#PAra não conflitar com a Will_paginate
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end