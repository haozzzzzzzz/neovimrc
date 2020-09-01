" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " .h.in是cmake 请求头配置模版文件, 会被识别为.h，会被codefmt格式化，造成错误
  " 习惯上使用.h_in代替.h.in，避免因为没有此filetype.vim，造成格式化后的错误
  au! BufRead,BufNewFile *.h.in         setfiletype ignored 
augroup END
