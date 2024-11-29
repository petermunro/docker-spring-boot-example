# Use Eclipse Temurin JDK 17
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy the Maven wrapper files
COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

# Copy the source code
COPY src/ src/

# Build the application using Maven wrapper
RUN ./mvnw clean package -DskipTests

# Expose the port the app runs on
EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "target/docker-demo-1.0.0.jar"] 