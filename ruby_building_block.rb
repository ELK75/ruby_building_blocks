def isDowncase(letter)
	letter == letter.downcase
end

def isUpcase(letter)
	letter == letter.upcase
end

def wraparound(num)
	while num > 25
		num /= 25
	end
	num
end

def caesar_cipher(sentance, shift)
	alphabet = ('a'..'z').to_a
	count = 0
	is_upcase = false
	sentance.split("").each do |letter|
		if letter == letter.upcase
			is_upcase = true
			letter.downcase!
		end
		if alphabet.include? letter
			index_of_alphabet = alphabet.index(letter)
			index_of_alphabet = (index_of_alphabet + shift) % 26

			letter = alphabet[index_of_alphabet]
			if (is_upcase) 
				letter.upcase! 
		  end
			sentance[count] = letter
		end
		count += 1
		is_upcase = false
	end
	sentance
end

#puts caesar_cipher("What a string!", 0)

def stock_picker(stock_prices)
	best_buy, best_sell, best_price = 0, 0, 0
	for buy in 0..stock_prices.size-2
		for sell in buy+1..stock_prices.size-1
			if stock_prices[sell] - stock_prices[buy] > best_price
				best_buy, best_sell = buy, sell
				best_price = stock_prices[sell] - stock_prices[buy]
			end
		end
	end
	return Array[best_buy, best_sell].to_s
end

#puts stock_picker([1,3,6,9,15,8,6,1,0])



def substrings(sentance, word_array)
	occurances = Hash.new(0)
	sentance_array = sentance.split(" ")
	count = 0
	sentance_array.each do |word|
		word = word.to_s
		word.downcase!
		word = word.gsub(/[^a-z]/, "")
		sentance_array[count] = word
		count += 1
	end
	# rejects empty characters
	sentance_array = sentance_array.reject { |char| char.empty? }
	sentance_array.each do |word|
		for start in 0..word.length-1
			for stop in 0..word.length-1
				current_word = word[start..stop]
				if (word_array.include? current_word)
					occurances[current_word] += 1
				end
			end
		end
	end
	puts occurances.to_s
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)