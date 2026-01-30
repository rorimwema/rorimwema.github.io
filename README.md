# Clint Rori's Digital Garden

A personal blog and digital garden built with [Hugo](https://gohugo.io/), featuring a custom design system based on the **Flexoki** color scheme and **Lexend Deca** typography.

## 🎨 Design System

- **Theme**: Based on `hugo-bearcub` with significant customizations.
- **Colors**: [Flexoki](https://stephango.com/flexoki) - An inky, warm, and natural color scheme for digital displays.
    - **Light Mode**: Paper background (`#FFFCF0`) with crisp black text.
    - **Dark Mode**: Black background (`#100F0F`) with soft gray text (Automatic system detection).
- **Typography**: [Lexend Deca](https://fonts.google.com/specimen/Lexend+Deca) - Designed for reading proficiency and clarity.

## 🛠️ Tech Stack

- **Generator**: Hugo (Extended)
- **Hosting**: GitHub Pages
- **Styles**: Custom CSS variables for theming and semantic layout.

## 🚀 Local Development

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/rorimwema.github.io.git
    cd rorimwema.github.io
    ```

2.  **Initialize Submodules** (Important for the base theme):
    ```bash
    git submodule update --init --recursive
    ```

3.  **Run the Server**:
    ```bash
    hugo server
    ```
    The site will be available at `http://localhost:1313/`.

## 📦 Deployment

This site is configured to deploy via **GitHub Pages**.

- Push changes to the `main` branch.
- Hugo generates the static site into the `public/` directory (or GitHub Actions handles the build, depending on configuration).

## 📝 License

© 2026 Clint Rori. Built with ❤️ and OCaml (just kidding, it's Go).
