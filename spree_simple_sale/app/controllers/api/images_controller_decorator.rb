Spree::Api::BaseController.class_eval do
	 def create_ex
          authorize! :create, Image
          @image = scope.images.new(image_params)
          if @image.save
            respond_with(@image, status: 201, default_template: :show)
          else
            invalid_resource!(@image)
          end
     end

      def scope
          if params[:product_id]
            Spree::Product.friendly.find(params[:product_id])
          elsif params[:variant_id]
            Spree::Variant.find(params[:variant_id])
          end
      end

      def image_params
         params.require(:image).permit(permitted_image_attributes)
      end
end