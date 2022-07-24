# This module should not be updated

module ExternalCall
  class << self
    def run_complex_sql_query(params = {})
      sleep(20)

      params
    end
  end
end
