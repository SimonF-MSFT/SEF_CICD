import sys
import requests

def get_file_changes(repo, ref, path):
    url = f"https://api.github.com/repos/{repo}/contents/{path}?ref={ref}"
    response = requests.get(url)
    response.raise_for_status()
    return response.json()

def generate_summaries(file_list, repo, ref):
    summaries = []
    with open(file_list, 'r') as f:
        files = f.readlines()
        for file in files:
            file = file.strip()
            if file:
                changes = get_file_changes(repo, ref, file)
                summary = f"Summary for {file}: {changes}"  # Modify this line to generate actual Copilot summary
                summaries.append(summary)
    return summaries

def main():
    if len(sys.argv) != 4:
        print("Usage: python generate_copilot_summaries.py <file_list> <repo> <ref>")
        sys.exit(1)

    file_list = sys.argv[1]
    repo = sys.argv[2]
    ref = sys.argv[3]

    summaries = generate_summaries(file_list, repo, ref)
    with open("copilot_summaries.txt", "w") as f:
        for summary in summaries:
            f.write(summary + "\n")

if __name__ == "__main__":
    main()