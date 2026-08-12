window.BoomNative = window.BoomNative || {
  call(action, payload = {}) {
    const message = { action, ...payload };
    const handler = window.webkit?.messageHandlers?.boomNative;
    if (handler) { handler.postMessage(message); return true; }
    return false;
  },
  play(){ return this.call("play"); },
  pause(){ return this.call("pause"); },
  next(){ return this.call("next"); },
  previous(){ return this.call("previous"); },
  setNowPlaying(title, artist, album){ return this.call("setNowPlaying",{title,artist,album}); },
  haptic(){ return this.call("haptic"); }
};
