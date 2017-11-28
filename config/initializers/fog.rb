CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        
  config.fog_credentials = {
    provider:              'AWS',                        
    aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],                    
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],                       
    region:                'ap-northeast-2',              
  }
  config.fog_directory  = 'kospar'  # 자신의 bucket 이름으로 수정       
end