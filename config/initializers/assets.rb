# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.

Rails.application.config.assets.precompile += %w( foundation.css )
Rails.application.config.assets.precompile += %w( app.css )
Rails.application.config.assets.precompile += %w( alphabetical_paginate.js )
Rails.application.config.assets.precompile += %w( adies.js )

if Rails.env.development?
  require 'webmock'
  include WebMock::API

  stub_request(:post, ENV["STORMPATH_APPLICATION_HREF"]).to_return(body: "stormpath_response.json")
end
