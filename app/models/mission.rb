class Mission < ApplicationRecord
  belongs_to :user

  enum priority: [ :urgent, :common, :low ]
  enum category: [ :company, :home ]
end
