=begin
1. Розширте клас Integer в такий спосіб, щоб числа відповідали метод to_a. За
замовчуванням метод повинен переводити число у двійкове уявлення та повертати масив з нулів
та одиниць, що представляють десяткове число у двійковому форматі:
10.to_a #[1, 0, 1, 0]
Необов'язковий аргумент методу to_a має задавати розрядність числа.
Наприклад, для вісімкових та шістнадцяткових форматів метод повинен повертати такі
масиви:
10.to_s(8) # [1, 2]
10.to_s(16) # ['a']
=end
module NewIntegerModule
    def to_a(sys = 2)
        if !(sys.instance_of? Integer)
            throw "Wrong type! Should be Integer!" 
        end

        if(self == 0) 
            0
        end
        if (sys <= 16 && sys > 1)
            dict = {
                0 => "0",
                1 => "1",
                2 => "2",
                3 => "3",
                4 => "4",
                5 => "5",
                6 => "6",
                7 => "7",
                8 => "8",
                9 => "9",
               10 => "a", 
               11 => "b", 
               12 => "c", 
               13 => "d", 
               14 => "e", 
               15 => "f"  
            }

            result = ""
            val = self
            while(val != 0)
                result = dict[val % sys] + result
                val = val / sys
            end

            puts "\n"
            print result.chars
        else
            puts ("\nOops, coming soon...")
        end
    end
end

class Integer
    include NewIntegerModule
end

puts "\nЗавдання 1. Розрядність"
8.to_a
10.to_a(8)
154.to_a(16)




=begin
2. Нехай є хеш, в якому ключем є назва книги, а значенням — масив авторів:
authors = {
 'Design Patterns in Ruby' => ['Russ Olsen'],
 'Eloquent Ruby' => ['Russ Olsen'],
 'The Well-Grounded Rubyist' => ['David A. Black'],
 'The Ruby Programming Language' => ['David Flanagan', 'Yukihiro
Matsumoto'],
 'Metaprogramming Ruby 2' => ['Paolo Perrotta'],
 'Ruby Cookbook' => ['Lucas Carlson', 'Leonard Richardson'],
 'Ruby Under a Microscope' => ['Pat Shaughnessy'],
 'Ruby Performance Optimization' => ['Alexander Dymo'],
 'The Ruby Way' => ['Hal Fulton', 'Andre Arko']
}
Створіть із нього новий хеш, у якому ключем виступатиме автор, а значенням — кількість
книжок, що він написав. Відсортуйте авторів за кількістю книг. У групі авторів, які написали
однакову кількість книг, відсортуйте авторів за абеткою.
=end

puts "\n\nЗавдання 2. Автори"
authors = {
    'Design Patterns in Ruby' => ['Russ Olsen'],
    'Eloquent Ruby' => ['Russ Olsen'],
    'The Well-Grounded Rubyist' => ['David A. Black'],
    'The Ruby Programming Language' => ['David Flanagan', 'Yukihiro Matsumoto'],
    'Metaprogramming Ruby 2' => ['Paolo Perrotta'],
    'Ruby Cookbook' => ['Lucas Carlson', 'Leonard Richardson'],
    'Ruby Under a Microscope' => ['Pat Shaughnessy'],
    'Ruby Performance Optimization' => ['Alexander Dymo'],
    'The Ruby Way' => ['Hal Fulton', 'Andre Arko']
   }

autors_raw = authors.values.to_a.flatten.uniq
hash_new = {}
autors_raw.each{|a| hash_new[a] = authors.select{|k,v| v.include?(a)}.keys.size}
result = hash_new.sort.to_h.sort_by{|k,v| v}
puts result
