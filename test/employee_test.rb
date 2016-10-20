require 'minitest/autorun'
require 'minitest/pride'
require_relative '../employee'

class EmployeeTest <Minitest::Test

  def test_employee_exists
    assert Employee
  end

  def test_create_employee
    kvothe = Employee.new( "Kvothe Kingkiller", "kvothe@theuniversity.com", "777-555-7777", 40000)
    assert_equal "Kvothe Kingkiller", kvothe.name
  end

  def test_employee_review
    kvothe = Employee.new( "Kvothe Kingkiller", "kvothe@theuniversity.com", "777-555-7777", 40000)
    kvothe.add_review("He has stolen princesses back from sleeping barrow kings. He has burned down the town of Trebon. He has spent the night with Felurian and left with both his sanity and his life. He was expelled from the University at a younger age than most people are allowed in. He tread paths by moonlight that others fear to speak of during day. He has talked to Gods, loved women, and written songs that make the minstrels weep. You may have heard of him.")
    assert_equal "He has stolen princesses back from sleeping barrow kings. He has burned down the town of Trebon. He has spent the night with Felurian and left with both his sanity and his life. He was expelled from the University at a younger age than most people are allowed in. He tread paths by moonlight that others fear to speak of during day. He has talked to Gods, loved women, and written songs that make the minstrels weep. You may have heard of him.", kvothe.review
  end

  def test_employee_satisfactory_performance
    kvothe = Employee.new( "Kvothe Kingkiller", "kvothe@theuniversity.com", "777-555-7777", 40000)
    assert kvothe.satisfactory_performer?
  end

  def test_employee_satisfactory_performance
    kvothe = Employee.new( "Kvothe Kingkiller", "kvothe@theuniversity.com", "777-555-7777", 40000)
    kvothe.satisfactory_performance = false
    refute kvothe.satisfactory_performer?
  end

  def test_give_raise
    kvothe = Employee.new( "Kvothe Kingkiller", "kvothe@theuniversity.com", "777-555-7777", 40000)
    kvothe.give_raise(0.1)
    assert_equal 44000, kvothe.salary
  end

end
