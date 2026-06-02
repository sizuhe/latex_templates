FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && \
    apt-get install -y \
        wget \
        perl \
        xz-utils \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*


ENV TINYTEX_INSTALLER=TinyTeX
RUN wget -qO- "https://yihui.org/tinytex/install-bin-unix.sh" | sh
ENV PATH="/root/.TinyTeX/bin/x86_64-linux:${PATH}"


RUN tlmgr update --self
RUN tlmgr install \
    biblatex \
    biblatex-apa \
    biber \
    caption \
    iwona \
    josefin \
    nomencl \
    pgf \
    pgfplots \
    vwcol \
    sourceserif


WORKDIR /workspace
CMD ["/bin/bash"]
