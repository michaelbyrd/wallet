class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    @balance = Transaction.balance
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to transactions_path
    else
      redirect_to transactions_path
    end
  end

  private def transaction_params
    params.require(:transaction).permit(:account_type, :amount)
  end
end