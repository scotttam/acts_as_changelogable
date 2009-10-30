ActiveRecord::Schema.define(:version => 0) do
  create_table :changelogs, :force => true do |t|
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

  create_table :changelog_associations, :force => true do |t|
    t.integer :changelog_id
    t.integer :association_id
  end

  add_index :changelog_associations, :changelog_id
  add_index :changelog_associations, :association_id

  create_table :test_models, :force => true do |t|
    t.string :name
    t.timestamps
  end

  create_table :test_no_changelog_models, :force => true do |t|
    t.string :name
    t.timestamps
  end
end
