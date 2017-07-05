class CreateGroupEvents < ActiveRecord::Migration
  def change
    create_table :group_events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :start_at
      t.string :end_at
      t.boolean :is_published, :default => false
      t.boolean :is_draft, :default => false
      t.boolean :is_archived, :default => false

      t.timestamps
    end
  end
end
