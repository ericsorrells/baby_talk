class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def letsencrypt
    render text: "rddKfRpWDF4GiE80D488PaAxIpP_n1DKmmQGTnuYsds.NgQk8Q5od9gEZhsQP3Whs-FgUjAlulxVoxEGytLb1q4"
  end
end
