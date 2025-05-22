return {
    "nvim-java/nvim-java",
    enabled = false,
    config = function()
        require("java").setup({
            jdtls = {
                version = "v1.46.1",
            },
        })
    end,
}
