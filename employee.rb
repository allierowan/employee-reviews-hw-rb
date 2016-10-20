class Employee

  attr_reader :name, :email, :phone

  attr_accessor :review, :salary

  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = ""
  end

  def add_review(text)
    self.review = text
  end

end
