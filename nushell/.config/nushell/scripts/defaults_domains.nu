def main [search_string: string = "com.apple", show_contents: bool = false] {
    defaults domains
        | decode utf-8
        | split row ','
        | str trim
        | each { |domain| { domain: $domain } }
        | where domain has $search_string
        | each { |row|
            let output = (defaults read $row.domain | complete);
            let stdout = ($output | get stdout | str trim);
            let stderr = ($output | get stderr | str trim);

            # Skip domains that actually do not exist
            if ($stderr | str contains "does not exist") {
                null
            } else {
                if $show_contents {
                    let contents = $stdout
                    { domain: $row.domain, contents: $contents }
                } else {
                    { domain: $row.domain }
                }
            }
        }
        | compact
        | table
}

