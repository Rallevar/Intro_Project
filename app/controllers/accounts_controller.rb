=begin
  Name: Nathan Keenan
  Program: Business Information Technology
  Course: WEBD-3011 (277098)
  Created: 2026-04-06
  Updated: 2024-04-08
=end

class AccountsController < ApplicationController

  def index
    # Get the column to sort by from the URL (default to 'id' if none)
   sort_by = params[:sort] || 'id'

    # Get the direction from the URL (default to 'asc' if none)
   if params[:direction] == 'desc'
    sort_dir = 'desc'
   else
    sort_dir = 'asc'
   end

    # Sort the accounts using the column and direction
    @accounts = Account.order(sort_by + ' ' + sort_dir).page(params[:page]).per(25)
  end

  def show

    # Find the account by its ID from the URL, and load its associated vendors
    @account = Account.includes(:vendors).find(params[:id])
  end
end
