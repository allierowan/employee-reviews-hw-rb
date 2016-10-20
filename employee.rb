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
  end

  def add_review(text)
    self.review = text
  end

  def satisfactory_performer?
    satisfactory_performance
  end

  def give_raise(percentage)
    self.salary += percentage * self.salary
  end

end
