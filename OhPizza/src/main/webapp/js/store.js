/**
 * store.js
 */

function mapOpen() {
	// location.href = 'map.jsp?lat=' + center.lat + '&lng=' + center.lng; 
	window.open('map.jsp?lat=' + store.latitude + '&lng=' + store.longitude); // 새 창(탭)에 열림
}
