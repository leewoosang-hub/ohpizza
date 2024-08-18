package co.ohpizza.common;

public class AppTest {
	public static void main(String[] args) {
		String location = "대구광역시 중구 중앙대로 403";
		Float[] coords = GeoPoint.findGeoPoint(location);

		System.out.println(location + ": " + coords[0] + ", " + coords[1]);
		
	}
}
