class CreateJunitOutputs < ActiveRecord::Migration
  def up
    create_table :junit_outputs do |t|
      t.string :output, null: false
      t.timestamps null: false
    end
    add_column :test_suites, :junit_output_id, :integer
    add_foreign_key :test_suites, :junit_outputs
    add_index :test_cases, :name
    add_index :test_cases, :classname
    add_index :messages, :type
    add_index :messages, :message
    add_index :test_cases, :status
  end

  def down
    remove_index :test_cases, :name
    remove_index :test_cases, :classname
    remove_index :messages, :type
    remove_index :messages, :message
    remove_index :test_cases, :status
    remove_foreign_key :test_suites, :junit_outputs
    remove_column :test_suites, :junit_output_id
    drop_table :junit_outputs
  end
end
