# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :players
  belongs_to :team_manager, class_name: "User", foreign_key: "manager_id"
  has_many :coaches
end
