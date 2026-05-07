from app.utils import get_coordinates

def test_get_coordinates():
    res = get_coordinates("3625 Potomac Ave", "Alexandria", "VA", "22305")
    assert res is not None
    
    lat, lon = res
    assert lat == 38.838026363222
    assert lon == -77.0487012623659