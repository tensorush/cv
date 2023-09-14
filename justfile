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
    just upd-lcd {{REPO}} {{BRANCH}} en US
    just upd-lcd {{REPO}} {{BRANCH}} ru RU

upd-lcd REPO BRANCH LANG STATE:
    curl -s https://api.github.com/repos/{{REPO}}/branches/{{BRANCH}} | \
    python3 -c "import sys,json,locale,datetime; d=json.load(sys.stdin)['commit']['commit']['author']['date']; \
                p='src/sections/{{LANG}}/projects.typ'; f=open(p,'r'); s=f.read(); f.close(); \
                i=s.rindex('{{REPO}}')+len('{{REPO}}')+13; j=s.index(']',i); f=open(p,'w'); \
                locale.setlocale(locale.LC_TIME,'{{LANG}}_{{STATE}}.UTF-8'); \
                t='%B %-d, %Y' if '{{LANG}}' == 'en' else '%-d %B, %Y'; \
                s=s.replace(s[i:j],datetime.datetime.fromisoformat(d).strftime(t)); f.write(s); f.close()"
