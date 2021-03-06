# frozen_string_literal: true

class BankStatement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def print_statement
    'date || credit || debit || balance'
  end

  def add_to_transactions(transaction)
    transaction[:time] = Time.new.strftime("%d/%m/%Y")
    @transactions << transaction
  end
end
