module Messagerie
  class Conversation < ActiveRecord::Base
    belongs_to :sender, polymorphic: true
    belongs_to :receiver, polymorphic: true
    has_many :messages, dependent: :destroy

    validates :sender, presence: true
    validates :sender, uniqueness: true, scope: :reveiver
    validates :receiver, presence: true
    validates :receiver, uniqueness: true, scope: :sender

  end
end