class CreateTestCases < ActiveRecord::Migration
  def up
    create_table :test_cases do |t|
      t.integer :test_suite_id, null: false
      t.string :name, null: false
      t.string :classname, null: false
      t.integer :time, null: false
      t.string :status, null: false
      t.integer :message_id
      t.timestamps null: false
    end

    add_foreign_key :test_cases, :test_suites
    add_foreign_key :test_cases, :messages
  end

  def down
    remove_foreign_key :test_cases, :test_suites
    remove_foreign_key :test_cases, :messages
    drop_table :test_cases
  end
end
