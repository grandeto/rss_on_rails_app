# frozen_string_literal: true

# Fetches attributes from target object, names it by given map
# and returns result as hash.
module PropFetcher
  def self.fetch(target, map)
    map.reduce({}) do |acc, (from, to)|
      acc.merge({ to => target.send(from) })
    end
  end
end
