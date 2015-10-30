class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.references :owner, polymorphic: true, index: true
      t.references :conversation, index: true, foreign_key: true
      t.boolean :is_read

      t.timestamps null: false
    end
  end
end
