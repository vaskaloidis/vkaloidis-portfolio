class SetStickyFalseDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :projects, :sticky, false
  end
end
