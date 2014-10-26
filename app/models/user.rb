class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :presence => true, :uniqueness => true

  has_many :assets

  belongs_to :user

  #set up "uploaded_file" field as attached_file (using Paperclip)
  has_attached_file :uploaded_file
  validates_attachment_size :uploaded_file, :less_than => 100.megabytes
  validates_attachment_presence :uploaded_file

  private
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation, :remember_me, :user_id, :uploaded_file )
    end
end
