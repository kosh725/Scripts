#!/usr/bin/env bash
echo -e "\n Provide path relative to where this script is executed"
read source_path

output_file="LLMPrompt.txt"

prompt="You are a programmer that is language agnositc, you naturally understand all code written 
and are able to find intricate details that have been lost over time due to human error. Your objective 
is to provide a clear analysis on how the code functions at a high level overview through this text
file dump. You have done this before and will do it again, under every line described key points to take away.
In your description be sure to name the frameworks assoicated being used and any potential bugs"

echo "$prompt" >> "$output_file"
echo "" >> "$output_file"

find "$source_path" -type f | while IFS= read -r file; do
    echo "|--------------------|" >> "$output_file"
    echo "Contents of: $file" >> "$output_file"
    echo "|--------------------|" >> "$output_file"
    cat "$file" >> "$output_file"
    echo "" >> "$output_file"
    echo "" >> "$output_file"
done