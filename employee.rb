require 'csv'

class Employee

  attr_reader :name, :email, :phone

  attr_accessor :review, :salary, :satisfactory_performance

  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = ""
    @satisfactory_performance = true

    CSV.open("./data/employees.csv", "wb") do |csv|
      csv << [name, email, phone, salary, review, satisfactory_performance]
    end

  end

  def add_review(text)
    self.review = text
    self.satisfactory_performance = false if has_negative_review?
  end

  def satisfactory_performer?
    self.satisfactory_performance
  end

  def give_raise(percentage)
    self.salary += percentage * self.salary
  end

  def positive_looking_review?
    self.review.match(/(is|been|an).*(?<!not)\s(a|an).*\sasset/)||self.review.match(/(has|is|'s)\s(?!no).*(?<!no)effective/)
  end

  def negative_looking_review?
    self.review.match(/(has|have|had|was)\s(?!no).*(?<!no)\sconcern/)||self.review.match(/not\sdo.*well/)
  end

  def has_negative_review?
    negative_looking_review? && !positive_looking_review?
  end

end
