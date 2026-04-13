return {
    -- Specify the command to start the language server
    cmd = { "sql-language-server", "up", "--method", "stdio" },
    filetypes = { "sql" },
}
