module Chapter1
  def euclid(m,n)
    raise "Invalid input." unless (m>0 && n>0 && m>n)
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
end

