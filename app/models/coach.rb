class Coach < ApplicationRecord
  STATUSES = ["pending", "approved", "needs_changes"]
  belongs_to :team
  belongs_to :person
  validates :status, inclusion: { in: STATUSES }
end
