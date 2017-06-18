class GetCouponService
  def initialize(coupon_name)
    @coupon = Coupon.where(name: coupon_name).first
  end

  def response
    @coupon ? success_response : not_found_response
  end

  private

  def success_response
    { success: true, percent: @coupon.percent, id: @coupon.id }
  end

  def not_found_response
    { success: false }
  end
end
