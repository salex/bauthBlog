class Can

  CRUD = {
    super:{
      group:'1111',
      user:'1111',
      player:'1111',
      game:'1111',
      round:'1111',
      article:'1111',
      comment:'1111'
    },
    manager:{
      group:'0110',
      user:'1111',
      player:'1111',
      game:'1111',
      round:'1111',
      article:'1111',
      comment:'1111'
    },
    admin:{
      group:'0110',
      user:'1111',
      player:'1111',
      game:'1111',
      round:'1111',
      article:'1111',
      comment:'1111'
    },
    trustee:{
      group:'0100',
      user:'0110',
      player:'0110',
      game:'0110',
      round:'0110',
      article:'1111',
      comment:'1111'
    },
    guest:{
      group:'0100',
      user:'0000',
      player:'0100',
      game:'0100',
      round:'0100',
      article:'0100',
      comment:'0100'
    }
  }

  def self.can(role)
    # called from User model - returns user roles 
    cans = CRUD[role.downcase.to_sym]
  end

  # below is just testing methods 
  def self.crud
    return CRUD
  end

  def self.roles
      return CRUD.keys.map{|o| o = o.to_s}
    end

  def self.models
    return CRUD[:super].keys.map{|o| o = o.to_s}
  end

  # def self.to_yaml
  #   return CRUD.to_yaml
  # end
end