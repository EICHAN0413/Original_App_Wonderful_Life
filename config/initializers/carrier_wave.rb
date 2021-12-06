require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage :fog
      config.fog_provider = 'fog/aws'  #=> 追加
      config.fog_directory     =  ENV['S3_BUCKET']
      config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
      config.fog_credentials = {
        # Amazon S3用の設定
        provider: 'AWS',
        region: ENV['S3_REGION'],     # 例（東京）: 'ap-northeast-1'
        aws_access_key_id: ENV['S3_ACCESS_KEY'],
        aws_secret_access_key: ENV['S3_SECRET_KEY'],
        path_style: true
      }
      # キャッシュの保存期間
    else # 本番環境以外の場合はアプリケーション内にアップロード
      config.storage :file
      config.enable_processing = false if Rails.env.test?
    end
    # 日本語ファイル名の設定
    CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
  end