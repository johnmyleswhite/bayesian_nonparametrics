load("dp-means.jl")

data = generate_data()

function print_results(results, lambda::Float64)
  f = open("output.tsv", "a")
  for i = 1:size(data, 1)
    println(f, join({data[i, 1], data[i, 2], results[:assignments][i], lambda}, "\t"))
  end
  close(f)
end

results = dp_means(data, 1.0)
print_results(results, 1.0)

results = dp_means(data, 10.0)
print_results(results, 10.0)

results = dp_means(data, 50.0)
print_results(results, 50.0)

results = dp_means(data, 100.0)
print_results(results, 100.0)

