use std::env;
use std::fs;
use std::process;
use std::error::Error;

fn main () {
    let args: Vec<String> = env::args().collect();
    let config = Config::new(&args).unwrap_or_else(|err|{
        println!("Problem parsing arguments: {err}");
        process::exit(1)
        
    });

    println!("Searching for {}",config.query);
    println!("In file {}",config.file_path);
    
}

fn run (config:Config)-> Result<(),Box<dyn Error>> {
    let contents = fs::read_to_string(config.file_path)?;
    println!("With text:\n{contents}");  
    Ok(())
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