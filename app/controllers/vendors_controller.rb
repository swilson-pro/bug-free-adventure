class VendorsController < ApplicationController
    def index
        vendors = Vendor.all
        render json: vendors, only: [:id, :name]
    end
    def show
        vendor = Vendor.find_by(id: params[:id])
        # render json: vendor, only: [:id, :name], include: [:vendor_sweets]
        if vendor
        # render json: vendor.to_json(only: [:id, :name], include: [vendor_sweets: { only: [:id, :name, :price]}])
        render json: {id: vendor.id, name: vendor.name, vendor_sweets: vendor.vendor_sweets}
        # render json: vendor.to_json(only: [:id, :name], include: [:vendor_sweets])
        else
            # render json: {error: "Vendor not found"}, status: 404
        end
    end



end
