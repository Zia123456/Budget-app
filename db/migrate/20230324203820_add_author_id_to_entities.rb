class AddAuthorIdToEntities < ActiveRecord::Migration[7.0]
  def change
    add_column :entities, :author_id, :integer
  end
end
