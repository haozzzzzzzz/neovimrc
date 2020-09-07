- Execute init.sh to install dependencies.
- Shell cmd `nvim` enter nvim.
- Vim cmd `:PlugInstall` to install vim plugins.


### clang-format style config
- https://releases.llvm.org/9.0.0/tools/clang/docs/ClangFormatStyleOptions.html
Touch yaml format config file `.clang-format` or `_clang-format` in you project
```
IndentWidth.4
```

### vimspector config
- https://puremourning.github.io/vimspector/configuration.html#exception-breakpoints
- website: https://puremourning.github.io/vimspector-web/
- Here is an hidden file `.vimspectore.json`. For custom purpose, see ./.vimspectore.json.tmpl, create an .vimspector.json for your project.


### youcompleteme senmatic completion
- https://github.com/ycm-core/YouCompleteMe#option-1-use-a-compilation-database
- Add `set(CMAKE_EXPORT_COMPILE_COMMANDS ON)` to CMakeLists.txt, and link the generated 
compilation database to the root of yout project.
