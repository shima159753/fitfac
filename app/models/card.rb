class Card < ApplicationRecord
  attr_accessor :user_id  #:card_token,:number,:cvc,:exp_month,:exp_year

  belongs_to :user

  validates :card_token, :customer_token, :customercard_token, presence: true
end
