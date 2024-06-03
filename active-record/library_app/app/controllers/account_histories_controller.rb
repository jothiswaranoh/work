# app/controllers/account_histories_controller.rb

class AccountHistoriesController < ApplicationController
  before_action :set_account_history, only: [:show, :edit, :update, :destroy]

  def index
    @account_histories = AccountHistory.all
  end

  def show
  end

  def new
    @account_history = AccountHistory.new
  end

  def create
    @account_history = AccountHistory.new(account_history_params)
    if @account_history.save
      redirect_to @account_history, notice: 'Account history was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @account_history.update(account_history_params)
      redirect_to @account_history, notice: 'Account history was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @account_history.destroy
    redirect_to account_histories_url, notice: 'Account history was successfully destroyed.'
  end

  private

  def set_account_history
    @account_history = AccountHistory.find(params[:id])
  end

  def account_history_params
    params.require(:account_history).permit(:date,:account_id, :description, :amount)
  end
end
