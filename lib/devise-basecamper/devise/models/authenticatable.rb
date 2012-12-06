module Devise
  module Models
    module Authenticatable
      module ClassMethods
        def find_for_authentication(conditions={})
          conditions.delete(:subdomain)
          where(conditions).where(["account_id in (select account_id from accounts where subdomain = :value)", { :value => request.subdomains.first }]).first
        end
      end
    end
  end
end