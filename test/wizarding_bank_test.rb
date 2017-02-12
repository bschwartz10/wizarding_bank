gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/wizarding_bank'
require './lib/wizarding_person'

class BankTest < Minitest::Test
  def test_bank_exists
    chase = Bank.new("JP Morgan Chase")

    assert_instance_of Bank, chase
  end

  def test_bank_has_unique_name
    chase = Bank.new("JP Morgan Chase")
    wells_fargo = Bank.new("Wells Fargo")

    assert_equal "JP Morgan Chase", chase.bank_name
    assert_equal "Wells Fargo", wells_fargo.bank_name
  end

  def test_open_account
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)

    assert_equal person1.bank_accounts, chase.open_account(person1)
  end

  def test_bank_balance_starts_at_zero
    chase = Bank.new("JP Morgan Chase")

    assert_equal 0, chase.account_balance
  end

  def test_banks_can_accepts_deposits
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)

    assert_equal 750, chase.deposit(person1, 750)
    assert_equal 250, person1.galleon
    assert_equal "Minerva does not have enough galleons to perform this deposit.", chase.deposit(person1, 5000)
  end

  def test_banks_can_accept_withdrawals
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)

    assert_equal 750, chase.deposit(person1, 750)
    assert_equal 500, chase.withdrawal(person1, 250)
    assert_equal "Insufficient funds.", chase.withdrawal(person1, 5000)
  end

  def test_banks_can_tranfer_galleons_to_eachother
    chase = Bank.new("JP Morgan Chase")
    wells_fargo = Bank.new("Wells Fargo")
    person1 = Person.new("Minerva", 1000)

    assert_equal person1.bank_accounts, chase.open_account(person1)
    assert_equal person1.bank_accounts, wells_fargo.open_account(person1)
    assert_equal 750, chase.deposit(person1, 750)
    assert_equal 500, chase.transfer(person1, wells_fargo, 250)

    chase = Bank.new("JP Morgan Chase")
    wells_fargo = Bank.new("Wells Fargo")
    person1 = Person.new("Minerva", 1000)
    chase.open_account(person1)
    wells_fargo.open_account(person1)

    assert_equal "Insufficient funds.", chase.transfer(person1, wells_fargo, 25000)
  end

  def test_total_galleons_in_bank
    skip
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)
    chase.open_account(person1)
    chase.open_account(person2)
    chase.deposit(person1, 750)
    chase.deposit(person2, 250)

    assert_equal 1000, chase.total_galleons
  end
end
