# 🚀 Reto DevOps 90 Días | Prácticas y Laboratorios

[![DevOps](https://img.shields.io/badge/Track-DevOps%20Engineering-blue?style=for-the-badge&logo=devops)](https://github.com/jhonatanfelipet/DevOps90dias)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white)](https://www.ansible.com/)
[![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)](https://github.com/features/actions)

Repositorio central de laboratorios prácticos desarrollados a lo largo del reto de 90 días de DevOps. Contiene implementaciones reales que cubren desde administración de sistemas y scripting en Bash, hasta orquestación con Kubernetes, gestión de configuración con Ansible y contenedores con Docker.

---

## 📑 Tabla de Contenidos

1. [Estructura del Proyecto](#-estructura-del-proyecto)
2. [Módulos y Laboratorios](#-módulos-y-laboratorios)
   - [01. Automatización con Bash Scripting](#1-automatización-con-bash-scripting)
   - [02. Contenerización con Docker](#2-contenerización-con-docker)
   - [03. Orquestación con Kubernetes](#3-orquestación-con-kubernetes)
   - [04. Infraestructura y Configuración con Ansible](#4-infraestructura-y-gestión-de-configuración-con-ansible)
   - [05. Integración Continua (CI/CD)](#5-integración-continua-cicd)
3. [Entornos Virtuales (Vagrant)](#-entornos-de-laboratorio-con-vagrant)
4. [Buenas Prácticas Aplicadas](#-buenas-prácticas-aplicadas)
5. [Autor](#-autor)

---

## 📂 Estructura del Proyecto

```plaintext
DevOps90dias/
├── scripts-bash/          # Scripts de automatización y administración de sistemas
├── merge-conflict-demo/   # Simulación y resolución de conflictos en Git
├── docker/                # Despliegues multi-contenedor con Docker Compose
│   ├── node-mongo-app/    # Backend Node.js + Base de datos MongoDB
│   └── wordpress/         # Stack WordPress + MySQL persistente
├── practica_docker_1/     # Aprovisionamiento automatizado de Docker en Linux
├── kubernetes/            # Manifiestos de Kubernetes (Pods, Deployments, Services)
├── ansible/               # Playbooks y Vagrantfiles para ambientes de prueba
├── proyecto-ansible/      # Estructura modular de Ansible basada en Roles
│   ├── roles/             # Roles: firewall, nginx, usuario
│   └── inventories/dev/   # Inventario y variables por entorno
└── mi-primer-ci-cd/       # Submódulo: Pipeline de CI/CD con GitHub Actions
```

---

## 🛠️ Módulos y Laboratorios

### 1. Automatización con Bash Scripting
Directorio: [`scripts-bash/`](./scripts-bash/)
- **`backup_logs.sh`**: Automatización de respaldos de logs con compresión y gestión de almacenamiento.
- **`servicio_status.sh`**: Monitoreo y comprobación del estado de servicios en segundo plano.
- **`desplegar_app.sh` & `desplegar_app_2.sh`**: Scripts de despliegue automatizado con validación de dependencias y reinicio de servicios.
- Scripts utilitarios de control de flujo, búsqueda de patrones y manipulación de texto en Linux.

### 2. Contenerización con Docker
Directorios: [`docker/`](./docker/) y [`practica_docker_1/`](./practica_docker_1/)
- **Arquitectura Multicapa (Node.js + MongoDB)**: Configuración de redes aisladas (`bridge`), volúmenes y variables de entorno para comunicación entre microservicios.
- **CMS Monolítico (WordPress + MySQL)**: Montaje de volúmenes persistentes para persistencia de datos y desacoplamiento de almacenamiento.
- **Aprovisionamiento Automático**: Scripting de instalación de Docker Engine y Docker Compose sobre entornos limpios.

### 3. Orquestación con Kubernetes
Directorio: [`kubernetes/`](./kubernetes/)
- **Cargas de Trabajo (Workloads)**:
  - Definición y despliegue de Pods (`mi-pod.yaml`).
  - Estrategias de replicación y auto-recuperación con ReplicaSets (`replicasert.yaml`).
  - Despliegues declarativos (`deploy.yaml`) con soporte de *rolling updates* y *resource limits*.
- **Networking**:
  - Exposición de servicios de red mediante Services (`service.yaml`) para balanceo de carga y descubrimiento interno.

### 4. Infraestructura y Gestión de Configuración con Ansible
Directorios: [`ansible/`](./ansible/) y [`proyecto-ansible/`](./proyecto-ansible/)
- **Diseño Modular basado en Roles**:
  - `roles/firewall`: Endurecimiento de red y reglas de filtrado con UFW/iptables.
  - `roles/nginx`: Instalación, configuración y puesta a punto de Nginx como proxy inverso.
  - `roles/usuario`: Gestión de usuarios, grupos y políticas de acceso SSH.
- **Gestión de Ambientes**:
  - Segregación de inventarios (`inventories/dev/hosts`) y variables de configuración (`vars.yml`).
  - Playbooks declarativos e idempotentes (`playbook.yml`).

### 5. Integración Continua (CI/CD)
Submódulo: [`mi-primer-ci-cd/`](https://github.com/jhonatanfelipet/mi-primer-ci-cd)
- Pipelines completos implementados en **GitHub Actions**:
  - Matriz de pruebas para múltiples versiones de Python.
  - Ejecución automatizada de pruebas unitarias con `pytest` y cálculo de cobertura de código (`pytest-cov`).
  - Construcción y publicación automatizada de imágenes de contenedor en Docker Hub.

---

## 🖥️ Entornos de Laboratorio con Vagrant

Para garantizar la reproducibilidad y el aislamiento de las prácticas, se utilizan entornos virtualizados definidos mediante código (`Vagrantfile`), permitiendo levantar clústeres locales de máquinas virtuales con VirtualBox para pruebas de Ansible y redes.

---

## 🌟 Buenas Prácticas Aplicadas

* **Idempotencia**: Garantía de estados consistentes en la gestión de configuración con Ansible.
* **Separación de Responsabilidades**: Arquitectura desacoplada en contenedores y roles independientes.
* **Infraestructura como Código (IaC)**: Especificación reproducible de infraestructura y dependencias.
* **Seguridad Básica**: Restricción de permisos, configuración de cortafuegos y gestión de variables protegidas.

---

## 👤 Autor

**Jhonatan Felipe Taborda**
- GitHub: [@jhonatanfelipet](https://github.com/jhonatanfelipet)
- Especialidad: DevOps & Cloud Engineering
