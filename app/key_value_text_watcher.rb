class KeyValueTextWatcher < Android::Text::TextWatcher

	def initialize(element)
		@element = element
	end
	
	def beforeTextChanged(s, start, count, after)
	end

	def afterTextChanged(s)
	end

	def onTextChanged(s, start, before, count)
		puts "****************"
    puts "onTextChanged invoked"
    puts "****************"
		@element = s.toString
	end

end