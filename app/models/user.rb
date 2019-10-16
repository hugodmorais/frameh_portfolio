class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Includes
  
  # Attributes
  
  # Associations
  
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
