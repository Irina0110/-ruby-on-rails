Rails.application.config.assets.paths << Rails.root.join("assets", "images", "pictures")
Rails.application.config.assets.precompile += %w[ hotel_form.js jquery.js ]
