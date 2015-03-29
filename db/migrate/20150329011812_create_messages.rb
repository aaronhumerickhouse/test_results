class CreateMessages < ActiveRecord::Migration
  def up
    create_table :messages do |t|
      t.string :type, null: false
      t.string :message, null: true
      t.timestamps null: false
    end
  end

  def down
    drop_table :messages
  end
end
