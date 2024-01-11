require "stripe"
require "dotenv"
require "sinatra"

Dotenv.load # for loading environment variables
Stripe.api_key = ENV['STRIPE_SECRET_KEY']



set :static, true
set :public_folder, File.join(File.dirname(__FILE__), ENV["STATIC_DIR"])
set :port, 3000



get '/' do
  content_type "text/html"
  send_file File.join(settings.public_folder, "index.html")
end


get "/public-keys" do
  content_type "application/json"
  { key: ENV['STRIPE_PUBLIC_KEY'] }.to_json
end
