class KeyValueAdapter < Android::Widget::BaseAdapter

	def initialize(context)
		@context = context
		@data = []
	end

	def getCount()
		@data.length
	end

	def getItem(position)
		@data[position]
	end

	def getItemId(position)
		0
	end

	def getView(position, convertView, parent)
		linear_layout = Android::Widget::LinearLayout.new(@context)
		linear_layout.orientation = Android::Widget::LinearLayout::HORIZONTAL

		key = Android::Widget::EditText.new(@context)
		key.layoutParams = Android::Widget::TableLayout::LayoutParams.new(Android::View::ViewGroup::LayoutParams::MATCH_PARENT, Android::View::ViewGroup::LayoutParams::WRAP_CONTENT, 1.0)
		key.text = @data[position][0]
		key.addTextChangedListener(KeyValueTextWatcher.new(@data[position][0]))

		value = Android::Widget::EditText.new(@context)
		value.layoutParams = Android::Widget::TableLayout::LayoutParams.new(Android::View::ViewGroup::LayoutParams::MATCH_PARENT, Android::View::ViewGroup::LayoutParams::WRAP_CONTENT, 1.0)
		value.text = @data[position][1]
		value.addTextChangedListener(KeyValueTextWatcher.new(@data[position][1]))

		linear_layout.addView(key)
		linear_layout.addView(value)
		return linear_layout
	end

	def addRow()
		@data << ["",""]
		notifyDataSetChanged()
	end

	def removeRow()
		@data.pop
		notifyDataSetChanged()
	end

end