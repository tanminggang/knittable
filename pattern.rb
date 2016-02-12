class Pattern

  attr_accessor :csv_path
  attr_accessor :data # multidimensional array of 1's and 0's

  def generate
    raise 'Path to CSV file or csv string is required' if @csv_path.nil? && @data.nil?
    @data = CSV.read(@csv_path) if @data.empty?
    results = []

    stitch = 'knit'
    # color = 'white'
    stitch_count = 0
    previous_cell = nil
    row_count = 0
    @data.each do |row|

      column_count = row.length
      row.each_with_index do |cell, current_column|
        raise 'Cells must be populated with 0 (Knit) or 1 (Purl)' if cell != '1' && cell != '0'

        # if cell is the same as previous cell
        if cell != previous_cell
          stitch_count += 1
          # increment stitch count
        end
        # else
        #   reset stitch count = 0
        #   update stitch to opposite stitch
        # end


        stitch_count += 1
        if current_column == column_count
          # write to results array
          results[row_count] = [{row: row_count, stitch: stitch, stitch_count: stitch_count}]
         end






        # # if we're changing from one stitch to another
        # if cell != previous_cell && row_count != 0
        #   if results[row_count].nil?
        #     results[row_count] = [{row: row_count, stitch: stitch, stitch_count: stitch_count}] unless stitch_count == 0
        #   else
        #     results[row_count].push({row: row_count, stitch: stitch, stitch_count: stitch_count}) unless stitch_count == 0
        #   end
        #   if stitch == 'knit'
        #     color = 'blue'
        #     stitch = 'purl'
        #   else
        #     color = 'white'
        #     stitch = 'knit'
        #   end
        #   stitch_count = 0
        #   previous_cell = cell
        # end
        #
        # # image = image + "<div style='width:10px; height: 10px; display: inline-block; background-color: #{color};'>&nbsp;</div>"
        # stitch_count += 1
      end
      # if results[row_count].nil?
      #   results[row_count] = [{row: row_count, stitch: stitch, stitch_count: stitch_count}] unless stitch_count == 0
      # else
      #   results[row_count].push({row: row_count, stitch: stitch, stitch_count: stitch_count}) unless stitch_count == 0
      # end
      # stitch = 'knit'
      # stitch_count = 0
      # previous_cell = 1
      #
      # if row_count.odd?
      #   #reverse array
      #   results[row_count].reverse!
      #   results[row_count].each do |group|
      #     if group[:stitch] == 'knit'
      #       group[:stitch] = 'purl'
      #     else
      #       group[:stitch] = 'knit'
      #     end
      #   end
      # end
      # row_count = row_count + 1
    end
    results
  end
end