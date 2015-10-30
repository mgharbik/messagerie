class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :sender, polymorphic: true, index: true
      t.references :receiver, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
