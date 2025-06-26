JWT_PRIVATE_KEY = OpenSSL::PKey::RSA.new(File.read(Rails.root.join("config/keys/private.pem")))
JWT_PUBLIC_KEY  = OpenSSL::PKey::RSA.new(File.read(Rails.root.join("config/keys/public.pem")))
