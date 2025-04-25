FROM gradle:7.4.2-jdk11 AS build
WORKDIR /app
COPY . .
RUN gradle build -x test --no-daemon

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
ENV PORT=8080
ENV URL_MONGO=mongodb://localhost:27017
ENV DB_NOMBRE=urlshortener

EXPOSE ${PORT}
CMD ["sh", "-c", "java -jar app.jar"]
