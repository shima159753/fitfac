class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :prefecture

  validates :postal_code, :prefecture, :city, :address, :price, :bus_hours, :text, :item, :image, presence: true
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は無効です。ハイフン（-）を含めて下さい' }

  validates :name, presence: true, length: { maximum: 10 }

  belongs_to :user
  has_many :books, dependent: :destroy
  has_many :goods, dependent: :destroy

  has_one_attached :image
  has_many_attached :images

  # validates :prefecture_id,  numericality: { other_than: 0 }

  def self.search(search)
    if search != ''
      find_by_sql([<<-SQL, "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
      SELECT
        *
      FROM
        posts
      WHERE
        name LIKE ?
        OR postal_code LIKE ?
        OR prefecture LIKE ?
        OR city LIKE ?
        OR address LIKE ?
        OR price LIKE ?
        OR building_name LIKE ?
        OR bus_hours LIKE ?
        OR text LIKE ?
        OR item LIKE ?
        OR caution LIKE ?
      SQL
    else
      Post.all
    end
  end

  #def self.sort(selection)
    #case selection
    #when 'new'
    #  all.order(created_at: :DESC)
  # when 'old'
   #   all.order(created_at: :ASC)
   # when 'likes'
    #  find(Good.group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id))
   # end
 # end
end
