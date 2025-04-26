FROM gradle:8.4-jdk17
WORKDIR /app
COPY . .
RUN chmod +x ./gradlew

# Intenta compilar con detalles completos de errores
RUN java -version && ./gradlew --version
RUN ./gradlew --no-daemon assemble --warning-mode all --stacktrace --info

# Si fallara, este comando no se ejecutaría, pero lo dejamos para railway
EXPOSE ${PORT:-8080}
ENV PORT=${PORT:-8080}
ENV URL_MONGO=${mongodb+srv://josearieldabas01:HL4OcEYAGqynX5Jj@josedatabase.7dkjm.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0}
ENV DB_NOMBRE=${proyecto_final}

CMD ./gradlew build run --stacktrace
