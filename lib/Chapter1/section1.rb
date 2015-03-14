module Chapter1
  module Section1
    def euclid(m,n)
      raise "Invalid input." unless (m>0 && n>=0 && m>n)
      while n != 0 do
        r = m % n
        m = n
        n = r
      end
      return m
    end

    def consecutive_integer_checking_gcd(m,n,c=nil)
      unless c
        raise "Invalid input." unless (m>0 && n>0)
        m,n = [m,n].sort { n <=> m }
        c = n
      end
      if (m % c == 0) && (n % c == 0)
        return c
      else
        c = c - 1
        consecutive_integer_checking_gcd(m,n,c)
      end
    end

    def sieve_of_Eratosthenes(n)
        arr = arr.group_by {|i| i}
      a = []
            
      (2..n) .each do |p|
        a[p] = p
      end

      (2..Math.sqrt(n).floor).each do |p|
        if a[p] != 0
          j = p * p
          while j <= n do
            a[j] = 0
            j = j + p
          end
        end 
      end

      l = []
      i = 0
      
      (2..n).each do |p|
        if a[p] != 0
          l[i] = a[p]
          i = i + 1
        end
      end
      return l
    end

    def middle_school_gcd(m,n)
      multiples = lambda { |v|
        arr = []
        primes = [sieve_of_Eratosthenes(m), sieve_of_Eratosthenes(n)].min
        while v != 1
          if (v % primes.first).eql?(0)
            arr << primes.first
            v = v / primes.first
          else
            primes.shift
          end
        end
        arr
      }
      ma = multiples.(m).group_by {|i| i}
      na = multiples.(n).group_by {|i| i}
      
      ma.map {|k,v|
        na.include?(k) ? [v,na[k]].min : nil
      }.flatten.compact.inject(:*)
    end

  end
end

