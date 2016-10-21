require 'minitest/autorun'
require 'minitest/pride'
require_relative '../data_store'

class DataStoreTest < Minitest::Test

  def test_data_store_exists
    assert DataStore
  end

  def test_data_store_accesses_employees
    company = DataStore.new
    new_hash = { employees: [], departments: [] }
    assert_equal new_hash, company.all
  end

end
