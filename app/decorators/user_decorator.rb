# frozen_string_literal: true

module UserDecorator
  def display_name
    # if profile && profile.nickname
    #   profile.nickname
    # else
    #   self.email.split('@').first
    # end

    # ぼっち演算子（&.）　profile が nill でない時に nickname を使用する。
    profile&.nickname || self.email.split('@').first
  end
end
