=begin
  Name: Nathan Keenan
  Program: Business Information Technology
  Course: WEBD-3011 (277098)
  Created: 2026-04-06
  Updated: 2024-04-08
=end

class WardsController < ApplicationController

  def index
    # Get the column to sort by from the URL (default to 'id' if none)
    sort_by = params[:sort] || 'id'

    # Get the direction from the URL (default to 'asc' if none)
    if params[:direction] == 'desc'
      sort_dir = 'desc'
    else
      sort_dir = 'asc'
    end

    # Sort the wards using the column and direction
    @wards = Ward.order(sort_by + ' ' + sort_dir).page(params[:page]).per(25)
  end

  def show
    # Find the ward by its ID from the URL, and load its associated vendors
    @ward = Ward.includes(:vendors).find(params[:id])
  end
end
