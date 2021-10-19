CarrierWave.configure do |config|
    require 'carrierwave/storage/abstract'
    require 'carrierwave/storage/file'
    require 'carrierwave/storage/fog'
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV["AKIAWC22E6XSUCAEV45K"],
        aws_secret_access_key: ENV["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"],
        region:                'ap-northeast-1',
        path_style:            true,
    }
    config.fog_public     = true
    config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
    case Rails.env
      when 'production'
        config.fog_directory = 'wonderful-life-production'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/wonderful-life-production'
      when 'development'
        config.fog_directory = 'wonderful-life-develop'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/wonderful-life-develop'
    end
  end