class Blog::AboutController < ApplicationController
  
  layout "blog"
  allow_unauthenticated_access

  def index
    puts " IT FOUND INDEX"
  end

  def background
  end

  def family
  end

  def golf
  end

  def geekdome
  end

end

