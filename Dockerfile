FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy source code
COPY . .

# Build the server
RUN ./gradlew build

# Expose the port Render expects
ENV PORT=8082
EXPOSE 8082

# Start the server with your config
CMD ["java", "-jar", "target/tracker-server.jar", "conf/traccar.xml"]
