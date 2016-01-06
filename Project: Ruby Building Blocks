def caesar_cipher(sentance, shift)
	alphabet = ['a'..'z']
	count = 0
	sentance.split("").each do |letter|
		sentance[count] = alphabet[alphabet.index(letter) + shift]
	end
end

puts caesar_cipher("abcde", 5)