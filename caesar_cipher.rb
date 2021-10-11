def keys_to_work_with(ascci_code, key, alphaCsase)
  key_to_get_end = alphaCsase - ascci_code
  return ((key - key_to_get_end) - 1)
end

def initialize_the_caesar(alphaCase, keys)
  return alphaCase + keys
end

def go_back_to_a_OR_A(ascci_code, ascci_code_test_case, key)
  if ascci_code_test_case >= 90 && ascci_code_test_case < 97
    return initialize_the_caesar(65, keys_to_work_with(ascci_code, key, 90))
  else
    return initialize_the_caesar(97, keys_to_work_with(ascci_code, key, 122))
  end
end

def caesar_cipher(string, key)
  str_arr = string.split("")
  caesar_arr = []
  str_arr.each do |char|
    if char >= 'a' && char <= 'z' || char >= 'A' && char <= 'Z'
      convert_ascci = char.ord
      caesar = convert_ascci + key
      if caesar > 122 || caesar >= 90 && caesar < 97
        caesar = go_back_to_a_OR_A(convert_ascci,caesar, key)
      end
      caesar_arr.push(caesar.chr)
    else
      caesar_arr.push(char)
    end
  end
  return caesar_arr.join
end


print "Give me a string\n>> "
str = gets.chomp
resul = caesar_cipher(str, 5)
puts 
puts resul