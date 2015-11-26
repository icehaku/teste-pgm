class User < ActiveRecord::Base
	has_many :post

	validates_presence_of :nome, message: "nao pode ser vazio."
	validates_uniqueness_of :nome	

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
end
