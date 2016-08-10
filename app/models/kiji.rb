class Kiji < ActiveRecord::Base
  belongs_to :author, class_name: "Member", foreign_key: "member_id"
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :member

  STATUS_VALUES = %w(draft member_only public)
  validates :title, presence: true
  validates :body, presence: true
  


  scope :common, -> { where(status: "public") }
  scope :published, -> { where("status <> ?", "draft") }
  scope :full, ->(member) {
    where("member_id = ? OR status <> ?", member.id, "draft") }
  scope :readable_for, ->(member) { member ? full(member) : common }


  class << self

     def status_text(status)
      I18n.t("activerecord.attributes.kiji.status_#{status}")
     end


    def status_options
      STATUS_VALUES.map { |status| [status_text(status), status] }
    end
  end

end
