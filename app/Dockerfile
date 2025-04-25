FROM gradle:8.4-jdk17
WORKDIR /app
COPY . .
RUN chmod +x ./gradlew
EXPOSE ${PORT:-7000}

# Define las variables de entorno
ENV PORT=${PORT:-7000}
ENV URL_MONGO=${mongodb+srv://josearieldabas01:HL4OcEYAGqynX5Jj@josedatabase.7dkjm.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0}
ENV DB_NOMBRE=${proyecto_final}

# Comando para ejecutar la aplicación
CMD ./gradlew build run
