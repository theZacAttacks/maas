require 'cuba'
require 'json'

ApiError = { error: 'merp' }

Cuba.define do
  on get do
    on 'api/v1/merp' do
      puts 'gotem'
      res.headers['Content-Type'] = 'application/json; charset=utf-8'
      res.write "merp".to_json
    end
  end

  on post do
    on 'api/v1/merp' do
      on param('amount') do |amt|
        merps = []
        amt.to_i.times { merps << 'merp' }
        
        res.headers['Content-Type'] = 'application/json; charset=utf-8'
        res.write merps.to_json
      end

      on true do
        res.headers['Content-Type'] = 'application/json; charset=utf-8'
        res.write ApiError.to_json
      end
    end
  end
end
