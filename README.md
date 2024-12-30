# incode_demo

## Incode Demo

### Environment

Crear un archivo .env en la raiz del proyecto con las siguientes variables:

- En el caso de la API URL de incode es SIN `/0/` al final.
- En el caso de los token, externalId son los que se obtienen de la API de incode - startOnboarding.

```
INCODE_API_URL=https://example.com
INCODE_TOKEN=
INCODE_EXTERNAL_ID= Es el interviewId
INCODE_CONFIGURATION_ID= Es el flowId
```

### Correr el proyecto IOS

```bash
flutter pub get
cd ios
pod install
cd ..
```
