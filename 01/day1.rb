measurements        = File.read('input.txt').split.map(&:to_i)
amount_of_increases = measurements.each.with_index.inject(0) do |sum, (measurement, i)|
  next sum if i == 0 # Skip the first measaurement because it has no previous measurement
  sum += 1 if measurement > measurements[i - 1]
  sum
end

puts amount_of_increases