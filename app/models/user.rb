class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shaving_reviews, class_name: 'Shaving::Review', dependent: :destroy
  has_many :shaving_products, class_name: 'Shaving::Product', dependent: :destroy
  has_many :shaving_brands, class_name: 'Shaving::Brand', dependent: :destroy

  validates :username, :uniqueness => { :case_sensitive => false }

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup

    if login = conditions.delete(:login)
      where(conditions). \
      where(
        arel_table[:username].lower.eq(login.downcase).or(arel_table[:email].lower.eq(login.downcase))
      ).first
    else
      where(conditions).first
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
end
