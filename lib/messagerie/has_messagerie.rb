module Messagerie
  module HasMessagerie
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def has_messagerie
        include Messagerie::HasMessagerie::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def conversations
        Conversation.where("(sender_id = :this_id AND sender_type = :this_type) OR
            (receiver_id = :this_id AND receiver_type = :this_type)", this_id: id, this_type: self.class.name)
      end
    end
  end
end

ActiveRecord::Base.send(:include, Messagerie::HasMessagerie)