var confidence = document.querySelector("#confidence");
var value = document.querySelector("#confidenceValue");
var concept = document.querySelector("#concept");
var resultField = document.querySelector("#videoResult")
var search = document.querySelector("#search");
var div = document.querySelector("#div");
  div.style.visibility = "hidden";

function updateValue() {
  value.innerHTML = confidence.value;
}

updateValue();

function getVideos() {

  if (concept.value == "") return;

  let url = `http://localhost:3000/videos/` + concept.value + "?minconfidence=" + confidence.value;
  console.log(url);

  new Promise((resolve, reject) => {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", url, true);
    xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
    xhr.setRequestHeader('Content-Type', 'text/html');
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          resolve(JSON.parse(this.responseText));
        } else {
          reject();
        }
      }
    }
    xhr.send();
  })
  .then(
    (result) => showImageResults(result),
    (error) => console.log(error)
  )
}

function showImageResults(json) {
  console.log(json);

  div.style.visibility = "visible";
  return new Promise((resolve, reject) => {
      let htmlOut = "";
      Object.keys(json).forEach(
        (key) => {
          htmlOut += `<img src="${json[key].keypath}"
                           alt="video: ${json[key].videoid}, confidence= ${json[key].confidence}">`;
        }
      );
      resultField.innerHTML = htmlOut;
      resolve();
    });
}

document.querySelector("#form").addEventListener('submit', function(e) {
    getVideos();
    e.preventDefault();
}, false);
