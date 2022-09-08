class VendorSweetsController < ApplicationController
    def create
        vendor_sweet = VendorSweet.new(vendor_id: params[:vendor_id], sweet_id: params[:sweet_id], price: params[:price])
        if vendor_sweet.save
        render json: {id: vendor_sweet.id, name: vendor_sweet.vendor.name, price: vendor_sweet.price}
        else
            render json: {errors: vendor_sweets.errors.full_messages}, status: 422
        end
    end
    def destroy
        vendor_sweet = VendorSweet.find_by(id: params[:id])
        if vendor_sweet
        vendor_sweet.destroy
        render json: {}
        else
            render json: {errors: "VendorSweet not found"}, status: 404
        end
    end
    private

    def vendor_sweets_params
        params.permit()
    end
end
