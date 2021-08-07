class NilClass
  def blank?
    true
  end
end

class String
  def blank?
    self.length === 0
  end
end

["", "hello", nil].each do |element|
  puts element unless element.blank?
end


### 


class Numeric
  def seconds
    self
  end

  def minutes
    self * 60.seconds
  end

  def hours
    self * 60.minutes
  end

  def before
    self * -1
  end

  def after
    self
  end
end

puts 3.hours.before
puts 12.minutes.after

## method_missing

class Roman
  def self.method_missing name, *args
    roman = name.to_s
    roman.gsub!("IV", "IIII" ) 
    roman.gsub!("IX", "VIIII" ) 
    roman.gsub!("XL", "XXXX" ) 
    roman.gsub!("XC", "LXXXX" )

    (
      roman.count("I") + 
      roman.count("V") * 5 + 
      roman.count("X") * 10 + 
      roman.count("L") * 50 + 
      roman.count("C") * 100
    )
  end
end

fifteen = Roman.XI + Roman.IV
puts fifteen

