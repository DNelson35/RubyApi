class Company < ActiveRecord::Base
    has_many :drinks, dependent: :destroy
end