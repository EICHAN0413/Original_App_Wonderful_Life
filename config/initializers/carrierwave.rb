CarrierWave.configure do |config|
    require 'carrierwave/storage/abstract'
    require 'carrierwave/storage/file'
    require 'carrierwave/storage/fog'

    
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
        region:                'ap-northeast-3',
        path_style:            true,
    }
    config.fog_public     = true
    config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
    case Rails.env
      when 'production'
        config.fog_directory = 'oap-wonderful-life-production'
        config.asset_host = 'https://s3-ap-northeast-3.amazonaws.com/oap-wonderful-life-production'
        # config.asset_host = 'https://oap-wonderful-life-production.s3.amazonaws.com'
      when 'development'
        config.fog_directory = 'oap-wonderful-life-develop'
        config.asset_host = 'https://s3-ap-northeast-3.amazonaws.com/oap-wonderful-life-develop'
        # config.asset_host = 'https://oap-wonderful-life-develop.s3.amazonaws.com'

      else
        config.storage :file
        config.enable_processing = false if Rails.env.test?
    end
  end