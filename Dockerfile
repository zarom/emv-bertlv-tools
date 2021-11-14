FROM openjdk:8-jdk-alpine as build

WORKDIR /app

COPY . .

RUN mvn install

FROM jetty:9-jre8-slim

COPY --from=build /app/target/tvr-decoder-1.0.war /var/lib/jetty/webapps/ROOT.war
