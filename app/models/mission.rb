class Mission < ApplicationRecord
  include AASM
  belongs_to :user

  enum priority: [ :urgent, :common, :low ]
  enum category: [ :company, :home ]

  validates :title, presence: true
  validates :priority, presence: true
  validates :category, presence: true
  validates :start_time, presence: true

  aasm column: 'status' do
    state :pending, initial: true
    state :handling, :complete

    event :handle do
      transitions from: :pending, to: :handling
    end

    event :finish do
      transitions from: :handling, to: :complete
    end
  end
end
