FROM openjdk:11
COPY . /usr/src/myapp
COPY VERSION /

WORKDIR /usr/src/myapp
RUN javac app.java
CMD ["java", "HelloWorld"]