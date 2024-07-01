- start creating a remote version of the config (for use in ssh)

- integrate obsidian.nvim in a separate branch

- possible git plugings:
    - fugitive
    - neogit.nvim
    - gitsigns.nvim
    - diffview.nvim
    - gitconflict.nvim
    - gitblame.nvim
    - octo.nvim
    - git-worktree.nvim

    - lazygit.nvim: this seems to be a full on application that is accessible
    through neovim
    the application in question being lazygit

- imgclip.nvim

- nable.nvim

- movement like plugins:
    - leap.nvim
    - flash.nvim
    - hop.nvim

- debugging stuff with
    - trouble.nvim
    - neotest
    - nvim-dap
    - telescope.nvim dap extension

- comment.nvim

- distant.nvim

- set up hydra.nvim for notebook functionality
    [as per here](https://github.com/quarto-dev/quarto-nvim/wiki/Integrating-with-Hydra)
    just remember that, in your [file](/home/kalyan/.config/nvim/after/queries/markdown/textobjects.scm), you have:

    ```scm
    ;extends

    (fenced_code_block (code_fence_content) @code_cell.inner) @code_cell.outer
    ```

    that is, you have a `@code_cell.inner`, rather than a `@class.inner`, or something like that

- in lay hints ig
