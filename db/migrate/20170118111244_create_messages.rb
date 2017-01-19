class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :user, null: false
      t.references :group, null: false
      t.timestamps
    end
  end
end