def solve(str)
  arr = str.split('')
  ans = ''
  i = 0
  head = 'A'
  while i < str.length
    pos = find_head_pos(arr, i, head)
    pre_head = str[i,pos] || ''
    head = str[i+pos] || ''
    STDERR.puts "#{head}, #{ans}, #{pre_head}"
    ans = head + ans + pre_head
    i += pos+1
  end
  ans
end

def find_head_pos(arr, start, min)
  i = 0
  arr.drop(start).each do |c|
    if c >= min
      break
    end
    i += 1
  end
  i
end

begin
  # tests
  pos = find_head_pos('BACD'.split(''), 1, 'B')
  fail '#find_head_pos' if pos != 1
end

case_count = gets.chomp.to_i
case_count.times do |cc|
  buffer = gets.chomp
  STDERR.puts "#{cc+1}: #{Time.now}" if cc % 10 == 9
  ans = solve(buffer)

  puts "Case ##{cc+1}: #{ans}"
end
