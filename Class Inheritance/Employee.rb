require_relative "Manager.rb"

class Employee
  
  attr_reader :salary, :name, :boss, :title, :bonus

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @bonus = @salary * multiplier
  end

end

Shawna = Employee.new("Shawna", "TA", 12000, Darren)
David = Employee.new("David", "TA", 10000, Darren)

Shawna.bonus(1.03)
David.bonus(1.03)
