class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :tasks, dependent: :destroy
  validates :username, :name, :lastname, :email, :presence => true
  
  has_attached_file :profile, :styles => { :thumb => "100x100>", :mini => "40x40" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :profile, :content_type => /\Aimage\/.*\Z/

  def fullname
  	name + ' ' + lastname
  end
end
