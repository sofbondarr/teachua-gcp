# ─── Build Stage ───────────────────────────────────────────────────────────────
FROM maven:3.9.4-eclipse-temurin-17 AS builder
WORKDIR /app

# Copy pom first to leverage layer caching
COPY pom.xml .

# Copy all your source
COPY src ./src

# 1) Download all dependencies first to leverage layer caching
RUN mvn dependency:go-offline \
    -DskipTests \
    -Dcheckstyle.skip=true

# 2) Now package your executable WAR
RUN mvn clean package \
    -DskipTests \
    -Dcheckstyle.skip=true

# ─── Run Stage ─────────────────────────────────────────────────────────────────
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

# Expose your app port
EXPOSE 8080

# Grab the WAR from the builder stage
COPY --from=builder /app/target/*.war app.war

COPY entry.sh entry.sh
RUN chmod +x entry.sh
COPY .env.default .env.default
# Launch it
ENTRYPOINT ["bash", "entry.sh"]
