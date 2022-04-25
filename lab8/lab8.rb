=begin 1. Створіть клас Hello, під час створення об'єкта якого конструктору можна було
передавати параметр Hello.new('world'). При виклик методу say цього об'єкта hello.say або
при виведенні об'єкта методом puts виводилася б фраза Hello, world!
=end
class Hello 

    @@str = ""
    def initialize(str)
        @@str = str
    end

    def say
        puts "Hello, " + @@str
    end

    def to_s
        "Hello, " + @@str
    end
end

puts "Завдання 1. Hello world class"
h = Hello.new('world')
puts h
h.say

=begin 2. Створіть клас користувача User, який би при створенні об'єкта дозволяв задавати
прізвище, ім'я та по батькові. Метод повинен реалізовувати методи читання та встановлення
прізвища, імені та по батькові.
=end 
class User

    def initialize(surname, name, patronicName)
        @surname = surname
        @name = name
        @patronicName = patronicName
    end

    attr_accessor :name, :surname, :patronicName

    def to_s 
        self.name + " " + self.surname + " " + self.patronicName
    end
end

puts "\nЗавдання 2. User class"
u = User.new('B','A','C')
puts u.name + " " + u.surname + " " + u.patronicName
u.name = "K"
u.surname = "D"
u.patronicName = "G"
puts u

=begin
3. Створіть клас Group, конструктор якого може приймати довільну кількість об'єктів класу
User (з попереднього завдання). Реалізуйте в класі Group метод each, за допомогою якого можна
обійти список користувачів, наприклад, щоб вивести їх у стандартний потік.
=end

class Group
 
    def each
        puts "Users:"
        @users.each {|u|
            puts u
        }
    end
    def initialize(*args)
        if args.any?{|el| (el.instance_of? User) == false} 
            throw "Only objects of type User can be passed!"
        end
        @users = args
    end
end

puts "\nЗавдання 3. Group"
g = Group.new(u,User.new('bb4b','aaa','vvv'))
g.each

=begin 
4. Створіть клас Foo, метод new якого може приймати хеш. Об'єкти класу Foo повинні
відповідати методам, назви яких збігаються з ключами хеша. Як результат методи повинні
повертати значення, що відповідають ключу в хеш
=end

class Foo
    def initialize(methods)
        methods.each { |method| define_singleton_method(method[0]) { method[1] } }
    end
end


puts "\nЗавдання 4. Foo"
f = Foo.new({'one' => "Hi there!", 'two' => 5125})
puts f.one
puts f.two

=begin
5. Створіть клас List, метод якого може приймати довільну кількість параметрів. Об'єкти
класу повинні підтримувати метод each, блок якого послідовно передаються параметри, задані
при створенні об'єкта
=end

class List
    def initialize(*args)
        @objs = args
    end

    def each (&block) 
        block.call(@objs)
    end

end

puts "\nЗавдання 5. List"
l = List.new(1,4,5,3)

l.each{|arg| puts arg}