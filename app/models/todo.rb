class Todo < ApplicationRecord
    validates :to_dos , presence: true
    validates :comments , presence: true

    def self.search(search)
        where( 'to_dos ILIKE ?', "%#{search}%")
        # where( 'comments ILIKE ?', "%#{search}%")
    end

   



end

