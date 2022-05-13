=begin 1. Створіть програму, яка розбиває файл на десять частин. Поряд із існуючим файлом
повинні з'явитися десять нових файлів, до розширення яких додаються суфікси x01, x02, ..., x10.
У випадку, якщо розмір файлу менше 10 байтів, програма повинна повідомити про неможливість
розбиття.
=end
def file_exploder(file, parts = 10) 
    file_size = File.size(file)

    if file_size < 10 
        raise 'File is small!'
    end

    part_size = file_size/parts
    File.open(file,'r') do |inf|
        while !inf.eof?
            File.open("x#{'%02d' % ((inf.pos / part_size) + 1)}.txt", 'w') do |outf|
                outf << inf.read(part_size)
            end
        end
    end
end

file_exploder('file.txt')

=begin 
2. Створіть програму підрахунку кількості рядків у файлах проекту. Вона повинна обходити
всі вкладені каталоги проекту та підраховувати кількість рядків у файлах з певними
розширеннями, наприклад, *.rb.
=end

def row_counter(dir, extension) 
    files = Dir.glob("#{dir}**/*.#{extension}")
    row_count = 0
    files.each do |f|
        next if FileTest.directory?(f)
        i = 0
        rows = []
        File.new(f).each_line do |row|
          rows << row
          i += 1
        end
        row_count += i
      end
      
    puts("Rows: #{row_count}")
end

row_counter('../','rb')