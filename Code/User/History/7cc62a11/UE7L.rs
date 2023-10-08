use std::{env, fs}; 

fn main () {
    let args: Vec<String> = env::args().collect();
    let query = &args[1];
    let file_path = &args[2];
    
    let file_contents = fs::read_to_string(file_path).expect("This should be possible to read");

    println("{}",file_contents); 

    
}