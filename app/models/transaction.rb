class Transaction < ActiveRecord::Base
  def self.balance
    Transaction.all.reduce(0.0) do |s, t|
      s += t.amount
    end
  end
end
