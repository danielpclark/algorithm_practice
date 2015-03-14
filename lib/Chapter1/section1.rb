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

    def min(m,n,c=nil)
      unless c
        raise "Invalid input." unless (m>0 && n>0)
        m,n = [m,n].sort { n <=> m }
        c = n
      end
      if (m % c == 0) && (n % c == 0)
        return c
      else
        c = c - 1
        min(m,n,c)
      end
    end

    def sieve_of_Eratosthenes(n)
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
  end
end

