class AddButtonListener

	def initialize(adapter)
		@adapter = adapter
	end

	def onClick(view)
		@adapter.addRow()
	end

end