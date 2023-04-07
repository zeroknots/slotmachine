use regex::Regex;
use std::env;
use std::fs::{self, File};
use std::io::{self, BufRead, BufReader, Write};
use std::path::Path;
use std::process::Command;

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        println!("Usage: program <pluginSolidityFile>");
        return;
    }

    let plugin_solidity_file = &args[1];

    // Execute shell command
    let output_file = format!("{}", plugin_solidity_file);

    // Read the output file
    let mut lines = Vec::new();
    let object_regex = Regex::new(r#"object "(.+)_deployed""#).unwrap();
    let mut inside_object = false;
    let mut inside_mapping_function = false;

    if let Ok(file_lines) = read_lines(&output_file) {
        for line in file_lines {
            if let Ok(line_content) = line {
                if let Some(object_match) = object_regex.captures_iter(&line_content).next() {
                    inside_object = true;
                } else if line_content.starts_with("}") {
                    inside_object = false;
                }

                if inside_object && line_content.contains("code {") {
                    // Inject the YUL function
                    let yul_function = fs::read_to_string("slotmachineInject.txt").unwrap();
                    lines.push(line_content.clone());
                    lines.push(yul_function.to_string());
                    continue;
                }

                if line_content.starts_with("function mapping_index") {
                    inside_mapping_function = true;
                } else if line_content.starts_with("function") {
                    inside_mapping_function = false;
                }

                if line_content.contains("dataSlot := keccak256") {
                    // Inject the YUL function call
                    lines.push("\t\t\t\tdataSlot := keccak256(0, 0x40)".to_string());
                    lines.push("\t\t\t\tfun__logSlot_1337(slot,key,dataSlot)".to_string());
                } else {
                    lines.push(line_content);
                }
            }
        }
    }

    // Overwrite the original input file with the modified content
    let mut file = File::create(&output_file).expect("Failed to create output file");
    for line in lines {
        writeln!(file, "{}", line).expect("Failed to write line to output file");
    }
}

// The output is wrapped in a Result to allow matching on errors
// Returns an Iterator to the Reader of the lines of the file.
fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where
    P: AsRef<Path>,
{
    let file = File::open(filename)?;
    Ok(BufReader::new(file).lines())
}
