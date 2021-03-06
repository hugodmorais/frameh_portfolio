class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin], multiple: false)                                      ##
  ############################################################################################ 
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Includes
  
  # Attributes
  
  # Associations
  has_many :comments, dependent: :destroy

  # Delegates
  
  # Constants
  
  # Scopes
  
  # Callbacks
  
  # Validations
  validates :name, presence: true

  # Constants Methods
  
  # Class methods
  
  # Instance Public methods

  def first_name
    BCrypt::Password.create(self.name.split.first)
  end

  def last_name
    last_name = self.name.split.last
    last_name = last_name if self.name.split.count > 1
  end
  
  private
  
  # Callbacks
  
  # Validations
  
  # Instance Private methods
  
end
