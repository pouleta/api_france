#encoding: utf-8

module ApiFrance

  def self.api env
    route = Parser.url env['REQUEST_URI'].to_s
    if route[:table]
      DB.connect!
      r = route[:table].where(route[:params]).limit DB::RESULTS_LIMIT
      return [200, {}, [r.to_json]]
    else
      return [404, {}, ['404 Not found']]
    end
  end

end
