require 'stringio'

class Permutator
	
	def perm(str)
		puts "Generating all permutations for: #{str}"

		@all_perm = Array.new
		find_perm(str,str.length-1)
		
		# sort if you want and print length
		p @all_perm.sort()
		p @all_perm.length
	end

	def find_perm(str, length)
		if length == 0
			@all_perm.push(str[length])
			return
		end

		if length >= 1
			find_perm(str, length-1)
			np = Array.new
			while(@all_perm.size() > 0) do
				perm = @all_perm.pop()
				append(perm, str[length], np)
			end
			@all_perm = np
		end
	end

	def append(perm, letter, q)
		for i in (0..perm.length)
			sp = gen(i, perm, letter)
			q.push(sp)
		end
	end

	def gen(skip, perm, letter)
		s = StringIO.new

		s << perm[0, skip]
		s << letter

		len = perm.length - skip
		s << perm[skip,len]

		return s.string
	end
end

s = ARGV[0]

p = Permutator.new
p.perm(s)