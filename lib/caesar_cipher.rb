class Cipher

    def caesar_cipher(inputStr, key)
        
        key = key % 26 if key > 26                                          # loops the key if it's larger than 26
        
        @key = key

        inputArr = inputStr.split('')

        outputArr = inputArr.map do |letter|

            newLetterOrd = letter.ord + @key
            
            if letter.ord >= 97 && letter.ord <= 122                        # if lower case letter

                newLetterOrd = newLetterOrd - 26 if newLetterOrd > 122      # loop from z - a if necessary

            elsif letter.ord >= 65 && letter.ord <= 90                      # if upper case letter

                newLetterOrd = newLetterOrd - 26 if newLetterOrd > 90       # loop from Z - A if necessary

            else                                                            # if not letter

                newLetterOrd = letter.ord                                   # do not add key

            end

            newLetterOrd.chr

        end

        outputStr = outputArr.join('')
        
        puts ""
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts "Cipher Output: #{outputStr}"
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts ""
    return outputStr
    end
end # class Cipher

# while true                                                              # user interface
#     puts "Enter a new string, please."
#     newStr = gets.chomp
#     puts "Enter a new key, please."
#     newKey = gets.chomp
#     caesar_cipher(newStr, newKey.to_i)
# end