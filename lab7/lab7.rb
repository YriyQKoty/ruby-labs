
=begin 
1. Нехай є фабрика, яка випускає дитячі іграшки: плюшеве ведмежа (TeddyBear), м'яч
(Ball), кубики (Cube). Створіть клас Factory, який має метод Factory.build, який повертає
об'єкт класів TeddyBear, Ball або Cube, який відповідає одній з іграшок. Як аргумент метод
повинен приймати один із символів: :teddy_bear, :ball, :cube, за якими буде прийматися
рішення про те, об'єкт якого класу слід повернути. У класі Factory слід передбачити метод total,
який повертає загальну кількість іграшок. Крім того, необхідно реалізувати метод offers, що
повертає хеш, ключами якого виступають символи :teddy_bear, :ball, :cube, а значення -
кількість створених іграшок цього типу.
=end

class Toy 
end 

class TeddyBear < Toy
end

class Ball < Toy
end

class Cube < Toy
end

class Factory

    @@teddy_bear_count = 0
    @@ball_count = 0
    @@cube_count = 0

    def build (toy)
         
                if (toy.instance_of? TeddyBear)
                 @@teddy_bear_count += 1
                elsif (toy.instance_of? Ball)
                @@ball_count += 1
                elsif (toy.instance_of? Cube)
                @@cube_count += 1
                else throw "wrong type"

            end
    end


    def total
        puts (@@teddy_bear_count + @@ball_count + @@cube_count).to_s + " total toys."
    end

    def offers
        {'teddies' => @@teddy_bear_count, 'balls' => @@ball_count, 'cubes' => @@cube_count}
    end

end


puts "Завдання 1. Іграшки"

f = Factory.new
f.build(TeddyBear.new)
f.build(Ball.new)
f.total
puts f.offers


#2. Додайте до стандартного класу Integer методи minutes, hours, days, які повертають
#кількість секунд, що відповідають заданим значенням. Наприклад, виклик 5.minutes повинен
#повернути 300, виклик 2.hours - 7200, а 1.days - 86400.
#Завдання 2
module NewIntegerModule
    def minutes
        self * 60
    end

    def hours
        self * 60 * 60
    end

    def days
        self * 60 * 60 * 24
    end
end

class Integer
    include NewIntegerModule
end

puts "\nЗавдання 2. Нові методи"
puts(1.minutes.to_s + " seconds")
puts(1.hours.to_s + " seconds")
puts(1.days.to_s + " seconds")


=begin 3. Створіть клас, об'єкти якого моделюють перехід речовини в твердий (solid), рідкий
(liquid) та газоподібний стан (gaz). Метод status має повертати стан об'єкта. Крім того, об'єкти
класу повинні підтримувати методи, які переводять об'єкт з одного стану до іншого:
− melt - із твердого в рідке;
− freeze - з рідкого у тверде;
− boil - з рідкого до газоподібного;
− condense - із газоподібного в рідке;
− sublime - із твердого в газоподібне;
− deposit — із газоподібного до твердого.
Завдання 3. Речовини
=end 

class Substance

    %i[solid liquid gas]
    
    attr_reader :currentState

    def initialize(state)
        throw "unknown state!" if !%i[solid liquid gas].include?(state.to_sym)
        @currentState = state
      
    end
    
   
    def status
        currentState
    end

    def melt
        throw "not a solid substance!" if currentState != :solid.to_s
        puts "melting..."
        to_liq
       
    end

    def condense
        throw "not a gas substance!" if currentState != :gas.to_s
        puts "condensing..."
        to_liq
        
    end
    
    def freeze
        throw "not a liquid substance!" if currentState != :liquid.to_s
        puts "freezing..."
        to_solid
        
    end

    def deposit
        throw "not a gas substance!" if currentState != :gas.to_s
        puts "depositing..."
        to_solid
       
    end


    def boil
        throw "not a liquid substance!" if currentState != :liquid.to_s
        puts "boiling..."
        to_gas
       
    end

    def sublime
        throw "not a solid substance!" if currentState != :solid.to_s
        puts "subliming..."
        to_gas
       
    end

    private

    def to_liq
        @currentState = :liquid
        self.status
    end

    def to_solid
        @currentState = :solid
        self.status
    end

    def to_gas
        @currentState = :gas
        self.status
    end

end

puts "\nЗавдання 3. Субстанції"
s = Substance.new("solid")
puts s.status
puts s.melt

