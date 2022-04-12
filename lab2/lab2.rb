#1. Нехай змінна pi містить значення 3.1415926535. Напишіть програму, яка виводить
#значення числа з точністю до другого знака після точки (3.14).
def firstTask 
    puts "Завдання 1. Float precision"
    pi = 3.1415926535
    puts pi.round(2)
end
firstTask 

#2. Складіть масив, що складається із назв днів тижня українською мовою. Виведіть кожен
#день тижня на окремому рядку.
def secTask 
    puts "\nЗавдання 2. Дні тижня"
    days = ['Понеділок', 'Вівторок', 'Середа' , 'Четвер', 'П`ятниця', 'Субота', 'Неділя']

    days.each{ |elem| puts elem}
end
secTask

#3. Створіть хеш colors, який як ключі містить символи з назвами кольорів веселки
#англійською мовою, а як значення – відповідні їм російські назви кольорів. Напишіть програму,
#яка виводить довільний елемент хешу.
def thirdTask 
    puts "\nЗавдання 3. Кольори веселки"
    colors = {'red' => 'червоний', 'orange' => 'помаранчевий', 'yellow' => 'жовтий', 'green' => 'зелений', 'blue' => 'синій', 'violet' => 'фіолетовий'}

    colors.each{ |eng, ukr| print eng + "-" + ukr + "\n"}
end
thirdTask

#4. На добу 24 години, складіть діапазони ранкових, денних, вечірніх та нічних годин.
def fourthTask
    puts "\nЗавдання 4. Діапазони годин дня"
    morning = (5..11).to_a
    day = (12..17).to_a
    evening = (18..22).to_a
    night = (23..24).to_a.concat((1..4).to_a)

    hours = {'morn hours' => morning, 'day hours' => day,'evening hours' => evening, 'night hours' => night}

    hours.each{ |key, value| print key + " - " + value.to_s + "\n"}
end
fourthTask

#5. Нехай є рядок з початковими та кінцевими пробілами: ' hello world '. Напишіть
#програму, яка прибирає пробіли з початку та кінця рядка 'hello world'.
def fifthTask
    puts "\nЗавдання 5. Пробіли"
    str = "   hello, world   "
    puts str.strip
end
fifthTask

#6. Нехай є два рядки: 'hello' та 'world'. Отримайте один рядок: 'hello world'.
def sixthTask
    puts "\nЗавдання 6. Об'єднання рядків"
    str1 = "hello"
    str2 = "world"
    result = str1.concat(" " + str2)
    puts result
end
sixthTask

#7. Створіть клас користувача User, об'єкти якого зберігають прізвище, ім'я та по батькові
#користувача. Напишіть програму, яка створює об'єкт user класу User. Помістіть в об'єкт ваше
#прізвище, ім'я та по батькові. Використовуючи об'єкт user, виведіть їх у консоль.
class User
    def initialize(name, surname, thirdname)
        @name = name
        @surname = surname
        @thirdname = thirdname
    end

    #Showing a User off
    def showOf()
        print "\nI`m #{@surname.to_s} #{@name.to_s} #{@thirdname.to_s}"
    end
end

def seventhTask
    puts "\nЗавдання 7. ПІБ"
    puts "Enter your name, surname and third name:"
    user = User.new(gets, gets, gets)
    user.showOf
end
seventhTask

#8. Створіть клас точки у двовимірній системі координат Point. Створіть дві точки з
#координатами (3, 6) та (-1, 5). Обчисліть відстань між точками.
class Point

    def initialize(x: 0,y: 0) 
        @@x = "x"
        @@y = "y"
        class << self
          def x
            @x.to_i
          end

          def y
            @y.to_i
          end
        end

        if x.is_a? Integer
            @x = x
        end

        if y.is_a? Integer
            @y = y
        end
    end

    def distanceTo(point) 
        if point.is_a? Point 
            puts "Distance between: " + Math.sqrt(((point.x - @x) ** 2) + ((point.y - @y) ** 2)).round(3).to_s
        else print "Not a point!"
        end
    end

    def show() 
        puts "Point: (#{@x},#{@y})"
    end
end

def eighthTask
    puts "\nЗавдання 8. Точки"
    point1 = Point.new(x: 3,y: 6)
    point2 = Point.new(x: -1,y: 5)
    point1.show
    point2.show

    point1.distanceTo(point2)
end
eighthTask

#9. Напишіть програму, яка підраховує кількість елементів у масиві $LOAD_PATH.
def ninthTask 
    puts "\nЗавдання 9. Elements in array"
    puts $LOAD_PATH
    puts  $LOAD_PATH.count
end
ninthTask
