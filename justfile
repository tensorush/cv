export TYPST_FONT_PATHS := "src/assets/fonts/"

set shell := ["bash", "-uc"]

bld-cvs:
    just bld-cv en
    just bld-cv ru

bld-cv LANG:
    typst c src/{{LANG}}.typ out/{{LANG}}.pdf

chk-lcds-upds:
    just chk-lcds-upd tensorush/bookkeeper main
    just chk-lcds-upd tensorush/zig-spin main
    just chk-lcds-upd tensorush/meduza main
    just chk-lcds-upd tensorush/zigzag main

chk-lcds-upd REPO BRANCH:
    `if [[ $(curl -s https://api.github.com/repos/{{REPO}}/commits/{{BRANCH}} | \
             jq -r '(now - (.commit.author.date | fromdateiso8601)) / (60 * 60 * 24) | trunc') == 0 \
    ]]; then \
        just upd-lcds {{REPO}} {{BRANCH}}; \
    fi`

upd-lcds REPO BRANCH:
    just upd-lcd {{REPO}} {{BRANCH}} en
    just upd-lcd {{REPO}} {{BRANCH}} ru

upd-lcd REPO BRANCH LANG:
    curl -s https://api.github.com/repos/{{REPO}}/branches/{{BRANCH}} | \
    jq -r '.commit.commit.author.date | strptime("%Y-%m-%dT%H:%M:%SZ") | strftime("%b %d, %Y, %I:%M %p")' | \
    python3 -c "d=input(); p='src/sections/{{LANG}}/projects.typ'; \
        f=open(p,'r'); s=f.read(); i=s.rindex('{{REPO}}')+len('{{REPO}}')+13; s=s.replace(s[i:i+22],d); f.close(); \
        f=open(p,'w'); f.write(s); f.close()"
