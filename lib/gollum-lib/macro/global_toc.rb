module Gollum
  class Macro
    class GlobalTOC < Gollum::Macro
      def render(title = "Global Table of Contents")
        pages = @wiki.pages.sort do |a,b|
          if a.path.include?('/') and b.path.include?('/') then
            a.path <=> b.path
          elsif a.path.include?('/') then
            1
          elsif b.path.include?('/') then
            -1
          else
            a.path <=> b.path
          end
        end
        Gollum::FileView.new(pages, {:collapse_tree => true}).render_files.gsub('href="', 'href="/')
      end
    end
  end
end
