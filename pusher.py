import os
import subprocess

def run(cmd):
    subprocess.run(cmd, shell=True, check=True)

print("=== GitHub Update Pusher ===")

# Ask for commit message
message = input("Describe your changes: ")

# Optional: confirm branch
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

    print("\n✅ Successfully pushed update!")

except subprocess.CalledProcessError:
    print("\n❌ Git operation failed. Check repo status or authentication.")