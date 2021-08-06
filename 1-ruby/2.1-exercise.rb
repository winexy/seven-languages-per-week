=begin
напишите простой инструмент поиска, который отыскивал бы в файле строки, 
содержащие указанную фразу, и выводил бы их на экран.
Для этого вам потребуется написать простое регуляр- ное выражение, 
читающее целые строки из файла. (В Ruby это делается на удивление просто.) 
При желании добавьте вывод номеров строк.
=end

def input(message)
  puts message
  return gets.strip
end

path = input "Enter path to file:"
search = input "Enter search string:"

if not File.exists? path
  puts "[Error]: Given path does not exist"
  exit 1
end

f = File.open(path)

count = 1
f.readlines.map do |line|
  if line.include? search
    puts "#{line}"
    count += 1
  end
end

puts "Total matching lines: #{count}"

f.close