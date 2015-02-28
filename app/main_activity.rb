class MainActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    puts "****************"
    puts "onCreate invoked"
    puts "****************"
  	linear_layout = Android::Widget::LinearLayout.new(self)
  	linear_layout.orientation = Android::Widget::LinearLayout::VERTICAL
  	layout_params = Android::View::ViewGroup::LayoutParams.new(Android::View::ViewGroup::LayoutParams::MATCH_PARENT, Android::View::ViewGroup::LayoutParams::MATCH_PARENT)
  	linear_layout.layoutParams = layout_params

  	key_value_adapter = KeyValueAdapter.new(self)

  	add_button = Android::Widget::Button.new(self)
    add_button.text = "Add key-value pair"
  	add_button.onClickListener = AddButtonListener.new(key_value_adapter)
  	remove_button = Android::Widget::Button.new(self)
    remove_button.text = "Remove key-value pair"
  	remove_button.onClickListener = RemoveButtonListener.new(key_value_adapter)

    list_view = Android::Widget::ListView.new(self)
    list_view.adapter = key_value_adapter

    linear_layout.addView(add_button)
    linear_layout.addView(remove_button)
    linear_layout.addView(list_view)
    self.contentView = linear_layout
    puts "****************"
    puts "onCreate exited"
    puts "****************"
  end
end
