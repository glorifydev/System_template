from backend.database.db import get_connection

def test_get_clients():
    conn = get_connection()
    if not conn:
        return
    try:
        with conn.cursor() as cur:
            cur.execute("SELECT * FROM get_clients_list();")
            rows = cur.fetchall()
            for row in rows:
                print(row)
    finally:
        conn.close()

test_get_clients()
