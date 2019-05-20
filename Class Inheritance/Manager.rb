# require_relative "Employee.rb"

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

Shawna = Employee.new("Shawna", "TA", 12000, "Darren")
David = Employee.new("David", "TA", 10000, "Darren")

Shawna.bonus(1.03)
puts David.bonus(1.03)

class Manager < Employee

  attr_reader :employee_list

  def initialize(name, title, salary, boss, employees = [])
    super(name, title, salary, boss)
    @employee_list = employees
  end

  def bonus(multiplier)
    total_salary = 0
    @employee_list.each do |employee|
      if employee.is_a?(Manager) && employee.employee_list.is_a?(Array)
        employee.employee_list.each do |subemployee|
          total_salary += subemployee.salary
        end
      else
        total_salary += employee.salary
      end
    end
    @bonus = total_salary * multiplier
  end

end

Darren = Manager.new("Darren", "TA Manager", 78000, "Ned", [Shawna, David])
Ned = Manager.new("Ned", "Founder", 1000000, nil, [Darren])

puts Darren.bonus(1.10)
puts Ned.bonus(5)