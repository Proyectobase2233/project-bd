# 🍕 Sistema de Restaurante / Delivery

**Materia:** Modelado y Gestión de Base de Datos  
**Proyecto:** Taller Final  
**Tema:** App de pedidos de comida a domicilio

---

## 👥 Equipo

| | |
|---|---|
| **Integrante 1** | Juan Pablo Rojas Calderón |
| **Integrante 2** | Robert Andrés Osorio Patiño |
| **Organización** | [URL de tu GitHub Org] |
| **Docs** | `project-docs` |
| **Base de datos** | `project-bd` |
| **Profesor** | `ariel5253` |

---

## Qué es esto

Una base de datos para un restaurante que vende por delivery. Gestiona el menú, los pedidos, los repartidores, pagos, promociones y reseñas de clientes.

---

## Cómo correrlo

```bash
# 1. Levantar PostgreSQL
docker compose up -d postgres

# 2. Crear tablas y datos
docker compose run --rm liquibase update

# 3. Verificar
docker compose run --rm liquibase status
```

## Rollback

```bash
docker compose run --rm liquibase rollback-count --count=1
```

## Conectarse a la BD

```bash
docker compose exec postgres psql -U admin -d restaurante_delivery
```

---

## Qué incluye

- **17 tablas** (clientes, pedidos, platos, repartidores, pagos, etc.)
- **2 triggers** (valida stock + auditoría de estados)
- **2 procedures** (asigna repartidor + aplica promociones)
- **2 functions** (calcula total + ranking de platos)
- **2 consultas JOIN** con 6+ tablas cada una
- **~190 registros** de prueba
- Docker + Liquibase todo funcionando

---

## Estructura

```
project-bd/
├── docker-compose.yml
├── liquibase/
│   ├── changelog/           # Master changelog
│   ├── ddl/                 # Tablas, triggers, procedures, functions
│   └── dml/
│       ├── canonical/       # Datos base (roles, categorías, estados)
│       └── volumetric/      # Datos de prueba (clientes, pedidos, etc.)
├── rollback/                # Scripts para rollback
├── scripts/                 # Consultas JOIN de cada integrante
└── docs/                    # Documentación del proyecto
```

---

## Checklist entrega

- [ ] Crear GitHub Organization
- [ ] Agregar a `ariel5253`
- [ ] Subir `project-docs` y `project-bd`
- [ ] Probar que Docker levanta
- [ ] Probar que Liquibase migra
- [ ] Probar que rollback funciona
- [ ] Tomar screenshots de evidencias
