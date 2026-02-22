# Usar imagen base de Java 21
FROM eclipse-temurin:21-jdk-jammy

# Establecer directorio de trabajo
WORKDIR /minecraft

# Instalar utilidades necesarias
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copiar archivos del servidor
COPY server.properties /minecraft/
COPY eula.txt /minecraft/
COPY bukkit.yml /minecraft/
COPY spigot.yml /minecraft/
COPY commands.yml /minecraft/
COPY help.yml /minecraft/
COPY permissions.yml /minecraft/
COPY config/ /minecraft/config/
COPY plugins/ /minecraft/plugins/
COPY libraries/ /minecraft/libraries/

# Copiar el script Python de gestión (opcional pero recomendado)
COPY COSMOS.PY /minecraft/

# Descargar el JAR del servidor (Paper 1.21.7)
RUN mkdir -p /minecraft/versions/1.21.7 && \
    curl -L https://papermc.io/api/v2/projects/paper/versions/1.21.7/builds \
    | grep -o '"id":[0-9]*' | head -1 | grep -o '[0-9]*' > /tmp/build_id.txt && \
    BUILD_ID=$(cat /tmp/build_id.txt) && \
    curl -L "https://papermc.io/api/v2/projects/paper/versions/1.21.7/builds/$BUILD_ID/downloads/paper-1.21.7-$BUILD_ID.jar" \
    -o /minecraft/server.jar && \
    rm /tmp/build_id.txt

# Cambiar propietario de archivos
RUN chmod -R 755 /minecraft

# Exponer puerto del servidor
EXPOSE 25565

# Variable de entorno para memoria
ENV MEMORY=1G
ENV JVM_OPTS="-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200"

# Comando para ejecutar el servidor
CMD java -Xmx${MEMORY} -Xms${MEMORY} ${JVM_OPTS} -jar /minecraft/server.jar nogui
