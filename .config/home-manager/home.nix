{ config, pkgs, ... }: {
  
  home.packages = with pkgs; [
    jetbrains-mono
    font-awesome
  ];
  
  fonts.fontconfig.enable = true;
}

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    
    extraConfig = ''
      set number
      set relativenumber
      set tabstop=2
      set shiftwidth=2
      set expandtab
      set mouse=a
    '';
    
    plugins = with pkgs.vimPlugins; [
      nerdtree
      nerdtree-git-plugin
      
      vim-nix  
      vim-fugitive
      vim-airline
      vim-devicons
    ];
    
    extraLuaConfig = ''
      vim.cmd('autocmd StdinReadPre * let s:std_in=1')
      vim.cmd('autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe "NERDTree" argv()[0] | wincmd p | ene | exe "cd ".argv()[0] | endif')
      
      vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFocus<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', {noremap = true, silent = true})
      
      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeMinimalUI = 1
      vim.g.NERDTreeDirArrows = 1
      vim.g.NERDTreeWinSize = 35
    '';
  };
  
  home.packages = with pkgs; [
    nerdfonts
  ];
