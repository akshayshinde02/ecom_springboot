# Stage 1: Build the application
FROM maven:3.9.1-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM eclipse-temurin:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/e-commerce-0.0.1-SNAPSHOT.jar e-commerce.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "e-commerce.jar"]
