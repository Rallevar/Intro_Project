class VendorsController < ApplicationController
  def index
    # Get the column to sort by from the URL (default to 'id' if none)
    sort_by = params[:sort] || 'id'

    # Get the direction from the URL (default to 'asc' if none)
    if params[:direction] == 'desc'
      sort_dir = 'desc'
    else
      sort_dir = 'asc'
    end

    # Sort the vendors using the column and direction
    @vendors = Vendor.order(sort_by + ' ' + sort_dir)
  end

  def show
    @vendor = Vendor.includes(:accounts).find(params[:id])
  end
end
