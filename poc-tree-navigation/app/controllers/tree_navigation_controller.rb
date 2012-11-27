class TreeNavigationController < ApplicationController

  def home
    generate_smartgroups
  end

  def bullets
    generate_smartgroups
  end

  def menu
    generate_smartgroups
  end

  def tree
    generate_smartgroups
  end

  def generate_smartgroups
    @smartgroups = 5.times.collect {|n| "Smart group #{n}"}
  end

end
