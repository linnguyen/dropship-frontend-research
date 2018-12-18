Spree::Core::Engine.add_routes do
  # Add your extension routes here
  get "/sale" => "home#sale"
  post "/images_ex" => "images#create_ex"
  get  "show-test/:id" => "products#test_show"

  # For api test
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
        post "/image_url" => "images#upload_image_using_static_url"
    end
  end
end


