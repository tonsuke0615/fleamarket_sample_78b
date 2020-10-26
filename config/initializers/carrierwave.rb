# CarrierWaveの設定呼び出し
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

# 保存先の分岐
CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage :file # 開発環境:public/uploades下に保存
  else
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    }
    config.fog_directory='fleamarket-sample-78b' #S3のバケット名
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/fleamarket-sample-78b'
  end  
end