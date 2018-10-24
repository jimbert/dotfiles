class Git < Thor
  desc 'extract BASE_BRANCH TARGET_BRANCH PATHS', 'Extracts changes from the current branch to a new target branch'
  def extract(base_branch, target_branch, paths)
    # git d origin/master -p -- Gem* bin > patch; g co master; g co -b add-spring; g apply patch; rm patch; g add .; g commit -m 'Add spring and update binstubs'                                                [±features/add-ups-generator ✓]
    temp_file = "#{rand 999999}.patch"
    `git diff #{base_branch} -p -- #{paths} > #{temp_file}`
    `git checkout #{base_branch}`
    `git checkout -b #{target_branch}`
    `git apply #{temp_file}`
    `rm #{temp_file}`
    `git add .`
    exec('git commit')
  end
end
