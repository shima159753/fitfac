class AddYoutubeIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :youtube_id, :string
  end
end
