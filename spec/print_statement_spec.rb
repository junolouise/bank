# frozen_string_literal: true

require 'print_statement'

describe BankStatement do
  it 'contains no transactions upon initialization' do
    expect(subject.transactions).to be_empty
  end

  it 'prints blank statement if there are no transactions' do
    expect(subject.print_statement).to eq('date || credit || debit || balance')
  end

  describe '#add_to_transactions' do
    it 'adds a transaction into the transactions' do
      transaction = { credit: 20, balance: 20.00 }
      subject.add_to_transactions(transaction)
      expect(subject.transactions.count).to eq(1)
    end
  end

  it 'adds a transaction to history with the time/date' do
    transaction = { credit: 50}
    @timestamp = Time.now.strftime("%d/%m/%Y")
    allow(Time).to receive(:now).and_return(@timestamp)
    subject.add_to_transactions(transaction)
    expect(subject.transactions).to include({time: @timestamp, credit: 50}) 
  end
end
