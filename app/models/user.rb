class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis

  after_initialize :default_role_user

  def admin?
   role == 'admin'
  end
 
  def standard?
   role == 'standard'
  end

  def premium?
    role == 'premium'
  end

  private

  def default_role_user
    self.role ||= 'standard'
  end

  def upgrade_account
    self.role = 'premium'
  end


end
