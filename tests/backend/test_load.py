import time
import random
from concurrent.futures import ThreadPoolExecutor, as_completed


def test_get_all_pantries_response_time(benchmark, client):
    result = benchmark(client.get, "/api/pantries")
    assert result.status_code == 200
    assert benchmark.stats["mean"] < 1.0


def test_get_all_under_50_concurrent_users(client):
    CONCURRENT_USERS = 50
    THRESHOLD_SECONDS = 1.0

    def fetch():
        start = time.time()
        r = client.get("/api/pantries")
        return time.time() - start, r.status_code

    with ThreadPoolExecutor(max_workers=CONCURRENT_USERS) as pool:
        futures = [pool.submit(fetch) for _ in range(CONCURRENT_USERS)]
        results = [f.result() for f in as_completed(futures)]

    durations = [d for d, _ in results]
    failures = [d for d, s in results if s != 200]

    durations.sort()
    p95 = durations[int(len(durations) * 0.95)]
    assert not failures, f"{len(failures)} requests failed"
    assert (
        p95 < THRESHOLD_SECONDS
    ), f"95th percentile request took {p95:.2f}s — exceeds {THRESHOLD_SECONDS}s limit"


def test_random_api_under_500_concurrent_users(client):
    CONCURRENT_USERS = 500
    P95_THRESHOLD_SECONDS = 1.0
    AVG_THRESHOLD_SECONDS = 0.1
    STATIC_ENDPOINTS = [
        {"endpoint": "/api/pantries", "identifier": False},
        {"endpoint": "/api/pantries/<ID>", "identifier": True},
        {"endpoint": "/api/pantries/<ID>/hours", "identifier": True},
    ]
    db_entry_ct = len(client.get("/api/pantries").get_json())

    def fetch_random():
        # Generate random GET endpoint to query
        endpoint = STATIC_ENDPOINTS[random.randint(0, len(STATIC_ENDPOINTS) - 1)]
        uri = endpoint["endpoint"]
        if endpoint["identifier"]:
            uri = uri.replace("<ID>", str(random.randint(1, db_entry_ct)))
    
        # Time query
        start = time.time()
        r = client.get(uri)
        return time.time() - start, r.status_code

    with ThreadPoolExecutor(max_workers=CONCURRENT_USERS) as pool:
        futures = [pool.submit(fetch_random) for _ in range(CONCURRENT_USERS)]
        results = [f.result() for f in as_completed(futures)]

    failures  = [d for d, s in results if s != 200]
    assert not failures, f"{len(failures)} requests failed"

    durations = [d for d, _ in results]
    durations.sort()
    p95 = durations[int(len(durations) * 0.95)]
    assert p95 < P95_THRESHOLD_SECONDS, (
        f"95th percentile request took {p95:.2f}s — exceeds {P95_THRESHOLD_SECONDS}s limit"
    )
    assert (sum(durations) / len(durations)) < AVG_THRESHOLD_SECONDS, (
        f"Avg. request took {p95:.2f}s — exceeds {AVG_THRESHOLD_SECONDS}s limit"
    )
