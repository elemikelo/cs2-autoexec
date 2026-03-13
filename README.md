# CS2 Autoexec & Movement Config

Configuración avanzada para **Counter-Strike 2** orientada a **KZ / movement / practice**, con instalación automática mediante script.

Incluye binds y configuraciones para:

* KZ
* Long Jump
* Count Jump
* Practice tools
* HUD dinámico
* Configuración base (`autoexec`)

---

# 📂 Estructura del proyecto

```
CS2-AUTOEXEC
│
├─ CFG
│  ├─ dynamic_hud.cfg
│  └─ practicas2.cfg
│
├─ otag
│  ├─ -cj.cfg
│  ├─ +cj.cfg
│  ├─ +lj.cfg
│  └─ jb.cfg
│
├─ autoexec.cfg
├─ kz.cfg
└─ install_cfg.bat
```

### Archivos principales

| Archivo           | Descripción                                         |
| ----------------- | --------------------------------------------------- |
| `autoexec.cfg`    | Configuración principal cargada al iniciar el juego |
| `kz.cfg`          | Configuración específica para KZ                    |
| `dynamic_hud.cfg` | HUD dinámico para prácticas                         |
| `practicas2.cfg`  | Configuración de práctica                           |
| `+lj.cfg`         | Script para Long Jump                               |
| `+cj.cfg`         | Script para Count Jump                              |
| `-cj.cfg`         | Reset del Count Jump                                |
| `jb.cfg`          | Script adicional de movimiento                      |

---

# ⚡ Instalación automática (recomendado)

1. Descarga o clona el repositorio

```
git clone https://github.com/TU_USUARIO/cs2-autoexec
```

o descarga el **ZIP**.

2. Ejecuta:

```
install_cfg.bat
```

3. El instalador:

* detectará automáticamente tu carpeta `cfg`
* copiará todos los archivos necesarios
* sobrescribirá configuraciones anteriores si existen

---

# ⚙️ Activar autoexec en Steam

Para que el archivo se cargue automáticamente:

1. Abre **Steam**
2. Ve a tu biblioteca
3. Click derecho en **Counter-Strike 2**
4. Propiedades
5. En **Opciones de lanzamiento** añade:

```
+exec autoexec.cfg
```

---

# 🛠 Instalación manual

Si prefieres hacerlo manualmente:

1. Ve a tu carpeta de configuración de CS2

```
Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

2. Copia dentro:

```
autoexec.cfg
kz.cfg
dynamic_hud.cfg
practicas2.cfg
+cj.cfg
-cj.cfg
+lj.cfg
jb.cfg
```

---

# 🎮 Uso

Una vez dentro del juego puedes ejecutar configuraciones manualmente:

```
exec kz
exec practicas2
exec dynamic_hud
```

---

# 🧠 Recomendado para

* KZ players
* Movement practice
* Long Jump training
* Count Jump practice
* Private servers

---

# 🔄 Actualizar configuración

Si el repositorio recibe cambios:

1. Descarga la nueva versión
2. Ejecuta nuevamente

```
install_cfg.bat
```

---

# 👤 Autor

**elemikelo**

CS2 movement configs.

---

# 📄 Licencia

Uso libre para **práctica y aprendizaje**.
