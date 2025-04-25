FROM gradle:8.4-jdk17 AS build
WORKDIR /app
COPY . .
RUN chmod +x ./gradlew
RUN ./gradlew --no-daemon assemble

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
COPY --from=build /app/public /app/public

ENV PORT=7000
EXPOSE ${PORT}

CMD ["sh", "-c", "java -Dserver.port=${PORT} -DURL_MONGO=${mongodb+srv://josearieldabas01:HL4OcEYAGqynX5Jj@josedatabase.7dkjm.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0} -DDB_NOMBRE=${proyecto_final} -jar app.jar"]
