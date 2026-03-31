import nbformat
from nbconvert.preprocessors import ExecutePreprocessor
import os
import time

start_total = time.time()

def ejecutar_notebook(path_notebook):
    print(f"---Iniciando: {path_notebook} ---")
        
    # Notebook upload
    if not os.path.exists(path_notebook):
        print(f"❌ Error: El archivo {path_notebook} no existe.")
        return False
    with open(path_notebook, 'r', encoding='utf-8') as f:
        nb = nbformat.read(f, as_version=4)

    # Executor settings
    ep = ExecutePreprocessor(timeout=-1, kernel_name='python3')

    try:
        inicio_nb = time.time()
        ep.preprocess(nb, {'metadata': {'path': os.path.dirname(path_notebook)}})
        print(f"✅ Finalizado con éxito: {path_notebook}")
        fin_nb = time.time()
        print(f"✅ {path_notebook} finalizado con éxito ({round(fin_nb - inicio_nb, 2)}s)")
        return True
    except Exception as e:
        print(f"❌ ERROR en {path_notebook}:")
        print(f"Detalle: {e}")
        return False

if __name__ == "__main__":
    # Notebooks list
    pipeline = [
        "notebooks/01_extraction.ipynb",
        "notebooks/02_cleaning.ipynb",
        "notebooks/03_statistical_analysis.ipynb"
    ]

    for notebook in pipeline:
        exito = ejecutar_notebook(notebook)
        if not exito:
            print("\n❌Abortando el resto del pipeline.")
            break
    else:
        print("\n ¡Pipeline completo ejecutado con éxito!")
        end_total = time.time()
    print(f"\n Pipeline terminado en {round(end_total - start_total, 2)} segundos.")