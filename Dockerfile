FROM registry.gitlab.com/islandoftex/images/texlive:latest

WORKDIR /work

COPY src/*.tex ./

RUN tlmgr update --self --all && tlmgr install babel-dutch babel-english

CMD ["tail", "-f", "/dev/null"]
