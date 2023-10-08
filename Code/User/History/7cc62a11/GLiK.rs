use std::env;
use std::process;
use minigrep::*;

fn main () {
    let config = Config::build(env::args()).unwrap_or_else(|err|{
        eprintln!("Problem parsing arguments: {err}");
        process::exit(1)
        
    });

    println!("Searching for {}",config.query);
    println!("In file {}",config.file_path);
    if let Err(e) = run(config) {
        eprintln!("Problem reading file: {e}");
        process::exit(1);
    };
    
}
