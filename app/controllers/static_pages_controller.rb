class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def letsencrypt
    render text: "3b-voX5FI0bAfzQi33ShwsnyN_DPNcZ3DcsAiR-z5Lc.NgQk8Q5od9gEZhsQP3Whs-FgUjAlulxVoxEGytLb1q4"
  end
end
