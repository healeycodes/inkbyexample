const code = [...document.querySelectorAll(".program .code")]
  .map((e) => e.innerText)
  .join("")
  .replaceAll("\n\n\n", "\n");

const link = `<a href="https://play.dotink.co/?code=${encodeURIComponent(
  code
)}">
<img
  title="Run code"
  src="pen-16x16.png"
  srcset="pen-32x32.png 2x"
  class="run"
/>
</a>`;

const elem = document
  .querySelector(".program")
  .querySelectorAll("tr")[1]
  .querySelector(".code");
elem.innerHTML = link + elem.innerHTML;
