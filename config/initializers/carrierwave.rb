# frozen_string_literal: true

CarrierWave.configure do |config|
  require 'carrierwave/storage/abstract'
  require 'carrierwave/storage/file'
  require 'carrierwave/storage/fog'

  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    # binding.pry
    # aws_access_key_id:     Rails.application.credentials.aws[:access_key_id],
    # aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    region: 'ap-northeast-1',
    # secret_key_base:        Rails.application.credentials.secret_key_base,
    path_style: true
  }

  config.fog_public     = true
  config.fog_attributes = { 'Cache-Control' => 'public, max-age=86400' }

  case Rails.env
  when 'production'
    config.fog_directory = 'achieve-production123'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/achieve-production123'
  when 'development'
    config.fog_directory = 'achieve-development123'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/achieve-development123'
  when 'test'
    config.fog_directory = 'achieve-test123'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/achieve-test123'
  end
end
