class User < ActiveRecord::Base
  include BCrypt

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :lists
  has_many :tasks, through: :lists

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(password)
    self.password == password
  end

  ##add method for "blank" password

end
