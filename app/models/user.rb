class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :articles
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  attribute :permits
  # attribute :expires_at
  after_initialize :set_attributes

  def set_attributes
    self.permits = Can.can(self.role) unless self.role.blank?
    # self.expires_at = Time.now + 2.minutes
  end

  def can?(action,model)
    return false if self.role.nil? || self.permits.nil?
    action = action.to_s.downcase
    model = model.to_s.downcase
    permit = permits[model.to_sym]
    return false if permit.nil? 

    if ['create','new'].include?(action)
      return permit[0] == '1'
    elsif ['index','show','read'].include?(action)
      return permit[1] == '1'
    elsif ['edit','update'].include?(action)
      return permit[2] == '1'
    elsif ['delete','destroy'].include?(action)
      return permit[3] == '1'
    else
      return false
    end
  end

  def owner?(model)
    return model.has_attribute?(:user_id) && self.id == model.user_id
  end

  def is_manager?
    self.role == 'super' || self.role == 'manager'
  end

  def is_super?
    self.role == 'super'
  end

end


