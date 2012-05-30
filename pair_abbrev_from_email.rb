email = ARGV[0]

user = email.split('@')[0]

users = user.split('+')

if users[0] == 'pair'
  users.shift
end

abbrevs = []
File.open('.pairs', 'r') do |pairs_file|
  pairs_file.each do |line|
    users.each do |name|
      if m = line.match(/^\s*(\w+):\s.*;\s#{name}$/)
        abbrevs.push(m[1])
      end
    end
  end
end

puts abbrevs.sort.uniq.join('+')
