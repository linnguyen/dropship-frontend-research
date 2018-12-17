module Spree
ProductsController.class_eval do
  before_action :load_product
  def test_show
      	 @variants = @product.variants_including_master.
                  spree_base_scopes.
                  active(current_currency).
                  includes([:option_values, :images])
         @product_properties = @product.product_properties.includes(:property)
         @taxon = params[:taxon_id].present? ? Spree::Taxon.find(params[:taxon_id]) : @product.taxons.first
         byebug
  end

   def load_product
      @products = if try_spree_current_user.try(:has_spree_role?, 'admin')
                    Product.with_deleted
                  else
                    Product.active(current_currency)
                  end

      @product = @products.includes(:variants_including_master, variant_images: :viewable).
                 friendly.distinct(false).find(params[:id])
    end
 end
end