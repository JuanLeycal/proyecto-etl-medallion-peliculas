
"""
Proyecto: ETL Medallion de películas
Objetivo: documentar los recursos físicos de origen en AWS S3.

Este script NO elimina archivos. La eliminación del bucket o de los
CSV debe realizarse manualmente y solo después de confirmar que ya
no se necesitan.
"""

BUCKET = "proyecto-medallion-ventas-jleyvac-2026"
RUTA_RAW = f"s3://{BUCKET}/raw/"

ARCHIVOS_ORIGEN = [
    "Movies.csv",
    "FilmDetails.csv",
    "PosterPath.csv",
]


def mostrar_recursos():
    print("Recursos de origen del ETL Medallion")
    print(f"Bucket: {BUCKET}")
    print(f"Ruta raw: {RUTA_RAW}")
    print("\nArchivos que utiliza el proceso:")

    for archivo in ARCHIVOS_ORIGEN:
        print(f"- {RUTA_RAW}{archivo}")

    print("\nNo se ha eliminado ningún recurso.")
    print("Verifica dependencias antes de borrar datos de S3.")


if __name__ == "__main__":
    mostrar_recursos()
