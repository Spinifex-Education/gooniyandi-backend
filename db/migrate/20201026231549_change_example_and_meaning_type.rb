class ChangeExampleAndMeaningType < ActiveRecord::Migration
  def change
    change_column :entries, :meaning, :string, limit: 10000
    change_column :entries, :example, :string, limit: 10000
    change_column :entries, :example_translation, :string, limit: 10000
  end
end
