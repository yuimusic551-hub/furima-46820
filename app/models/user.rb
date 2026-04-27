class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  # 空では登録できない（presence: true）の設定
  validates :nickname,        presence: true
  validates :birth_date,      presence: true

  # パスワードは、半角英数字混合での入力が必須（正規表現）
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  # お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須
  # 漢字・ひらがな・カタカナを網羅する正規表現に修正しました
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :last_name
    validates :first_name
  end

  # お名前カナ(全角)は、全角（カタカナ）での入力が必須
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
