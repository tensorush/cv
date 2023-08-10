cvs:
    just cv en
    just cv ru

cv LANG:
    typst --font-path ./src/assets/fonts/ c ./src/{{LANG}}.typ ./out/{{LANG}}.pdf

chk-lcds-upds:
    just chk-lcds-upd tensorush/bookkeeper main
    just chk-lcds-upd tensorush/meduza main
    just chk-lcds-upd tensorush/zigzag main
    just chk-lcds-upd tensorush/vault main

chk-lcds-upd REPO BRANCH:
    `if [[ $(curl -s https://api.github.com/repos/{{REPO}}/commits/{{BRANCH}} | \
             jq -r "((now - (.commit.author.date | fromdateiso8601) ) / (60 * 60 * 24) | trunc)") == 0 \
    ]]; then \
        just upd-lcds {{REPO}} {{BRANCH}}; \
    fi`

upd-lcds REPO BRANCH:
    just upd-lcd {{REPO}} {{BRANCH}} en
    just upd-lcd {{REPO}} {{BRANCH}} ru

upd-lcd REPO BRANCH LANG:
    curl -s https://api.github.com/repos/{{REPO}}/branches/{{BRANCH}} | \
    python3 -c "import json,sys,datetime as dt;o=json.load(sys.stdin);d=o['commit']['commit']['author']['date']; \
        f=open('src/sections/{{LANG}}/projects.typ','r');s=f.read();i=s.index(' {{REPO}}')+len('{{REPO}}')+14; \
        s=s.replace(s[i:i+22],dt.datetime.fromisoformat(d).strftime('%b %d, %Y, %I:%M %p'));f.close(); \
        f=open('src/sections/{{LANG}}/projects.typ','w');f.write(s);f.close()"
