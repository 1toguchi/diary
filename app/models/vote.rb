class Vote < ActiveRecord::Base
  belongs_to :kiji
  belongs_to :member
  


  validate do
    unless member && member.votable_for?(kiji)
      errors.add(:base, :invalid)
    end
  end
end
