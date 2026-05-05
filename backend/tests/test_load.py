from locustfile import APIUser
from locust.env import Environment


def test_benchmark_get_all_pantries_response_time(benchmark, client):
    AVG_THRESHOLD_S = 1.0

    result = benchmark(client.get, "/api/pantries")
    assert result.status_code == 200
    assert (
        benchmark.stats["mean"] < AVG_THRESHOLD_S
    ), f"Average response time was {benchmark.stats["mean"]}s, which exceeded the threshold of {AVG_THRESHOLD_S}s."


def test_api_correctness_under_50_concurrent_users(live_app):
    CONCURRENT_USERS = 50
    USER_SPAWN_RATE = 50
    TEST_DURATION_S = 1

    # Execute Locust load test
    env = Environment(user_classes=[APIUser])
    env.create_local_runner()
    env.runner.start(CONCURRENT_USERS, spawn_rate=USER_SPAWN_RATE)
    env.runner.greenlet.join(timeout=TEST_DURATION_S)
    env.runner.stop()

    assert (
        env.stats.total.num_failures == 0
    ), f"ERROR: {env.stats.total.num_failures}/{env.stats.total.num_requests} ({env.stats.total.fail_ratio:.2f}) tests failed, instead of the expected 0."


def test_api_performance_under_500_concurrent_users(live_app, capsys):
    CONCURRENT_USERS = 500
    USER_SPAWN_RATE = 50
    TEST_DURATION_S = 1
    P95_THRESHOLD_MS = 1000
    AVG_THRESHOLD_MS = 200

    # Execute Locust load test
    env = Environment(user_classes=[APIUser])
    env.create_local_runner()
    env.runner.start(CONCURRENT_USERS, spawn_rate=USER_SPAWN_RATE)
    env.runner.greenlet.join(timeout=TEST_DURATION_S)
    env.runner.stop()

    summary = f"""
Load Test Results
-----------------
Requests:     {env.stats.total.num_requests}
Failures:     {env.stats.total.num_failures}
Fail Ratio:   {env.stats.total.fail_ratio:.2%}
Min (ms):     {env.stats.total.min_response_time:.2f}
Avg (ms):     {env.stats.total.avg_response_time:.2f}
Max (ms):     {env.stats.total.max_response_time:.2f}
p50 (ms):     {env.stats.total.get_response_time_percentile(0.50):.2f}
p95 (ms):     {env.stats.total.get_response_time_percentile(0.95):.2f}
p99 (ms):     {env.stats.total.get_response_time_percentile(0.99):.2f}
RPS:          {env.stats.total.total_rps:.2f}
"""

    # Forcefully write results to stdout, ignoring pytest suppression
    with capsys.disabled():
        print("\n", summary)
        if env.stats.total.num_failures > 0:
            print("\nLoad Test Errors")
            print("----------------")
            for _, entry in env.stats.errors.items():
                print(
                    f"{entry.method} {entry.name}: {entry.error} ({entry.occurrences} times)",
                    flush=True,
                )

    p95 = env.stats.total.get_response_time_percentile(0.95)
    avg = env.stats.total.avg_response_time

    assert (
        p95 < P95_THRESHOLD_MS
    ), f"95th percentile request took {p95:.2f}s — exceeds {P95_THRESHOLD_MS}s limit"
    assert (
        avg < AVG_THRESHOLD_MS
    ), f"Avg. request took {avg}s — exceeds {AVG_THRESHOLD_MS}s limit"
