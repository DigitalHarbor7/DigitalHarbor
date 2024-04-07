from pathlib import Path

from PIL import Image


def generate_qr_code_with_border(input_path, output_path, border_size, extra_bottom_space):
    # Load the QR code image
    qr_code = Image.open(input_path)

    # Calculate the position to center the QR code horizontally
    new_width = qr_code.width + 2 * border_size
    x_offset = (new_width - qr_code.width) // 2
    y_offset = qr_code.height + extra_bottom_space

    # Create a white background image with the desired resolution
    new_height = qr_code.height + extra_bottom_space + border_size
    background = Image.new('RGB', (new_width, new_height), 'white')

    # Paste the QR code onto the white background
    background.paste(qr_code, (x_offset, extra_bottom_space))

    # Resize the image to the final output size while maintaining the QR code's aspect ratio
    final_image = background.resize((512, int(512 * (new_height / new_width))), Image.LANCZOS)

    # Save the final image
    final_image.save(output_path)

if __name__ == "__main__":
    directory = Path(__file__).parent.parent.absolute()
    input_qr_code_path = f"{directory}/example2/qr-raw.png"
    output_path = f"{directory}/example2/qr-base.png"
    border_size = 50
    extra_bottom_space = 50

    generate_qr_code_with_border(input_qr_code_path, output_path, border_size, extra_bottom_space)
