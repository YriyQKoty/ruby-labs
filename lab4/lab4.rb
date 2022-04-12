#1. Створіть скрипт, який зводив одне ціле число в інше, 
#не вдаючись до оператора ** або методу pow
def firstTask
   puts "Завдання 1."
   puts "Введіть число-основу:"
   base = $stdin.gets.to_i
   puts "Введіть число-степінь:"
   result = base
    (1...$stdin.gets.to_i).each do |_| 
        result *= base
    end
   puts result
end
firstTask

#2. Створіть скрипт, який би визначав
#парність чи непарність числа лише за допомогоюпорозрядних операторів.
def secTask
    puts "\nЗавдання 2."
    puts "Введіть число:"
    puts $stdin.gets.to_i & 1 != 1 ? "Парне" : "Непарне"
end
secTask

#3. Існують дві змінні: fst = 10 і snd = 20. Поміняйте значення змінних місцями. Намагайтеся
# використовувати мінімальну кількість коду
def thirdTask
    puts "\nЗавдання 3."
    fst = 7
    snd = -124
    snd += fst
    fst = snd - fst
    snd -= fst
    puts fst
    puts snd
end
thirdTask

#4. За допомогою оператора % виведіть число π (3.14159265358979) з точністю до другого
#знака після коми (3.14).
def fourthTast
    puts "\nЗавдання 4."
    pi = 3.14159265358979
    puts pi - pi % 0.01
end
fourthTast