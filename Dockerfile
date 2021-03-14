FROM adoptopenjdk/openjdk8
LABEL maintainer=rahul
WORKDIR /rahul
COPY target/*.jar /rahul/app.jar
EXPOSE 8080
CMD['java', '-jar', 'app.jar']
