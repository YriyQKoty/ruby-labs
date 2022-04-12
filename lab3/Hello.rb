class Hello

    def Hello 
        date = Time.now
        if date.hour  in (0..6)
             puts "Good night!"
        elsif date.hour in (7..12)
            puts "Good Morning!"
        elsif date.hour  in (13..18)
            puts "Good Day!"
        else 
            puts "Good Evening!"
        end
    end
end