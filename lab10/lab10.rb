=begin
Створіть клас Unit, який моделює колектив із семи осіб: керівник, два бекенд-розробники,
два фронтенд-розробники, тестувальник і дизайнер. Для моделювання кожного співробітника
створіть вкладений клас Unit::Employee. Об'єкт класу Unit повинен дозволяти додавати,
видаляти, редагувати співробітників та виводити їх повний список в алфавітному порядку. Крім
того, створіть метод або набір методів, що дозволяють фільтрувати команду за ролями,
наприклад, запитувати список тестувальників або бекенд-розробників.
=end

module Roles
    MANAGER = "manager"
    BACKEND = "backend"
    FRONTEND = "frontend"
    DESIGNER = "designer"
    TESTER = "tester"
end

class Unit

    class Employee
        def initialize(fullname = "NoName",roleName)
            @role = roleName
            @fullname = fullname
        end

        def to_s
            self.class.to_s + ": " + @fullname + "; Role: " + @role.to_s
        end

        attr_accessor :role, :fullname
    end

    def initialize
        @employees = []
    end

    attr_accessor :employees

   
    def addEmployees(*employees)
        if employees.any?{|el| !(el.instance_of? Unit::Employee)} 
            throw "Wrong type! Should be Unit::Employee!" 
        end
        @employees.push(employees)
        @employees = @employees.flatten
        
    end
    

    def removeEmployee(employee)
        @employees.delete(employee)
    end

    def print
        puts @employees.sort {|a,b| a.fullname <=> b.fullname}
    end

    def filterByRole(role)
        puts @employees
        .sort {|a,b| a.fullname <=> b.fullname}
        .select {|a| a.role == role}

    end

end

puts "Завдання. Клас Unit"
u = Unit.new
puts "---adding---"
u.addEmployees(Unit::Employee.new('John', Roles::FRONTEND),
Unit::Employee.new('Bill', Roles::FRONTEND),
 Unit::Employee.new('Marin',Roles::BACKEND),
 Unit::Employee.new('Dan',Roles::BACKEND),
 Unit::Employee.new('Helen',Roles::MANAGER),
 Unit::Employee.new('Adam',Roles::DESIGNER),
 Unit::Employee.new('Haris',Roles::TESTER))
puts "---all---"
u.print
puts "---filtering---"
u.filterByRole(Roles::BACKEND)
puts "---removing---"
e = Unit::Employee.new("Kenie",Roles::MANAGER)
u.addEmployees(e)
puts "---before delete---"
u.filterByRole(Roles::MANAGER)
u.removeEmployee(e)
puts "---after delete---"
u.filterByRole(Roles::MANAGER)
