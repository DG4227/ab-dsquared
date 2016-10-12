module Adapter

  class Xapix

    include HTTParty

    BASE_URL = 'https://app.xapix.io/api/v1/airberlin_lab_2016'
    HEADERS = {'Accept' => 'application/json',
      'Authorization' => 'ab16_DSquared:mKCQoALD4JvY3WkTcaGOx670H2ge98nM'
      # "Content-Type" => 'application/json',
    }

    def initialize
      # @headers = HEADERS
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
      response.cc_id
    end

    def flight_segment
      data = {
        "departure":
      }
      self.class.get(BASE_URL + "/availabilities", query: {departure: "TXL", destination: "PMI", filters: "combinations"}, headers: HEADERS)
    end

    def create_booking(user)
      customer_id = get_customer_address_id(user)
      passengers = get_passengers_id(user)
      cc = get_credit_card_id(user.credit_card)
      fs = flight_segment
      data =
        {
          "passengers": passengers,
          "credit_card": cc,
          "customer_address": customer_id,
          "flight_segments": fs,
        }
        response = self.class.post(BASE_URL + "/bookings", query: {"data": data}, headers: HEADERS)
    end

    private

    def get_customer_address_id(user)
      name = user.first_name + " " + user.last_name
      zip = user.zipcode
      country_code = user.country_code
      language_code = user.language_code
      city = user.city
      address = user.address1
      email = user.email
      data = {
        "zip": zip,
        "name": name,
        "country_code": country_code,
        "city": city,
        "address1": address,
        "email": email,
        "language_code": language_code
      }
      response = self.class.post(BASE_URL + "/customer_addresses", query: {"data": data}, headers: HEADERS)
      response.c_id
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
      response.p_id
    end



  end
end
