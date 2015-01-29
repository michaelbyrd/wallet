class Transaction < ActiveRecord::Base
  validates :amount, presence: true
  validates :account_type, presence: true
  def self.balance(arr)
    arr.reduce(0.0) { |s, t| s += t.amount }
  end

  def self.checkings
    Transaction.where(account_type: "Checkings")
  end

  def self.savings
    Transaction.where(account_type: "Savings")
  end
end
