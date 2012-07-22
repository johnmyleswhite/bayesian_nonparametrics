load("dp-means.jl")

srand(1)

data = generate_data()

run(`rm output.tsv`)

function print_results(results, lambda::Float64)
  f = open("output.tsv", "a")
  for i = 1:size(data, 1)
    println(f, join({data[i, 1], data[i, 2], results[:assignments][i], lambda}, "\t"))
  end
  close(f)
end

for lambda in [0.0, 1.0, 10.0, 50.0, 100.0, 125.0, 200.0]
  results = dp_means(data, lambda)
  print_results(results, lambda)
end
