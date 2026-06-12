# 1. Imagen base
FROM webapp-base:latest

# 2. Directorio de trabajo
WORKDIR /app

# 3. Copiar requirements.txt e instalar dependencias con pip
COPY app/requirements.txt .
RUN pip install -r requirements.txt

# 4. Copiar el resto del código
COPY app/ .

# 5. Exponer el puerto 5000
EXPOSE 5000

# 6. Arrancar la aplicación (comando por argumentos ["exe", "arg1", "arg2"  "..."])
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

#Ejecutar bat o docker load -i ./images-20260609/webapp-base.tar para ambas