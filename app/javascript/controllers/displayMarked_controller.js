import { Controller } from "@hotwired/stimulus"
import {marked} from 'marked'
import hljs from 'highlight.js'

export default class extends Controller {

  static targets = ["viewer","markup"]

  connect() {
    // console.log("connected")
    this.displayMarkdown()
  }

  displayMarkdown(){
    var html = marked(this.markupTarget.value, {sanitized: true, highlight: function(code, language) {
    const validLanguage = hljs.getLanguage(language) ? language : 'plaintext';
    // console.log(`DM Valid Langueage = ${validLanguage}`)
    return hljs.highlight(code, {language: validLanguage, ignoreIllegals: true }).value
    }})
    html = html.replace(/\<code class=\"/g,'<code class="hljs ')
    this.viewerTarget.innerHTML = html
  }
  // THIS WAS PROBLEM ONE USED value THE OTHER innerHTML on first line
  // displayMarkdown(){
  //   var html = marked(this.markupTarget.innerHTML, {sanitized: true, highlight: function(code, language) {
  //   const validLanguage = hljs.getLanguage(language) ? language : 'plaintext';
  //   // console.log(`DM Valid Langueage = ${validLanguage}`)
  //   return hljs.highlight(code, {language: validLanguage, ignoreIllegals: true }).value
  //   }})
  //   html = html.replace(/\<code class=\"/g,'<code class="hljs ')
  //   // html = html.replace(/\\t/g,'&emsp;')

  //   this.viewerTarget.innerHTML = html
  // }

} 
