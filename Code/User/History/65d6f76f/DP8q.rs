use std::error::Error;
use std::{fs, vec, env};

pub fn run (config:Config)-> Result<(),Box<dyn Error>> {
    let contents = fs::read_to_string(config.file_path)?;
    if config.ignore_case {
        for line in case_insensitve(&config.query, &contents){
            println!("{line}");
        }
    } else {
        for line in search(&config.query, &contents) {
            println!("{line}");
        }
    }
    Ok(())
}

pub struct Config {
    pub query: String,
    pub file_path: String,
    pub ignore_case: bool,
}

impl Config{
    pub fn build(mut args: impl Iterator<Item = String>)->Result<Config, &'static str>{
        args.next();

        let query = match args.next() {
            Some(string) => string,
            None => return Err("Error creating query string")
        };

        let file_path = match args.next() {
            Some(string) => string,
            None => return Err("Error creating file path string")
        };

        let ignore_case = env::var("IGNORE_CASE").is_ok();
        
        Ok(Config{query:query,file_path:file_path,ignore_case:ignore_case})

    }
}

fn search<'a> (query:&str,contents:&'a str)->Vec<&'a str> {
    contents.lines().filter(|line| line.contains(query)).collect()
}

fn case_insensitve<'a> (query:&str, contents:&'a str) -> Vec<&'a str> {
    contents.lines().filter(|line| line.to_lowercase().contains(&query.to_lowercase())).collect()
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
Pick three.
Duct tape";

        assert_eq!(vec!["safe, fast, productive."], search(query, contents));
    }


    #[test]
    fn ts_case_insensitve () {
        let query = "rusT";
        let contents = "\
Rust:
safe fast productive
Pick three";
        assert_eq!(vec!["Rust:"],case_insensitve(query,contents));

    }
}




