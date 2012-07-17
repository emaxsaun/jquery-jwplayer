## JWPlayer jQuery wrapper

##### Build for better event handling

```javascript
$("#video-area").jwplayer({
	flashplayer: "/jwplayer/player.swf",
	file: 'some/video/file.mp4',
	autoplay: true,
	width: 630,
	height: 480
});

$("#video-area").on('jwplayer:complete', function(event, data){
	// Remove complete event and replay video 
	$(this).off(event).jwplayer('play');
});

```

### Credits

- Built by [Fetch!](http://www.fetch.nl/). 
- Concept and development by [Koen Punt](http://koen.pt/)