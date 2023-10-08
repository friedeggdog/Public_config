use std::env;
use std::fs;

fn main () {
    let args: Vec<String> = env::args().collect();
    let config = Config::new(&args).unwrap_or_else(|err|{
        rintln!("Problem parsing arguments: {err}");
        process::exit(1)println!("Error creating config object");
        
    });
    
    let contents = fs::read_to_string(config.file_path).expect("Should have been able to read the file");
    println!("With text:\n{contents}"); 

    
}

struct Config {
    query: String,
    file_path: String,
}

impl Config{
    fn new(args: &[String])->Result<Config, &'static str>{
        if args.len() < 3 {
            return Err("Not enough arguments")
        }
        let query = args[1].clone();
        let file_path = args[2].clone();
        
        Ok(Config{query:query,file_path:file_path})

    }
}