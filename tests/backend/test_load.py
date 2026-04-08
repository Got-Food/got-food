import time
from concurrent.futures import ThreadPoolExecutor, as_completed

def test_get_all_pantries_response_time(benchmark, client):
    result = benchmark(client.get, "/api/pantries")
    assert result.status_code == 200
    assert benchmark.stats["mean"] < 1.0 

def test_api_under_50_concurrent_users(client):
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
    failures  = [d for d, s in results if s != 200]

    durations.sort()
    p95 = durations[int(len(durations) * 0.95)]
    print(f"p95: {p95:.2f}s")
    assert not failures, f"{len(failures)} requests failed"
    assert p95 < THRESHOLD_SECONDS, (
        f"95th percentile request took {p95:.2f}s — exceeds {THRESHOLD_SECONDS}s limit"
    )