module Messagerie
  class Message < ActiveRecord::Base
    belongs_to :owner, polymorphic: true
    belongs_to :conversation

    validates :body, presence: true
    validates :owner, presence: true
    validates :conversation, presence: true
    validates :is_read, inclusion: {in: [true, false]}

    after_save :change_conversation_updated_at


    private

    def change_conversation_updated_at
      self.conversation.update(updated_at: Time.now)
    end
  end
end