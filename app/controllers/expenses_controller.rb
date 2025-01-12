class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @expenses = current_user.expenses.order(logged_date: :desc)
  end

  def new
    @expense = current_user.expenses.build
  end

  def create
    @expense = current_user.expenses.build(expense_params)

    if @expense.save
      redirect_to expenses_path, notice: 'Expense was successfully logged.'
    else
      render :new, alert: 'Error logging expense.'
    end
  end

  def edit
    @expense = current_user.expenses.find(params[:id])
  end

  def update
    @expense = current_user.expenses.find(params[:id])

    if @expense.update(expense_params)
      redirect_to expenses_path, notice: 'Expense updated successfully.'
    else
      render :edit, alert: 'Error updating expense.'
    end
  end

  def destroy
    @expense = current_user.expenses.find(params[:id])
    @expense.destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:item_name, :cost, :logged_date)
  end

end
