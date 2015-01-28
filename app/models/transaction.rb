class Transaction < ActiveRecord::Base
  def self.balance
    Transaction.all.reduce(0.0) do |s, t|
      s += t.amount
    end
  end

  def self.checking_balance
    Transaction.where(account_type: "Checkings").reduce(0.0) { |s, t| s += t.amount }
  end

  def self.savings_balance
    Transaction.where(account_type: "Savings").reduce(0.0) { |s, t| s += t.amount }
  end
end
