


chrome.runtime.sendMessage({ type: 'screenshot' }, (response) => {
  const img = new Image();
  img.src = response.screenshotUrl;
  document.body.appendChild(img);
});