#Configuration for Amazon S3
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :region => ENV['S3_REGION'],
    :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
  }
  # For testing, upload files to local 'tmp' folder.
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  # To let CarrierWave work on heroku
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory = ENV['S3_BUCKET_NAME']
  config.asset_host = "//#{ENV['S3_BUCKET_NAME']}.s3.amazonaws.com"
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
