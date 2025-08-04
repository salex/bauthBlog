import { Controller } from "@hotwired/stimulus"
import {marked} from 'marked'
import hljs from 'highlight.js'

export default class extends Controller {

  static targets = ["viewer","markup","form","content"]

  connect() {
    // this.displayMarkdown()
    this.trigger()
    // console.log("IF FOund marked")

  }

  displayMarkdown(){
    var html = marked(this.contentTarget.value, {sanitized: true, highlight: function(code, language) {
    const validLanguage = hljs.getLanguage(language) ? language : 'plaintext';
    return hljs.highlight(code, {language: validLanguage, ignoreIllegals: true }).value
    }})
    html = html.replace(/\<code class=\"/g,'<code class="hljs ')
    html = html.replace(/\\t/g,'&emsp;')
    // html.gsub(/\n/, "\n\n"
    this.contentTarget.innerHTML = html
  }

  convertToMarkdown(event) {
    // changed to add class hljs to all code tage
    var html = marked(event.target.value, {sanitized: true, highlight: function(code, language) {
      const validLanguage = hljs.getLanguage(language) ? language : 'plaintext';
      // console.log(validLanguage)
      // console.log(`CTM Valid Langueage = ${validLanguage}`)
      return hljs.highlight(code, {language: validLanguage, ignoreIllegals: true }).value
    }})
    html = html.replace(/\<code class=\"/g,'<code class="hljs ')
    html = html.replace(/\\t/g,'&emsp;')
    this.viewerTarget.innerHTML = html
    // this.contentTarget.value = this.markupTarget.value

  }

  trigger(){
    var chg = new Event('change',{ bubbles: true })
    // chg.preventDefault()
    this.markup.dispatchEvent(chg)
    // marked does not pick up js insertions, trigger a change
  }

  header(){
    var hd = event.target.value
    // console.log(hd)
    if (hd == 'h1'){
      this.h1()
    } else if(hd == 'h2'){
      this.h2()
    } else if(hd == 'h3'){
      this.h3()
    } else if(hd == 'h4'){
      this.h4()
    } else if(hd == 'h5'){
      this.h5()
    } else if(hd == 'h6'){
      this.h6()
    } else {
      
    }

  }
  h1() {
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    this.insert('\n# '+selected)
  }

  h2() {
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    this.insert('\n## '+selected)
  }

  h3() {
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    this.insert('\n### '+selected)
  }

  h4() {
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    this.insert('\n#### '+selected)
  }

  h5() {
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    this.insert('\n##### '+selected)
  } 

  h6() {
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    this.insert('\n###### '+selected)
  } 

  bold() {
    this.wrap('**')
  }

  italic() {
    this.wrap('*')
  }

  italicBold() {
    this.wrap('***')
  }

  backTick(){
    this.wrap('`')
  }

  ul() {
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    selected = "\n* " + selected.replace(/\n/g,"\n* ")
    this.insert(selected)
  }

  ol() {
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    selected = "\n1. " + selected.replace(/\n/g,"\n1. ")
    this.insert(selected)
  }

  fencedCode(){
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    selected = "```lang\n " + selected + "\n```"
    this.insert(selected)
  }

  anchor(){
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    selected = "[" + selected + "]" + '(http://...)'
    this.insert(selected)
  }

  image(){
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    selected = "![" + selected + "]" + '(path/to/img.jpg)'
    this.insert(selected)
  }

  backQuote(){
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    // selected = "\n     " + selected.replace(/\n/g,"\n     ")
    this.insert('>' + selected)
  }

  em(){
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    this.insert('&emsp;' + selected)
  }

  sr(){
    // add 2 space to every selected line
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    var lines = selected.split("\n")
    for(var i = 0;i < lines.length;i++){
      lines[i] = '  ' + lines[i]
    }
    var str = lines.join('\n')
    this.insert(str)
  }

  sl(){
    // remove leading 2 space to every selected line
    var selected = this.markup.value.substring(this.range.start,this.range.end)
    var lines = selected.split("\n")
    for(var i = 0;i < lines.length;i++){
      lines[i] = lines[i].replace(/^  /, '')
    }
    var str = lines.join('\n')
    this.insert(str)
  }

  get markup() {
    return this.markupTarget
  }

  get range(){
    return this.getInputSelection(this.markup)
  }

  insert(selected){
    const len = this.markup.value.length
    this.markup.value = this.markup.value.substring(0,this.range.start) + selected + this.markup.value.substring(this.range.end,len)
    this.trigger()
  }

  wrap(wrapper){
    const len = this.markup.value.length
    const wrapie = wrapper + this.markup.value.substring(this.range.start,this.range.end) + wrapper
    this.markup.value = this.markup.value.substring(0,this.range.start) + wrapie + this.markup.value.substring(this.range.end,len)
    this.trigger()
  }

  getInputSelection(el) {
    var start = 0, end = 0, normalizedValue, range, textInputRange, len, endRange;

    if (typeof el.selectionStart == "number" && typeof el.selectionEnd == "number") {
        start = el.selectionStart;
        end = el.selectionEnd;
    } else {
        range = document.selection.createRange();

        if (range && range.parentElement() == el) {
            len = el.value.length;
            normalizedValue = el.value.replace(/\r\n/g, "\n");
            // Create a working TextRange that lives only in the input
            textInputRange = el.createTextRange();
            textInputRange.moveToBookmark(range.getBookmark());
            // Check if the start and end of the selection are at the very end
            // of the input, since moveStart/moveEnd doesn't return what we want
            // in those cases
            endRange = el.createTextRange();
            endRange.collapse(false);

            if (textInputRange.compareEndPoints("StartToEnd", endRange) > -1) {
                start = end = len;
            } else {
                start = -textInputRange.moveStart("character", -len);
                start += normalizedValue.slice(0, start).split("\n").length - 1;

                if (textInputRange.compareEndPoints("EndToEnd", endRange) > -1) {
                    end = len;
                } else {
                    end = -textInputRange.moveEnd("character", -len);
                    end += normalizedValue.slice(0, end).split("\n").length - 1;
                }
            }
        }
    }

    return {
        start: start,
        end: end
    };
  }

} 