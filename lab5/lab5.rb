#1. Створіть метод, який надає довідник днів тижня (1 – понеділок, 2 – вівторок, 3 – середа,
#4 – четвер, 5 – п'ятниця, 6 – субота, 7 – неділя). Метод повинен приймати номер та повертати
#назву для тижня, що відповідає цьому номеру. У разі помилкового номера має повертатись
#значення nil.
def firstTask
    puts "Завдання 1."
    dict = {1 => "Пн", 2 => "Вт", 3 => "Ср", 4 => "Чт", 5 => "Пт", 6 => "Сб", 7 => "Нд"}
    number = $stdin.gets.to_i
    return dict[number] != nil ? dict[number] : nil
end
puts firstTask
    

#2. Створіть програму, яка приймає як аргумент три цілих числа. Перевірте, що передані
#числа дійсно цілі. Як результат, програма повинна повертати максимальне значення серед чисел.
def secTask(*args)
    puts "\nЗавдання 2."
    return args.all? {|i| i.is_a?(Integer)} ? args.max : "Не всі числа цілі!"
end
puts secTask(1,5,8,53,15,61,2)


#3. Створіть масив із 10 рядків із прізвищами користувачів. Виведіть список користувачів у
#алфавітному порядку.
def thirdTask
    puts "\nЗавдання 3."
    surnames = ["Churchill", "Miller", "Campbell", "Grant", "Avery", "Hodges", "Hughes", "Walker", "Dowd", "Payne"]
    puts surnames.sort
end
puts thirdTask

#4. У UNIX-подібних операційних системах є утиліта ncal, яка виводить календар на
#поточний місяць:.
def fourthTask
    puts "\nЗавдання 4."
    require 'date'

    days = %w[Mon Tue Wed Thu Fri Sat Sun]
    end_of_month = Date.civil(Date.today.year, Date.today.month, -1).day
    puts "  #{Date::MONTHNAMES[Date.today.month]} #{Date.today.year}"
    (0...days.size).each do |i|
      print days[i]
      day = i - (Date.today - Date.today.mday + 1).cwday + 2
    
      while day <= end_of_month

        print(day <= 0 ? '  ' : " #{day}")
        day += 7
      end
      puts
    end
end
fourthTask
