use std::env;
use std::process;
use minigrep::*;

fn main () {
    let args: Vec<String> = env::args().collect();
    let config = Config::new(&args).unwrap_or_else(|err|{
        println!("Problem parsing arguments: {err}");
        process::exit(1)
        
    });

    println!("Searching for {}",config.query);
    println!("In file {}",config.file_path);
    if let Err(e) = run(config) {
        println!("Problem reading file: {e}");
        process::exit(1);
    };
    
}
