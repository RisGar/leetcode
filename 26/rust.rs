use std::collections::BTreeSet;

struct Solution;

impl Solution {
  pub fn remove_duplicates(nums: &mut Vec<i32>) -> i32 {
    // let mut map: BTreeSet<i32> = BTreeSet::new();

    *nums = nums
      .into_iter()
      .map(|x| *x)
      .collect::<BTreeSet<i32>>()
      .into_iter()
      .collect();

    nums.len() as i32
  }
}

fn main() {
  // let mut nums = vec![1, 1, 2];
  let mut nums = vec![0, 0, 1, 1, 1, 2, 2, 3, 3, 4];

  let solution = Solution::remove_duplicates(&mut nums);
  println!("{}", solution);
  println!("{:?}", nums);
}
