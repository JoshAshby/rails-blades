module ShavingHelper
  def updated_at mod
    mod.updated_at.to_s :short_12
  end
end
