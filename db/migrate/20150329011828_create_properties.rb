class CreateProperties < ActiveRecord::Migration
  def up
    create_table :properties do |t|
      t.integer :test_suite_id, null: false
      t.string :name, null: false
      t.string :value, null: false
      t.timestamps null: false
    end

    add_foreign_key :properties, :test_suites
  end

  def down
    remove_foreign_key :properties, :test_suites
    drop_table :properties
  end
end
