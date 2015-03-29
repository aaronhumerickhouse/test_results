class CreateTestSuites < ActiveRecord::Migration
  def up
    create_table :test_suites do |t|
      t.string :name, null: false
      t.datetime :timestamp, null: false
      t.string :hostname, null: false
      t.integer :time, null: false
      t.timestamps null: false
    end

    add_index :test_suites, :name
  end

  def down
    remove_index :test_suites, :name
    drop_table :test_suites
  end
end
