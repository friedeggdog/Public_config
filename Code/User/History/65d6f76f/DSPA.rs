use std::error::Error;
use std::{fs, vec};

pub fn run (config:Config)-> Result<(),Box<dyn Error>> {
    let contents = fs::read_to_string(config.file_path)?;
    Ok(())
}

pub struct Config {
    pub query: String,
    pub file_path: String,
}

impl Config{
    pub fn new(args: &[String])->Result<Config, &'static str>{
        if args.len() < 3 {
            return Err("Not enough arguments")
        }
        let query = args[1].clone();
        let file_path = args[2].clone();
        
        Ok(Config{query:query,file_path:file_path})

    }
}

fn search<'a> (query:&str,contents:&'a str)->Vec<&'a str> {
    let mut results: Vec<&str> = vec![];
    for line in contents.lines() {
        if line.contains(query){
            results.push(line);
        }
    }
    results
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn one_result() {
        let query = "duct";
        let contents = "\
Rust:
safe, fast, productive.
Pick three.";

        assert_eq!(vec!["safe, fast, productive."], search(query, contents));
    }
}




