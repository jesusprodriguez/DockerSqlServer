# Utiliza una imagen base de SQL Server
FROM mcr.microsoft.com/mssql/server:2019-latest

# Variables de entorno para configurar la base de datos
ENV SA_PASSWORD DockerSqlServer
ENV ACCEPT_EULA Y

# Crear y configurar una base de datos al iniciar el contenedor
ENV MSSQL_PID Express
ENV MSSQL_DATABASE MiBaseDeDatos
ENV MSSQL_USER MiUsuario
ENV MSSQL_PASSWORD MiContraseña

# Copiar archivos de scripts SQL al contenedor
COPY MiScript.sql /docker-entrypoint-initdb.d/
COPY CopiaSeguridad /docker-entrypoint-initdb.d/


# El puerto por defecto para SQL Server es 1433
EXPOSE 1433
