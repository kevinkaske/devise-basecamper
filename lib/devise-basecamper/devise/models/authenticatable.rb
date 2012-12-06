module Devise
  module Models
    module Authenticatable
      module ClassMethods
        def find_for_authentication(conditions={})
          first_subdomain = conditions.delete(:subdomain).split(".").first
          where(conditions).where(["account_id in (select account_id from accounts where subdomain = :value)", { :value => first_subdomain }]).first
        end
      end
    end
  end
end