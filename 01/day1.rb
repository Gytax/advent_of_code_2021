def part1
  amount_of_increases_in(get_measurements_from_file)
end

def part2
  original_measurements = get_measurements_from_file
  measurements          = original_measurements.map.with_index do |measurement, i|
    [measurement, original_measurements[i + 1], original_measurements[i + 2]]
  end.reject do |arr|
    arr.compact.length < 3
  end.map(&:sum)

  amount_of_increases_in(measurements)
end

def amount_of_increases_in(measurements)
  increases = measurements.each.with_index.inject(0) do |sum, (measurement, i)|
    next sum if i == 0 # Skip the first measaurement because it has no previous measurement
    sum += 1 if measurement > measurements[i - 1]
    sum
  end

  return increases
end

def get_measurements_from_file
  measurements = File.read('input.txt').split.map(&:to_i)
end

puts "Amount of increases part1: #{part1}"
puts "Amount of increases part2: #{part2}"