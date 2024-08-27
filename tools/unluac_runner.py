import os
import subprocess
import argparse

def process_lua_files(java_path, input_dir, output_dir):
    for root, dirs, files in os.walk(input_dir):
        for file in files:
            if file.endswith(".lua"):
                input_file = os.path.join(root, file)
                output_file = os.path.join(output_dir, os.path.relpath(input_file, input_dir))
                os.makedirs(os.path.dirname(output_file), exist_ok=True)
                print("Processing %s" % input_file)
                subprocess.run(["%s/java.exe" % java_path, "-jar", "unluac/out/artifacts/unluac_jar/unluac.jar", "--lua_version", "5.2-alpha", input_file], stdout=open(output_file, "w"))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process Lua files and call a Java program.")
    parser.add_argument("input_dir", help="Lua bytecode files")
    parser.add_argument("output_dir", help="Output")
    parser.add_argument("java_path", help="Java path")
    args = parser.parse_args()

    process_lua_files(args.java_path, args.input_dir, args.output_dir)
