class Public::HomesController < ApplicationController
  def top
  end

  def about
  end

# <ゲストログイン>
  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guest"
  end
    sign_in user
    redirect_to public_post_images_path, notice: 'ゲストユーザーとしてログインしました'
  end
  # </ゲストログイン>
end
