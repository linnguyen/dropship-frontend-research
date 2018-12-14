Spree::Core::Engine.add_routes do
  # Add your extension routes here
  get "/sale" => "home#sale"
  post "/images_ex" => "images#create_ex"
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post "/yap" => "images#yap"
    end
  end
end


