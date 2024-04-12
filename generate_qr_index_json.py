import os
import json


def generate_image_list(root_dir):
    image_list = []
    for folder_name, _, files in os.walk(root_dir):
        if files:
            folder_images = [f for f in files if f.endswith(".png")]
            if folder_images:
                folder_path = os.path.relpath(folder_name, root_dir)
                image_list.append({"folder": folder_path, "images": folder_images})
    return image_list


def generate_json_file(image_list, output_file):
    with open(output_file, "w") as f:
        json.dump(image_list, f, indent=4)


if __name__ == "__main__":
    root_dir = "_site/qr/digital-harbor"
    output_file = "_site/qr/index.json"

    image_list = generate_image_list(root_dir)
    generate_json_file(image_list, output_file)

    print("JSON file generated successfully.")
