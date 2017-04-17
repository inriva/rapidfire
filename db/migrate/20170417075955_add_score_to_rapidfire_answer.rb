class AddScoreToRapidfireAnswer < ActiveRecord::Migration
  def change
    add_column :rapidfire_answers, :score, :integer
    add_column :rapidfire_answers, :passed, :boolean
  end
end
