# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( score_types.js score_types.css scores.js scores.css boards.js boards.css award_options.js award_options.css packards.css datapicker/bootstrap-datepicker.js nomination_types.js  nomination_types.css awards.js awards.css  )
