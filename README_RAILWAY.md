# 🚀 Desplegar en Railway.com

## Paso 1: Preparar el repositorio
```bash
git add Dockerfile railway.toml
git commit -m "Add Railway deployment files"
git push origin main
```

## Paso 2: Crear proyecto en Railway
1. Ve a [railway.app](https://railway.app)
2. Haz login con GitHub
3. Haz click en "New Project"
4. Selecciona "Deploy from GitHub repo"
5. Conecta tu repositorio `minecraft_server`

## Paso 3: Configurar variables (después del deploy)
En Railway dashboard, ve a tu proyecto y agrega estas variables de entorno:

```
MEMORY=1G
```

Para más memoria (mejor rendimiento):
```
MEMORY=2G    # Si tienes suficiente crédito gratis
```

## Paso 4: Obtener la IP y Puerto
Una vez deployado:
1. Ve a "Networking" en tu servicio
2. Verás algo como: `railway-xxx.railway.app:XXXXX`
3. Usa eso en tu cliente de Minecraft

## ¿Tienes dudas?
- Railway te da **$5 USD gratis/mes** de crédito
- El servidor consume aproximadamente **1-2 USD/mes**
- Si se te acaba el crédito, el servidor se pausará automáticamente

## Monitoreo
En el dashboard de Railway puedes:
- Ver logs en tiempo real
- Monitorear CPU y RAM
- Ver el consumo de crédito

¡Tu servidor estará online 24/7 sin pausas! 🎮
