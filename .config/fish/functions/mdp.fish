function md -d 'Generate html for a markdown file'
  set -l markdown_file $argv[1]
  set -l html_file $argv[2]

  set -l config ~/.config/mdp
  set -l header $config/header.html
  set -l footer $config/footer.html

  # TODO: use this
  #set -l stylesheet $config/style.css

  # NOTE: destructive
  cat $header > $html_file
  markdown $markdown_file >> $html_file
  cat $footer >> $html_file
end

function mdp -d 'Generate html for a markdown file and preview in browser'
  set -l markdown_file $argv[1]
  set -l cache_dir ~/.local/share/mdp
  set -l html_file $cache_dir/$markdown_file.html

  md $markdown_file $html_file
  open $html_file
end

