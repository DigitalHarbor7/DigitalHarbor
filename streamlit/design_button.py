import streamlit as st
import requests
from typing import List
from bs4 import BeautifulSoup


@st.cache_data
def get_simple_icons():
    """
    Function to retrieve a list of all available icons from Simple Icons website.
    """
    # URL of the Simple Icons website
    url = "https://unpkg.com/browse/simple-icons@latest/icons/"

    # Send a GET request to the website
    response = requests.get(url)

    # Parse the HTML content
    soup = BeautifulSoup(response.content, "html.parser")

    # Find the table containing the icons
    table = soup.find("table")

    # Extract icon names from the table rows
    icon_list = []
    for row in table.find_all("tr")[1:]:
        icon_name = row.find_all("td")[1].text.strip()
        icon_list.append(icon_name)
    return icon_list


def generate_html_link(
    url,
    text,
    gradient_start_color,
    gradient_start_value,
    gradient_end_color,
    gradient_end_value,
    text_color,
    text_size_id,
):
    """
    Function to generate an HTML link with specified parameters and Tailwind CSS styles.
    """
    return f"""
        <a href="{url}" target="_blank" rel="noopener" 
        class="button 
            bg-gradient-to-br 
            from-{gradient_start_color}-{gradient_start_value} 
            to-{gradient_end_color}-{gradient_end_value}
            hover:from-{gradient_end_color}-{gradient_end_value}
            hover:to-{gradient_start_color}-{gradient_start_value} 
            text-{text_color}
            font-bold 
            py-5 
            px-4 
            rounded-3xl
            block 
            mb-2 
            text-{text_size_id} 
            flex
            items-center 
            justify-center"
            > 
        <img class="icon inline-block align-middle mr-2"
            src="https://cdn.simpleicons.org/{text.lower()}/black/white" /> <span class="button-label">{text.title()}</span>
        </a>
    """


def main(icons_list: List[str]):
    st.title("Custom HTML Link Generator")

    # Input fields for URL, link text, gradient start color, gradient end color, text color, and target
    url = st.text_input("Enter URL:", "http://instagram.com/TODO")
    text = st.selectbox(
        "Select Link Text:", icons_list, index=icons_list.index("Instagram")
    )
    gradient_start_color = st.text_input(
        "Enter Gradient Start Color (e.g., pink):", "pink"
    )
    gradient_start_value = st.slider(
        "Gradient Start Value:", min_value=100, max_value=900, step=100, value=600
    )
    gradient_end_value = st.slider(
        "Gradient End Value:", min_value=100, max_value=900, step=100, value=600
    )
    gradient_end_color = st.text_input(
        "Enter Gradient End Color (e.g., indigo):", "indigo"
    )
    tailwind_colors = [
        "white",
        "black",
        "gray",
        "red",
        "yellow",
        "green",
        "blue",
        "indigo",
        "purple",
        "pink",
    ]
    text_color = st.selectbox(
        "Select Text Color:", tailwind_colors, index=tailwind_colors.index("white")
    )
    tailwind_text_sizes = [
        "xs",
        "sm",
        "base",
        "lg",
        "xl",
        "2xl",
        "3xl",
        "4xl",
        "5xl",
        "6xl",
        "7xl",
        "8xl",
        "9xl",
    ]
    text_size_id = st.selectbox(
        "Select Text Size:", tailwind_text_sizes, index=tailwind_text_sizes.index("2xl")
    )

    # Generate HTML link based on inputs
    html_link = generate_html_link(
        url,
        text,
        gradient_start_color,
        gradient_start_value,
        gradient_end_color,
        gradient_end_value,
        text_color,
        text_size_id,
    )

    # Display the generated HTML link in plaintext
    st.text("Generated HTML Link:")
    st.text(html_link)

    # Display a static HTML page with the generated button embedded
    st.markdown("---")
    st.subheader("HTML Preview")
    st.components.v1.html(
        f"""
        <!DOCTYPE html>
        <html>
        <head>
            <title>Custom Button Preview</title>
            <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800&display=swap" rel="stylesheet">
            <!-- Include the Tailwind CSS framework -->
            <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
            <style>
                body {{
                    font-family: 'Open Sans', Arial, sans-serif;
                    padding: 0;
                    margin: 0;
                }}
                .button {{
                    margin-bottom: 20px;
                }}
                .icon {{
                    width: 24px;
                    height: 24px;
                }}
            </style>
        </head>
        <body>
            <div >
                {html_link}
            </div>
        </body>
        </html>
        """,
        height=500,
    )


if __name__ == "__main__":
    # Get the list of all available icons
    icons_list = get_simple_icons()
    main([x.replace(".svg", "").title() for x in icons_list])
