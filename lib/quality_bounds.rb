module QualityBounds
  def enforce_quality_bounds
    @quality > 50 ? @quality = 50 : @quality
  end
end
