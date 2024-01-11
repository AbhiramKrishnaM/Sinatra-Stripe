require "stripe"
require "dotenv"
require "sinatra"

Dotenv.load # for loading environment variables
Stripe.api_key = ENV['STRIPE_SECRET_KEY']

puts Stripe::Plan.list

set :static, true
set :public_folder, "../client"
set :port, 3000

get '/' do
  return "Hello how are you ?"
end
