use std::error::Error;
use std::fs;

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