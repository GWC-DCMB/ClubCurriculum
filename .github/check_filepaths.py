"""
Check that all Lessons have matching Practices & Keys

Usage:
    python check_filepaths.py
"""
import os


def main():
    file_map = {
        "Practices/Practice": get_notebooks("Practices"),
        "Lessons/_Keys/KEY_Lesson": get_notebooks("Lessons/_Keys"),
        "Practices/_Keys/KEY_Practice": get_notebooks("Practices/_Keys"),
    }
    for lesson_file in sorted(get_notebooks("Lessons")):
        if not lesson_file.startswith("Lessons/Lesson"):
            raise ValueError(
                f"Lesson filename {lesson_file} doesn't start with 'Lesson'."
            )
        suffix = lesson_file.strip("Lessons/Lesson")
        for prefix, files in file_map.items():
            expected_file = f"{prefix}{suffix}"
            if expected_file not in files:
                raise FileNotFoundError(f"Expected {expected_file} but file not found.")
        print(f"✅ Lesson file {lesson_file} has corresponding practices & keys.")
    print("🙌🏻 All lesson notebooks have corresponding practices & keys!")

def get_notebooks(directory):
    return {os.path.join(directory, file) for file in os.listdir(directory) if file.endswith(".ipynb")}


if __name__ == "__main__":
    main()
