class Mission < ApplicationRecord
  paginates_per 25

  include AASM
  belongs_to :user
  has_many :mission_tag_logs
  has_many :tags, through: :mission_tag_logs
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true

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

  # 取代原本的，目前只針對create來做而已，若有update的情境，還要另外思考
  def tags_attributes=(tags_hash)
    tag_ids = self.tags.ids # 原本有的tag ids
    new_tags = []
    tags_hash.each do |_, tag_hash|
      next if tag_hash['name'].blank? # 去除沒有tag name的

      tag = user.tags.find_by(name: tag_hash['name'])
      if tag
        new_tags << tag unless tag.id.in?(tag_ids)
      else
        new_tags << user.tags.build(tag_hash)
      end
    end
    self.tags = new_tags
  end
end
