=begin
1. Створіть клас людини, від якого успадкуйте клас користувача веб-сайту, від якого в свою чергу
успадкуйте кілька класів:
− звичайний відвідувач;
− автор матеріалу;
− адміністратор;
− модератор
2. Всім об'єктам класів додайте можливість задавати прізвище, ім'я та по батькові користувача, а
також отримувати ці відомості.
3. Досягніть, щоб метод new класу користувача приймав блок, у якому можна ініціалізувати
об'єкт.
4. Додайте в кожен із класів інстанс-метод say, який повинен повідомляти роль користувача.
Перевизначте метод to_s, який повинен повертати той самий рядок, що й метод say. Намагайтеся
максимально виключити повтори коду.

=end

class User
    def initialize(&block)
        args = block.call
        @name = args[0]
        @surname =  args[1]
        @patronicName = args[2]
    end
    
    attr_accessor :name, :surname, :patronicName

end

class WebUser < User

    def initialize
        super
    end

    def say
        self.class
    end

    def to_s
        say
    end
end

class SimpleUser < WebUser
    def initialize
        super
    end
end

class Author < WebUser
    def initialize
        super
    end
end

class Administrator < WebUser
    def initialize
        super
    end
end

class Editor < WebUser
    def initialize
        super
    end
end

puts "Завдання 1-4."
a = Administrator.new  { ["rfe","feef","ght"] }
puts a.say
puts a.to_s
puts a.name
puts a.surname
puts a.patronicName