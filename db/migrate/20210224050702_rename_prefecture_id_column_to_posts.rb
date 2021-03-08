class RenamePrefectureIdColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :prefecture_id, :prefecture
  end
end
