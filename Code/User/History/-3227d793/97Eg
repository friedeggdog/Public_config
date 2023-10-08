
FROM ubuntu
RUN mkdir /Backend
COPY ./ /Backend/
RUN apt-get -y update
RUN apt-get install -y nano
RUN apt-get install -y curl
RUN apt-get install -y build-essential
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
WORKDIR /Backend
RUN apt-get install -y libpq-dev
RUN cargo install diesel_cli --no-default-features --features postgres --locked
