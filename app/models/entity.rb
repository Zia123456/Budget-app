class Entity < ApplicationRecord
    belongs_to :user
    has_many :groups

    validates :authorId, presence: true
    validates :name, presence: true
    validates :amount, presence: true
    validates :createdAt, presence: true
end
