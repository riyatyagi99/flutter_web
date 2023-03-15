/*chrome.action.onClicked.addListener((tab) => {
  chrome.scripting.executeScript({
    target: { tabId: tab.id },
    files: ['contentScript.js']
  });
});

chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
  if (message.type === 'screenshot') {
    chrome.tabs.captureVisibleTab((screenshotUrl) => {
      sendResponse({ screenshotUrl });
    });
    return true;
  }
});*/


chrome.browserAction.onClicked.addListener(function(tab) {
  chrome.tabs.captureVisibleTab(null, {"format": "png"}, function(imageDataUrl) {
    // Send the captured image data to the content script
    chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {
      chrome.tabs.sendMessage(tabs[0].id, {imageDataUrl: imageDataUrl});
    });
  });
});