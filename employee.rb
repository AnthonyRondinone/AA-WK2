require "byebug"
class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end


end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def add_employee(employee)
    self.employees << employee
    employee.boss = self
  end

  def suboordinate_salaries
    sum = 0

    employees.each do |el|
      if el.is_a? Manager
        sum += el.salary + el.suboordinate_salaries
      else
        sum += el.salary
      end
    end

    sum
  end

  def bonus(multiplier)
    suboordinate_salaries * multiplier
  end

end

ned = Manager.new("Ned", "Founder", 1_000_000)
darren = Manager.new("Darren", "TA Manager", 78_000)
shawna = Employee.new("Shawna", "TA", 12_000)
david = Employee.new("David", "TA", 10_000)

ned.add_employee(darren)
darren.add_employee(shawna)
darren.add_employee(david)

puts ned.bonus(5)
puts darren.bonus(4)
puts david.bonus(3)
