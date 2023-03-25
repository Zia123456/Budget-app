class Group < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'

    has_many :entities, foreign_key: 'group_id', class_name: 'Entity'

    validates :name, presence: true
    validates :icon, presence: true

    def total_amount
        entities.sum(:amount)
    end
end
