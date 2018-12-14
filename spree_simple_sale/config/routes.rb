Spree::Core::Engine.add_routes do
  # Add your extension routes here
  get "/sale" => "home#sale"
  post "/images_ex" => "images#create_ex"
end


