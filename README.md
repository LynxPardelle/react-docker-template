
# React Docker Template 🐳⚛️

This template allows you to **create, develop, and build** React apps with Vite, using Docker for everything. No need to install Node.js or npm on your host machine.

## ✅ Requirements

- Docker
- Make (available by default in Unix/Linux/macOS; for Windows use WSL or Git Bash)

---

## 🚀 Getting Started

### 1. Create a new React app in the current directory

```bash
make create
```

This runs `npm create vite@latest` inside a container and moves everything to the root directory. You can customize the app name and template by editing `.env`.

### 2. Start the development server (Vite + Hot Module Replacement)

```bash
make dev
```

Accessible at: [http://localhost:5173](http://localhost:5173)

### 3. Start the production server (Nginx serving built files)

```bash
make prod
```

Accessible at: [http://localhost:3000](http://localhost:3000)

---

## 🛠️ Useful Commands

| Command           | Description                                 |
|-------------------|---------------------------------------------|
| `make stop`       | Stop all running containers                 |
| `make clean`      | Stop, remove volumes, and clean node_modules |
| `make logs`       | Follow logs from the current container      |
| `make rebuild`    | Rebuild everything from scratch             |
| `make install pkg=axios` | Install a package inside the dev container |
| `make install-dev pkg=vitest` | Install a dev dependency inside the container |

---

## 🌱 Environment Configuration

To customize the app creation process:

1. Create a `.env` file at the root.
2. Use `.example-env` as a reference.

Example `.env`:
```env
APP_NAME=mi-app-react
VITE_TEMPLATE=react-swc-ts
UID=1000
GID=1000
```

---

## 📂 Folder Structure

- `docker-compose.yml` — Unified file with profiles for create/dev/build
- `Dockerfile` — Multi-stage build with targets for `dev` and `prod`
- `Makefile` — All-in-one task automation
- `docker/vite.config.ts` — Custom Vite config used at project generation

---

## 💡 Tips

- Run `make create` only once, when initializing the app.
- For new features, always use `make dev` so you never pollute your local environment.
- Production containers are fully isolated and use Nginx for serving static files.

---

Happy coding! 🧑‍💻
