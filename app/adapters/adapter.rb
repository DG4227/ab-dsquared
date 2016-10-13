module Adapter

  class Xapix

    include HTTParty

    BASE_URL = 'https://app.xapix.io/api/v1/airberlin_lab_2016'
    HEADERS = {'Accept' => 'application/json',
      'Authorization' => 'ab16_DSquared:mKCQoALD4JvY3WkTcaGOx670H2ge98nM'
    }

    def initialize
    end

    def get_availabilities(departure, destination)
      response = self.class.get(BASE_URL + "/availabilities", query: {"filter": ["departure": "#{departure}", "destination": "#{destination}"]}, headers: HEADERS)
    end

    def create_booking(user)
      customer_id = get_customer_address_id(user)
      passengers = get_passengers_id(user)
      cc = get_credit_card_id(user.credit_card)
      fs = "36f7f46e-6935-4144-8050-8b7adb1a3614"
      data =
        {
          "passengers": passengers,
          "credit_card": cc,
          "customer_address": customer_id,
          "flight_segments": fs
        }
      byebug
      response = self.class.post(BASE_URL + "/bookings", body: {"data": data}, headers: HEADERS)
    end

    def get_coordinates(airport, address)
      address = address.gsub(" ", "+")
      url = "https://app.xapix.io/api/v1/ab16_DSquared/latlong?"

      locations = ["TXL", "Berlin+Marriot+Hotel"]
      latlongs = locations.map! do |location|
        response = self.class.get(url, query: {"filter[destination]": location}, headers: HEADERS)["latlong"].first["l_id"]
      end
      latlongs
    end

    def get_credit_card_id(ccard)
      number = ccard.number
      type = ccard.card_type
      holders_name = ccard.holders_name
      cvc = ccard.cvc
      expiry_date = ccard.expiry_date
      data = {
        "number": number,
        "type": type,
        "holders_name": holders_name,
        "cvc": cvc,
        "expiry_date": expiry_date
      }
      response = self.class.post(BASE_URL + "/credit_cards", query: {"data": data}, headers: HEADERS)
      response["cc_id"]
    end

    def get_customer_address_id(user)
      name = user.first_name + " " + user.last_name
      zip = user.zipcode
      country_code = user.country_code
      language_code = user.language_code
      city = user.city
      address = user.address
      email = user.email
      data = {
        "zip": zip,
        "name": name,
        "country_code": country_code,
        "city": city,
        "address": address,
        "email": email,
        "language_code": language_code
      }
      response = self.class.post(BASE_URL + "/customer_addresses", query: {"data": data}, headers: HEADERS)
      response["c_id"]
      secret_shortcut = "1781df40-e141-4d03-b21a-04c9265ac0d5"
      secret_shortcut
    end

    def get_passengers_id(user)
      first_name = user.first_name
      last_name = user.last_name
      date_of_birth = user.dob
      data = {
        "type": "ADT",
        "salutation": "Mr",
        "first_name": first_name,
        "last_name": last_name,
        "date_of_birth": date_of_birth
      }
      response = self.class.post(BASE_URL + "/passengers", query: {"data": data}, headers: HEADERS)
      response["p_id"]
    end

    def get_airport_lines

    end


    # query: {"filter": ["departure": "TXL"], "filter":["destination": "PMI"]}, headers: HEADERS)

    #https://app.xapix.io/api/v1/airberlin_lab_2016/availabilities?filter%5Bdeparture%5D=TXL&filter%5Bdestination%5D=PMI&fields%5Bavailabilities%5D=destination%2Cdeparture%2Crandom_id%2Cprevious_outbound_flight_date%2Cnext_outbound_flight_date&include=combinations&sort=random_id&page%5Bnumber%5D=1&page%5Bsize%5D=100

    #
    # {
    #   "data": {
    #     "passengers": "8f52b2e4-9b7b-4378-abf7-3ce1030b24c2",
    #     "credit_card": "74f94e7f-b106-407f-ae79-052d5954a067",
    #     "customer_address": "0974038d-ed41-463a-a6f5-339d21104fc0",
    #     "flight_segments": "a8aceabb-a469-450e-9ff3-4f6ee2efcacb"
    #   }
    


  end
end
