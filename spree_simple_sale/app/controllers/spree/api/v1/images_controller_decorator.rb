module Spree
  module Api
    module V1
       ImagesController.class_eval do
      
       def upload_image_using_static_url
          product = Spree::Product.find_by(id: params[:id])
          byebug
          params[:static_urls].each do |static_url|
              product.images.create!(static_url: static_url, attachment_file_name:"static_url")
          end
       end
     end
    end
  end
end

 # Spree::Asset.create(
 #              viewable_type: "Spree::Variant", 
 #              viewable_id: params[:id],
 #              static_url: static_url
 #              )