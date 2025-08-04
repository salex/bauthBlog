class Current < ActiveSupport::CurrentAttributes
  attribute :session
  # attribute :blog
  delegate :user, to: :session, allow_nil: true
end
