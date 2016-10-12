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
    end

    def flight_segment
      self.class.get(BASE_URL + "/availabilities", query: {"filter": ["departure": "TXL", "destination": "PMI"]}, headers: HEADERS)
    end

    # query: {"filter": ["departure": "TXL"], "filter":["destination": "PMI"]}, headers: HEADERS)

    #https://app.xapix.io/api/v1/airberlin_lab_2016/availabilities?filter%5Bdeparture%5D=TXL&filter%5Bdestination%5D=PMI&fields%5Bavailabilities%5D=destination%2Cdeparture%2Crandom_id%2Cprevious_outbound_flight_date%2Cnext_outbound_flight_date&include=combinations&sort=random_id&page%5Bnumber%5D=1&page%5Bsize%5D=100

    

  end
end
