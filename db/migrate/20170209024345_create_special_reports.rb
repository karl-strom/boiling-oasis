class CreateSpecialReports < ActiveRecord::Migration
  def change
    create_table :special_reports do |t|
      t.string :title
      t.string :final_diagnosis
      t.string :gross_description
      t.string :blockcode
      t.text :microscopic_description
      t.string :assign
      t.string :lock
      t.references :description, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
