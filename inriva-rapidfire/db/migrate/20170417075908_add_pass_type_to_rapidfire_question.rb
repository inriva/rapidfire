class AddPassTypeToRapidfireQuestion < ActiveRecord::Migration
  def change
    add_column :rapidfire_questions, :pass_type, :string
  end
end
