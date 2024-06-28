use std::collections::BTreeSet;

struct Solution;

impl Solution {
    pub fn is_valid_sudoku(board: Vec<Vec<char>>) -> bool {
        if Self::check(&board) {
            if Self::check(&Self::transpose(&board)) {
                Self::check(&Self::group(&board))
            } else {
                false
            }
        } else {
            false
        }
    }

    //For sub-box
    fn group(board: &[Vec<char>]) -> Vec<Vec<char>> {
        let mut grouped = vec![vec![' '; 9]; 9];

        board.iter().enumerate().for_each(|(i, row)| {
            row.iter()
                .enumerate()
                .for_each(|(j, &x)| grouped[(i / 3) * 3 + j / 3][i % 3 * 3 + j % 3] = x)
        });

        grouped
    }

    // For columns
    fn transpose(board: &[Vec<char>]) -> Vec<Vec<char>> {
        let mut transposed = vec![vec![' '; 9]; 9];

        board.iter().enumerate().for_each(|(i, row)| {
            row.iter()
                .enumerate()
                .for_each(|(j, &x)| transposed[j][i] = x)
        });

        transposed
    }

    fn check(board: &[Vec<char>]) -> bool {
        board
            .iter()
            .all(|x| Self::no_repetition(&Self::char_vec_to_u8(x)))
    }

    fn char_vec_to_u8(input: &[char]) -> Vec<u8> {
        input
            .iter()
            .filter(|x| **x != '.')
            .map(|x| *x as u8 - 48)
            .collect()
    }

    fn no_repetition(block: &[u8]) -> bool {
        let mut set = BTreeSet::new();
        block.iter().all(|&x| set.insert(x))
    }
}

fn main() {
    let input = vec![
        vec!['5', '3', '.', '.', '7', '.', '.', '.', '.'],
        vec!['6', '.', '.', '1', '9', '5', '.', '.', '.'],
        vec!['.', '9', '8', '.', '.', '.', '.', '6', '.'],
        vec!['8', '.', '.', '.', '6', '.', '.', '.', '3'],
        vec!['4', '.', '.', '8', '.', '3', '.', '.', '1'],
        vec!['7', '.', '.', '.', '2', '.', '.', '.', '6'],
        vec!['.', '6', '.', '.', '.', '.', '2', '8', '.'],
        vec!['.', '.', '.', '4', '1', '9', '.', '.', '5'],
        vec!['.', '.', '.', '.', '8', '.', '.', '7', '9'],
    ];

    let solution = Solution::is_valid_sudoku(input);
    println!("{}", solution);
}
