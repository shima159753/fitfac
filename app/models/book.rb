class Book < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one :book_order, dependent: :destroy

  validates :start_time, :end_time, :price, presence: true
  validate :end_time_check
  validate :start_check

  def end_time_check
    errors.add(:end_time, 'は開始時刻より遅い時間を選択してください') if start_time > end_time
  end

  def start_check
    errors.add(:start_time, 'は現在の日時より遅い時間を選択してください') if start_time < Time.now
  end

  def self.sort(selection)
    case selection
    when 'new'
      all.order(created_at: :DESC)
    when 'old'
      all.order(created_at: :ASC)
    end
  end
end
