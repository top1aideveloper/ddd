import os
import subprocess

def run(cmd):
    subprocess.run(cmd, shell=True, check=True)


message = input("Describe your changes: ")

branch = input("Branch (default: main): ").strip()
if branch == "":
    branch = "main"

try:
    print("\nAdding files...")
    run("git add .")

    print("Committing...")
    run(f'git commit -m "{message}"')

    print("Pushing to GitHub...")
    run(f"git push origin {branch}")

    print("\nSuccessfully pushed update!")

except subprocess.CalledProcessError:
    print("\nGit operation failed. Check repo status or authentication.")