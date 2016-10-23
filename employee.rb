require 'csv'

class Employee

  attr_reader :name, :email, :phone

  attr_accessor :review, :salary, :satisfactory_performance, :department

  def initialize(name, email, phone="", salary=nil, review = "", satisfactory_performance = true)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = review
    @satisfactory_performance = satisfactory_performance

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

  def ==(other)
    name == other.name && email == other.email && phone == other.phone && salary == other.salary
  end

  def to_hash
    { name: name, email: email, phone: phone, salary: salary, review: review, satisfactory_performance: satisfactory_performance }
  end

end
