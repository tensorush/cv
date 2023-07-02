cv:
    rm -f ./cv.pdf
    typst --font-path ./assets/fonts/ compile ./cv.typ
