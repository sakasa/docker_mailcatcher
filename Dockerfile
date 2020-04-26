FROM rails

RUN apt-get update 
RUN gem install mailcatcher

CMD ["mailcatcher", "--ip", "0.0.0.0", "-f"]
