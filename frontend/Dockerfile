# Imagen base de Node
FROM node:18-alpine

# Carpeta de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos del frontend (los de cliente)
COPY ./cliente/package*.json ./cliente/

# Instalar dependencias dentro de cliente
RUN cd cliente && npm install

# Copiar todo el código del cliente
COPY ./cliente ./cliente

# Establecer la carpeta de trabajo final
WORKDIR /app/cliente

# Exponer el puerto (5173 si es Vite, 3000 si es CRA)
EXPOSE 5173

# Comando para arrancar el servidor de desarrollo
CMD ["npm", "run", "dev"]


