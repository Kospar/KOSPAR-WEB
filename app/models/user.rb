class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :qnas
  has_many :trends
  has_many :replies
  has_many :design_documents
  has_many :opensrcs
  has_many :doc_comments
  has_many :open_comments
  has_many :notices
  has_many :forum_boards
  
  validates_uniqueness_of :nickname
  validates :name,{
    :presence => true
  }
  validate :password_complexity
  def password_complexity
    if password.present?
       if !password.match(/^(?=.{8,20})(?=.*[a-z])(?=.*[0-9])/) 
         errors.add :password, " 입력 에러! 영문 + 숫자8 자 이상의 비밀번호를 입력해주세요."
       end
    end
  end
end
