class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
    @portfolios = Portfolio.all
  end

  def about
    @skills = Skill.all
  end

  def contact
  end
end
