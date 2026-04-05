class ExpensesController < ApplicationController

  def index
    # Get the column to sort by from the URL (default to 'id' if none)
    sort_by = params[:sort] || 'id'

    # Get the direction from the URL (default to 'asc' if none)
    if params[:direction] == 'desc'
    sort_dir = 'desc'
    else
    sort_dir = 'asc'
    end

    # Sort the expenses using the column and direction
    @expenses = Expense.order(sort_by + ' ' + sort_dir).page(params[:page]).per(25)
  end

  def show
    @expense = Expense.includes(:ward, :vendor, :account).find(params[:id])
  end
end
