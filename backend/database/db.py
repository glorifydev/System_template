import psycopg2
from psycopg2.extras import RealDictCursor

DB_HOST = "yamanote.proxy.rlwy.net"   # <-- host público
DB_PORT = 15573                        # <-- puerto público
DB_NAME = "railway"
DB_USER = "postgres"
DB_PASSWORD = "lZGPBJZRitEnkOLKxeKDcuvTbLOjqlqo"

def get_connection():
    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            port=DB_PORT,
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            cursor_factory=RealDictCursor,
            sslmode="require"          # importante en Railway
        )
        return conn
    except psycopg2.Error as e:
        print(f"Error al conectar a la base de datos: {e}")
        return None
