class MarkupSlim
  # THIS IS FOR MODEL VIEWS - NOT USED
  attr_accessor :markdown_blocks
  attr_accessor :new_blocks
  attr_accessor :text_blocks
  attr_accessor :lines
  attr_accessor :results
  attr_accessor :html

  def initialize(text)
    # unless text.include?('s```')
    #   puts "there are no markup blocks"
    #   # return text
    # end
    @markdown_blocks = []
    @new_blocks = []
    @text_blocks = []
    @results = ""
    @html = ""
    fenced(text)
  end

  def fenced(text)
    @lines = text.split("\n")
    spres = [] #lines starting spre div
    lines.each_with_index do |ln,idx|
      # spre no longer used
      if ln.include?("s```") || ln.include?("e```")
        if ln.include?("s```")
          spres << idx
        else
          # it's a "e```" end of block
          spres << idx
        end
      end
    end

    # start with first and last line id
    # if there are 2 there a 4 element put in pairs with slice
    # puts "WHAT IN PRES #{spres}"
    blocks = spres.each_slice(2).to_a #lines starting spre div
    # puts "WHAT IN blocks #{blocks}"
    make_fence_blocks(blocks,lines)
    merge_blocks(blocks)
  end

  def make_fence_blocks(blocks,lines)
    head1 = "div[data-controller='displayMarked']"
    head2 = "  pre.hidden[data-displayMarked-target='markup'] ```"
    tail =  "  div[data-displayMarked-target='viewer']"

    blocks.each do |b|
      range = b[0]..b[1]
      @markdown_blocks << range.to_a
      spaces =  lines[b[0]].length - lines[b[0]].lstrip.length
      lang = lines[b[0]].strip.split(".")[1]
      lang = 'ruby' if lang.nil?
      h1 = head1.dup.prepend(" " * spaces) 
      h2 = head2.dup.prepend(" " * spaces) << lang 
      blocktail = tail.dup.prepend(" " * spaces)
      thisblock = [h1,h2]
      spaces += 2
      rarr = range.to_a
      # don't need first or last element (spre and epre tags)
      rarr.delete_at(0)
      rarr.delete_at(-1)
      rarr.each do |i|
        thisblock << lines[i].prepend(" " * spaces)
      end
      thisblock << "```".prepend(" " * (spaces + 2))
      thisblock << blocktail
      @new_blocks = @new_blocks << thisblock
    end
  end

  def merge_blocks(blocks)
    first = 0
    line_size = lines.size - 1 #attribute
    new_slim_lines = ""
    blocks.each do |b|
      if b[0] > first
        @text_blocks << [first,b[0] - 1]
        first = b[1]+1
      end
    end
    if first < line_size
      # text after last block
      text_blocks <<[first,line_size]
    end
    all = (blocks + text_blocks).sort_by { |e| e[0] }
    block_types = [] # either t for text or c for code
    all_starts = all.pluck(0)
    block_starts = blocks.pluck(0)
    all_starts.each do |i|
      if block_starts.include?(i)
        block_types << 'c'
      else
        block_types << 't'
      end
    end
    # puts "ALL #{all_starts} B #{block_starts} T #{block_types}"
    text_idx =  0
    block_idx = 0
    code_blocks = (0..10).to_a # limit to 11 code blocks
    block_types.each do |type|
      # puts "C = #{type}"
      if type == 't'
        tb = text_blocks[text_idx]
        tb[0].upto(tb[1]) do |i|
          new_slim_lines << lines[i]+"\n" 
        end
        text_idx += 1
      else
        span = new_blocks[code_blocks[block_idx]].join("\n")
        new_slim_lines << span
        block_idx += 1
      end
      # puts "NEW TEXT #{new_slim_lines[0..50]}"
    end
    @results = new_slim_lines
    @html = Slim::Template.new{ @results }.render.html_safe

  end


end

