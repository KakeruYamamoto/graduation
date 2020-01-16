
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? #開発とテストは今まで通りに
    config.storage = :file
    config.fog_directory = 'achieve-development123'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/achieve-development123'
  elsif Rails.env.production? #本番はS3に保存する
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
# credentials下にaws_access_key_idとaws_secret_access_keyはあるよ
      region: 'ap-northeast-1'
    }
    config.fog_directory = 'achieve-production123'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/achieve-production123'

  end
end

CarrierWave.configure do |config|
  require 'carrierwave/storage/abstract'
  require 'carrierwave/storage/file'
  require 'carrierwave/storage/fog'

  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      # aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      # aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      aws_access_key_id:     Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region:                'ap-northeast-1',
      path_style:            true,
  }

  config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

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
