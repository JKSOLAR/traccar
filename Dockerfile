FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy all files (including conf/traccar.xml)
COPY . .

# Create logs dir to prevent log error
RUN mkdir -p logs

# Build project
RUN ./gradlew build

# Expose port expected by Render
ENV PORT=8082
EXPOSE 8082

# Run Traccar with the embedded config
CMD ["java", "-jar", "target/tracker-server.jar", "conf/traccar.xml"]
