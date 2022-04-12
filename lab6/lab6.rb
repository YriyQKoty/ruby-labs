#1. Створіть клас користувачів Student, який дозволяє зберігати в об'єкті прізвище, ім'я, по
#батькові користувача, а також його оцінку за предмет (в діапазоні від 1 до 5). Створіть програму,
#яка формує 10 масив об'єктів класу Student. Обчисліть середню оцінку та виведіть список
#користувачів, чия оцінка вища за середню.
class Student
    def initialize(name, surname, thirdname, mark)

        raise "Оцінка повинна бути в межах від 1 до 5!" if mark < 1 || mark > 5

        @name = name
        @surname = surname
        @thirdname = thirdname
        @mark = mark
    end

    attr_reader :mark

    attr_reader :surname
    
end

def firstTask
    puts "Завдання 1."
    students = [
        Student.new("Ben","Churchill","",4), 
        Student.new("John","Miller","",5), 
        Student.new("Jessica","Miller","",5),
        Student.new("George","Smith","",4),
        Student.new("Bill","Nuke","",2),
        Student.new("Kevin","Avery","",5),
        Student.new("Abdula","Rahmi","",4),
        Student.new("Bellie","North","",3),
        Student.new("Jeremy","Born","",2),
        Student.new("Sofia","Sheptynska","",3)]

    av = students.map{|el| el.mark}.sum.to_f / students.size
    puts "Середня оцінка:" + av.to_s
    puts "Список:" + (students.select{|el| el.mark.to_f > av}).map{|el| el.surname}.to_s

end
firstTask


#2. Створіть хеш, у якому як ключ виступає назва планети Сонячної системи, а як значення —
#маса планети. Сформуйте дві колекції з трьома найлегшими та трьома найважчими планетами.
#Виведіть їх у стандартний потік виводу.
def secTask
    puts "\nЗавдання 2."
    masses = {
        "Сонце" => 8,
        "Земля" => 4,
        "Венера" => 2,
        "Меркурій" => 1,
        "Марс" => 3,
        "Юпітер" => 7,
        "Сатурн" => 6,
        "Уран" => 5
    }.sort_by{|x| x.last}

    puts "Найменші: " + masses.take(3).to_s
    puts "Найбільші: " + masses[-3..-1].to_s

end
secTask

#3. Створіть метод walk, який приймає як єдиний аргумент масив довільного ступеня
#вкладеності: arr = [[[1, 2], 3], [4, 5, 6], [7, [8, 9]]]
#Метод повинен реалізовувати блок з єдиним параметром, який елементи вкладеної
#послідовності передаються у вигляді лінійного списку walk(arr) { |i| puts i }
#Для масиву arr параметр i має пробігати значення від 1 до 9.
def thirdTask
    puts "\nЗавдання 3."
    arr = ->(x) { x.flatten(1) }
    puts arr.([[[1, 5], 3], [1, 5, 6], [8, [1, [5,6,7]]]])
end
thirdTask


#4. Числа Фібоначчі - це послідовність виду 0, 1, 1, 2, 3, 5, ..., де кожне число є сумою двох
#попередніх чисел. Створіть метод fibonacci, який приймає як аргумент порядковий номер числа
#Фібоначчі, а блок передає послідовність чисел від нуля до заданого числа:
#fibonacci(10) { |f| print "#{f}" } # 0 1 1 2 3 5 8 13 21 34 55

puts "\nЗавдання 4."
fibonacci = ->(x) { x < 2 ? x : fibonacci.(x - 1) + fibonacci.(x - 2) }
puts "Число Фібоначі: #{fibonacci.(10)}"

