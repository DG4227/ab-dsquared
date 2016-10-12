
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :credit_card
  has_many :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # attr_accessor :email, :first_name, :last_name, :address, :zipcode, :country_code, :language_code, :dob, :persontype
  #
  # def initialize
  #   self.email = "a"
  #   self.first_name = "b"
  #   self.address = "26 franklin street"
  #   self.zipcode = 10968
  #   self.country_code = "49"
  #   self.language_code = "DE"
  #   self.dob = "19910101"
  #   self.persontype = "ADT"
  #   self.save
  # end

end


# self.email = options[:email]
# self.first_name = options[:first_name]
# self.last_name = options[:last_name]
# self.address = options[:address]
# self.zipcode = options[:zipcode]
# self.country_code = options[:country_code]
# self.language_code = options[:language_code]
# self.dob = options[:dob]
# self.persontype = options[:persontype]
# self.save
#
#
# luke = User.new({
#   email: "daniel@xapix.io",
#   first_name: "dan",
#   last_name: "gorman",
#   address: "26 Franklin Street",
#   city: "Berlin",
#   zipcode: 10968,
#   country_code: "49",
#   language_code: "DE",
#   dob: "19910201",
#   persontype: "ADT"})
