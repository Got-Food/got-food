import validators as val
import requests


def test_all_links_valid(client):
    # Get initial pantries from DB
    response = client.get("/api/pantries")
    assert response.status_code == 200

    # Ensure all pantries have valid URLs. Use for-each assert to receive
    # error information per-URL.
    data = response.get_json()
    for pantry in data:
        try:
            assert val.url(pantry["url"])
        except AssertionError as e:
            print(f"ERROR: URL {pantry["url"]} invalid; {e}")
            raise e


def test_all_links_alive(client):
    # Codes in client/server error range that do not indicate dead links
    ERROR_CODE_EXCEPTIONS = {405, 406, 429, 503}

    # Ensure all pantry URLs are functional. Use browser-like headers to avoid
    # 403 blocks.
    HEADERS = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
        "Accept-Language": "en-US,en;q=0.9",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
        "Connection": "keep-alive",
    }

    # Get initial pantries from DB
    response = client.get("/api/pantries")
    assert response.status_code == 200

    data = response.get_json()
    for pantry in data:
        response = requests.get(pantry["url"], headers=HEADERS)
        assert (
            response.status_code < 400 or response.status_code in ERROR_CODE_EXCEPTIONS
        ), f"ERROR: URL {pantry["url"]} is dead, check manually."
