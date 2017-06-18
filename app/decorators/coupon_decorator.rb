class CouponDecorator < Draper::Decorator
  delegate_all

  def value
    "-#{object.percent}%"
  end
end
