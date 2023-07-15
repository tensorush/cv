cv:
    typst --font-path ./src/assets/fonts/ c ./src/en.typ ./out/en.pdf
    typst --font-path ./src/assets/fonts/ c ./src/ru.typ ./out/ru.pdf

lcs:
    just lc tensorush/zig-msgpuck main
    just lc tensorush/bookkeeper main
    just lc tensorush/zig-uuid main
    just lc tensorush/vault main

lc REPO BRANCH:
    curl -s https://api.github.com/repos/{{REPO}}/branches/{{BRANCH}} | \
    python3 -c "import json,sys,datetime as dt;o=json.load(sys.stdin);d=o['commit']['commit']['author']['date']; \
        f=open('src/sections/en/projects.typ','r');s=f.read();i=s.index(' {{REPO}}')+len('{{REPO}}')+14; \
        s=s.replace(s[i:i+22],dt.datetime.fromisoformat(d).strftime('%b %d, %Y, %I:%M %p'));f.close(); \
        f=open('src/sections/en/projects.typ','w');f.write(s);f.close(); \
        f=open('src/sections/ru/projects.typ','r');s=f.read();i=s.index(' {{REPO}}')+len('{{REPO}}')+14; \
        s=s.replace(s[i:i+22],dt.datetime.fromisoformat(d).strftime('%b %d, %Y, %I:%M %p'));f.close(); \
        f=open('src/sections/ru/projects.typ','w');f.write(s);f.close();"
