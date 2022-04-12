require "date"
require_relative "hello"

#3. Створіть клас Hello у в окремому файлі. Усередині класу необхідно реалізувати метод
#Hello, який виводить вітання залежно від поточного часу доби. З 06:00 до 12:00 метод повинен
#повертати «Доброго ранку», з 12:00 до 18:00 — «Доброго дня», з 18:00 до 00:00 — «Доброго
#вечора», з 00:00 до 06:00 - «Доброї ночі». Підключіть клас у файлі з головною програмою та
#виведіть привітання за його допомогою.
Hello.new.Hello

#1. Створіть програму, яка приймає як аргументи послідовність чисел. Підрахуйте суму
#чисел і виведіть результат.
def sum(numbers)
    puts numbers.to_s
    if numbers.all? {|i| i.is_a?(Integer) | i.is_a?(Float)  } 
        puts "Sum:" + numbers.sum{|el| el}.to_s
    else puts "Not a number collection."
    end
end
puts "Завдання 1. Сума послідовності чисел"
sum([1,34,6,4,3, 0.5])
sum([1,-1,5,4])
sum([1,-1,"64","2"])


#2. Створіть програму, яка приймає рік, місяць та день народження користувача. Обчисліть
#вік користувача та виведіть результат.
def calculateAge(year, month, day) 
    puts "\nЗавдання 2. Обрахування віку"
    dob = Date.civil(year, month, day)
    current = Date.today

    diff = (current - dob).to_i
    if diff < 0 then puts "Incorrect date."
    else 
        
        years = (diff/365.25).to_i
        months = (diff/30.4375).to_i - years*12
        puts "Date of birth: #{day}.#{month}.#{year}"
        puts "Age: " + years.to_s + " year(s) " + months.to_s + " month(s)"
    end

end
calculateAge(2021, 2, 17)