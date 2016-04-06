class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_and_belongs_to_many :subcategories
  has_many :bookmarks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :zxcvbnable

  def send_devise_notification(notification, *args)
  	devise_mailer.send(notification, self, *args).deliver_later
  end
end
