extern crate array_tool;

mod chapter1 {
  mod section1 {
    #[allow(dead_code)]
    pub fn euclid(m: u64,n: u64) -> u64 {
      let mut m = m;
      let mut n = n;
      if !(m>0 && m>n) {
        panic!("Invalid Input");
      }

      while n != 0 {
        let r = m % n;
        m = n;
        n = r;
      }
      m
    }

    #[test]
    fn euclid_does_it() {
      assert_eq!(euclid(60, 24), 12);
    }

    #[allow(dead_code)]
    pub fn consecutive_integer_checking_gcd(m: u64, n: u64, c: Option<u64>) -> u64 {
      let mut m = m;
      let mut n = n;
      let d: u64 = match c {
        None => {
          if !(m>0 && n>0) {
            panic!("Invalid Input");
          }

          let mut a = vec![m,n];
          a.sort();
          m = a.pop().unwrap();
          n = a.pop().unwrap();
          n
        },
        Some(v) => v,
      };

      if (m % d == 0) && (n % d == 0) {
        return d;
      } else {
        let d = d - 1;
        consecutive_integer_checking_gcd(m,n,Some(d))
      }
    }

    #[test]
    fn consecutive_integer_checking_gcd_does_it() {
      assert_eq!(consecutive_integer_checking_gcd(60, 24, None), 12);
    }

    #[allow(non_snake_case,dead_code)]
    pub fn sieve_of_Eratosthenes(n: u64) -> Vec<u64> {
      let mut a: Vec<u64> = vec![1; n as usize + 1];
            
      (2..n).for_each(|p| a[p as usize] = p);

      (2..(n as f64).sqrt().floor() as u64).for_each(|p|
        if a[p as usize] != 0 {
          let mut j = p * p;
          while j <= n {
            a[j as usize] = 0;
            j = j + p;
          }
        }
      );

      let mut l: Vec<u64> = vec![1; n as usize + 1];
      let mut i = 0;
      
      (2..n).for_each(|p|
        if a[p as usize] != 0 {
          l[i as usize] = a[p as usize];
          i = i + 1;
        }
      );
      return l.into_iter().filter(|i| i != &1_u64).collect();
    }

    #[test]
    #[allow(non_snake_case)]
    fn sieve_of_Eratosthenes_does_it() {
      assert_eq!(
        sieve_of_Eratosthenes(100),
        vec![2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]
      );
    }
  }
}

