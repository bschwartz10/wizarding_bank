require 'pry'

class Bank
attr_reader :bank_name
attr_accessor :account_balance

  def initialize(bank_name)
    puts "#{bank_name} has been created."
    @bank_name = bank_name
    @account_balance = 0
  end

  def open_account(person)
    puts "An account has been opened for #{person.name} with #{bank_name}"
    person.bank_accounts << bank_name
  end

  def deposit(person, deposit_amount)
    if deposit_amount < person.galleon
      person.galleon -= deposit_amount
      @account_balance += deposit_amount
      puts "#{deposit_amount} galleons have been deposited into #{person.name} #{bank_name} account. Balance: #{account_balance} Galleons: #{person.galleon}"
      @account_balance
    else
      "#{person.name} does not have enough galleons to perform this deposit."
    end
  end

  def withdrawal(person, withdrawal_amount)
    if withdrawal_amount < account_balance
      @account_balance -= withdrawal_amount
      person.galleon += withdrawal_amount
      puts "#{person.name} has withdrawn #{withdrawal_amount} galleons. Balance #{account_balance}"
      @account_balance
    else
      "Insufficient funds."
    end
  end

  def transfer(person, bank, transfer_amount)
    if person.bank_accounts.include?(bank.bank_name)
      if transfer_amount < account_balance
        @account_balance -= transfer_amount
        bank.account_balance += transfer_amount
        puts "#{person.name} has transferred #{transfer_amount} galleons from #{bank_name} to #{bank.bank_name}."
        @account_balance
      else
        "Insufficient funds."
      end
    else
      "#{person.name} does not have an account with #{bank.bank_name}"
    end

  end

end
