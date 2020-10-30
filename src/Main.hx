package;

import js.Browser.*;
import js.Browser;
import js.html.*;
// import js.jquery.*;
// import js.jquery.Helper.*;
import model.constants.App;

/**
 * @author Matthijs Kamstra aka [mck]
 * MIT
 */
class Main {
	var document:js.html.HTMLDocument = js.Browser.document;
	var container:js.html.DivElement;

	public function new() {
		init();
	}

	function init() {
		document.addEventListener("DOMContentLoaded", function(event) {
			console.log('${App.NAME} Dom ready :: build: ${App.getBuildDate()} ');

			// var container = document.getElementById("prop");
			// container.innerHTML = 'html';

			// initHTML();
			loadData();
			initScroll();
		});
	}

	function initHTML() {
		container = document.createDivElement();
		container.id = "example_javascript";
		container.className = "container";
		document.body.appendChild(container);

		var h1 = document.createElement('h1');
		h1.innerText = "Example Javascript";
		container.appendChild(h1);
	}

	function loadData() {
		var url = 'http://ip.jsontest.com/';
		var req = new haxe.Http(url);
		// req.setHeader('Content-Type', 'application/json');
		// req.setHeader('auth', '${App.TOKEN}');
		req.onData = function(data:String) {
			try {
				var json = haxe.Json.parse(data);
				trace(json);
			} catch (e:Dynamic) {
				trace(e);
			}
		}
		req.onError = function(error:String) {
			trace('error: $error');
		}
		req.onStatus = function(status:Int) {
			trace('status: $status');
		}
		req.request(true); // false=GET, true=POST
	}

	function initScroll() {
		// new JQuery('.scroll-to-content').click(function(e) {
		// 	e.preventDefault();
		// 	var anchor = js.Lib.nativeThis.getAttribute("href");
		// 	J('html, body').animate({
		// 		scrollTop: J(anchor.toString()).offset().top
		// 	});
		// });
	}

	static public function main() {
		var app = new Main();
	}
}
