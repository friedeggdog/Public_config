use std::env;
use std::fs;

fn main () {
    let args: Vec<String> = env::args().collect();
    let (query , filepath) = parse_cmd(args);
    
    let contents = fs::read_to_string(file_path).expect("Should have been able to read the file");
    println!("With text:\n{contents}"); 

    
}

fn parse_cmd(args: Vec<String>)->(String, String){
    let query = &args[1];
    let file_path = &args[2];
    
    (query,file_path)

}