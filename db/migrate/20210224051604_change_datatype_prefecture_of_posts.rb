class ChangeDatatypePrefectureOfPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :prefecture, :string
  end
end
