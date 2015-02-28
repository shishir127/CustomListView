class RemoveButtonListener

	def initialize(adapter)
		@adapter = adapter
	end

	def onClick(view)
		@adapter.removeRow()	
	end

end