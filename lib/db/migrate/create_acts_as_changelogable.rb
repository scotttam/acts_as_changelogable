ActiveRecord::Schema.define(:version => 0) do
  create_table :changelogs, :force => false do |t|
    t.integer :record_id
    t.string :record_type
    t.integer :user_id
    t.string :operation
    t.text :diff
    t.string :description
    t.timestamps
  end

  add_index :changelogs, :record_id
  add_index :changelogs, :user_id
end
