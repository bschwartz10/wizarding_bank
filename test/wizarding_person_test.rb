gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
  require './lib/wizarding_person'

class PersonTest < Minitest::Test

  def test_person_exists
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    assert_instance_of Person, person1
    assert_instance_of Person, person2
  end

  def test_person_has_a_name
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    assert_equal "Minerva", person1.name
    assert_equal "Luna", person2.name
  end

  def test_person_has_galleon
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    assert_equal 1000, person1.galleon
    assert_equal 500, person2.galleon
  end

  def test_belong_to_bank
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    assert person1.bank_accounts
    assert person2.bank_accounts
  end
end
