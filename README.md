![StateGenerator](https://raw.githubusercontent.com/marciniwanicki/StateGenerator/develop/Docs/logo.jpg)

[![Build Status](https://travis-ci.org/marciniwanicki/StateGenerator.svg?branch=develop)](https://travis-ci.org/marciniwanicki/StateGenerator)
[![MIT License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/marciniwanicki/StateGenerator/blob/master/LICENSE)

StateGenerator is a Swift library that allows to quickly simulate different model states for UI testing purposes while backend or domain logic is not ready yet.

## RandomImageGenerator

<table>
   <tr>
      <th width="70%">Code</th>
      <th width="30%">Preview</th>
   </tr>
   <tr>
      <td>
         <div class="highlight highlight-source-swift">
<pre>
let size = CGSize(width: 400, height: 600)
let delay: TimeInterval = 1.0
let imageGenerator = G.randomImage(size: size)
simulator
   .begin()
   .wait(delay)
   .perform(imageGenerator) { [weak view] in view?.setImage1($0) }
   .wait(delay)
   .perform(imageGenerator) { [weak view] in view?.setImage2($0) }
   .wait(delay)
   .perform(imageGenerator) { [weak view] in view?.setImage3($0) }
   .wait(delay)
   .perform(imageGenerator) { [weak view] in view?.setImage4($0) }
   .run(repeats: Int.max)</pre>
         </div>
      </td>
      <td>
         <img src="https://raw.githubusercontent.com/marciniwanicki/StateGenerator/develop/Docs/RandomImageGenerator.gif">
      </td>
   </tr>
</table>

As `RandomImageGenerator` is a `SingleValueGenerate`, the following lines give exactly the same results.
```Swift
.perform(imageGenerator) { [weak view] in view?.setImage1($0) }
.perform { [weak view] in view?.setImage1(imageGenerator.generate()) }
```

## IteratorGenerator 

<table>
   <tr>
      <th width="70%">Code</th>
      <th width="30%">Preview</th>
   </tr>
   <tr>
      <td>
         <div class="highlight highlight-source-swift">
<pre>
enum Symbol: String {
    case grinning = "😀"
    case summer = "⛄"
    case monkey = "🐵"
    case thumbsup = "👍"
}

simulator
    .begin()
    .perform((1...3).reversed(), 1) { [weak view] in view?.setText(String($0)) }
    .perform { [weak view] in view?.setText("🙌\nDONE") }
    .wait(2.0)
    .perform([UIColor.orange, .red, .purple], 2.0) { [weak view] in view?.setTextColor($0) }
    .perform([Symbol.grinning, Symbol.summer, Symbol.monkey, Symbol.thumbsup], 0.5) {
        [weak view] in view?.setText($0.rawValue)
    }
    .run()</pre>
         </div>
      </td>
      <td>
         <img src="https://raw.githubusercontent.com/marciniwanicki/StateGenerator/develop/Docs/IteratorGenerator.gif">
      </td>
   </tr>
</table>
