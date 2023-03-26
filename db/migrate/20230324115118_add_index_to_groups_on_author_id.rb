class AddIndexToGroupsOnAuthorId < ActiveRecord::Migration[7.0]
  def change
    add_index :groups, :author_id, name: "index_groups_on_author_id"
  end
end
