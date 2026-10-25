# Configuración SSH para GitHub – CVMatch

Este proyecto utiliza SSH para comunicarse con GitHub.

Cada integrante del equipo debe configurar su propia clave SSH en su computadora y asociarla a su propia cuenta de GitHub.

## 1. Verificar Git

En Git Bash:

```bash
git --version
```

## 2. Verificar SSH

```bash
ssh -V
```

## 3. Comprobar si ya existen claves

```bash
ls -la ~/.ssh
```

Si ya existe una clave utilizada correctamente con GitHub, no es necesario crear otra.

## 4. Probar conexión con GitHub

```bash
ssh -T git@github.com
```

Si aparece:

```text
Hi USUARIO! You've successfully authenticated, but GitHub does not provide shell access.
```

la configuración es correcta.

## 5. Si no existe una clave

Crear una Ed25519:

```bash
ssh-keygen -t ed25519 -C "EMAIL_DE_GITHUB"
```

No compartir nunca la clave privada.

## 6. Iniciar ssh-agent

```bash
eval "$(ssh-agent -s)"
```

## 7. Agregar la clave

Si la clave se llama `id_ed25519`:

```bash
ssh-add ~/.ssh/id_ed25519
```

Si posee otro nombre, utilizar ese archivo.

## 8. Obtener la clave pública

```bash
cat ~/.ssh/id_ed25519.pub
```

Copiar únicamente el contenido de la clave `.pub`.

## 9. Registrar la clave en GitHub

Ingresar en GitHub:

Settings → SSH and GPG keys → New SSH key

Agregar la clave pública.

La clave privada nunca debe cargarse en GitHub ni compartirse con otro integrante.

## 10. Verificar nuevamente

```bash
ssh -T git@github.com
```

## 11. Clonar CVMatch

Una vez aceptada la invitación al repositorio:

```bash
git clone git@github.com:Joaco8907/CVMatch.git
```

Entrar al proyecto:

```bash
cd CVMatch
```

## 12. Obtener las ramas

```bash
git fetch origin
```

## 13. Cambiar a develop

```bash
git switch develop
```

Si la versión de Git utilizada no soporta `switch`:

```bash
git checkout develop
```

## 14. Configurar identidad Git

Cada integrante debe utilizar sus propios datos:

```bash
git config --global user.name "USUARIO"
```

```bash
git config --global user.email "EMAIL"

```




## 15. Crear una rama de trabajo (---IMPORTANTE-----)

Las funcionalidades no se desarrollan directamente sobre `main` ni sobre `develop`.

Ejemplo:

```bash
git switch develop
git pull origin develop
git switch -c feature/crud-ofertas
```

Flujo esperado:

```text
main
  ↑
develop
  ↑
feature/nombre-funcionalidad
```

Al finalizar el trabajo:

```bash
git add .
git commit -m "feat: agrega CRUD de ofertas"
git push -u origin feature/crud-ofertas
```

Después se crea un Pull Request hacia `develop`.

## Seguridad

Nunca compartir ni subir al repositorio archivos privados como:

```text
~/.ssh/id_ed25519
~/.ssh/jg_desktop_core5
```

Solamente las claves que terminan en `.pub` son claves públicas.

Además, ninguna clave SSH necesita guardarse dentro del proyecto CVMatch.