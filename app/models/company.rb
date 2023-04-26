class Company < ActiveRecord::Base
    has_many :drinks, dependent: :destroy

    def drink_count
        self.drinks.count
    end
end