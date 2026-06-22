3.times do
  print "Welcome "
end

puts 36/7
puts 36.0/7

puts ("sample".reverse)
puts ("sample".length)
puts ("sample"*5)

puts (36.to_s.reverse)

x = [12, 47, 35]
puts (x.max)
puts (x.sort)
puts x[0]
puts x[1]
puts x[2]

text = "O that we now had here
But one ten thousand of those men in England
That do no work to-day!"
text.gsub!("England", "France")
#puts text.gsub("England", "Italy")

#3.2


#hanoi tower
def hanoi(n, src, dst, aux)
  if n == 1
    puts "Move disk 1 from #{src} to #{dst}"
    return
  end
  hanoi(n - 1, src, aux, dst)
  puts "Move disk #{n} from #{src} to #{dst}"
  hanoi(n - 1, aux, dst, src)
end

#with move counting
def hanoi(n, src, dst, aux, count = 0)
  if n == 1
    puts "Move disk 1 from #{src} to #{dst}"
    return count + 1
  end
  count = hanoi(n - 1, src, aux, dst)
  puts "Move disk #{n} from #{src} to #{dst}"
  hanoi(n - 1, aux, dst, src, count + 1)
end

puts "Total moves: #{hanoi(3)}"
