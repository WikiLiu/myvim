# 我的vim配置
	暂时就这样列 表格以后再改  

![myvim](/vim.png)

## clang 环境
apt install libstdc++-12-dev

## 快捷键 leader给了空格

* `<leader>md` :浏览器预览makedown & readme
* `C-s` :保存
* `C-q` :退出
* `<tab>` :insert模式补全

### airline
* `<tab>`/`[b`/`<leader>-` :普通模式切换buffers
- `<S-tab>`/`]b`/`<leader>=` :反向
- `<leader>0` :turn prev buffer
- `<leader>1` :跳转number bufer
- `<leader>q` :退出当前buffers
- `<leader>bc` :Buffer Close
- `<leader>bo` :Buffer Close Other

### 目录树
* `<F2>` :打开/关闭目录树

### [leaderf](https://github.com/Yggdroot/LeaderF)
- `<leader>ff` :普通搜索Find File
- `<leader>fb` :Find Buffer
- `<leader>fc` :Find FunCtion
- `<leader>ft` :Find Tag
- `<leader>fbt` :Find Buffer Tag
- `<leader>fh` :Find Help
- `<leader>fg` :Find Grep
- leaderf中很多操作快捷按键


### [coc](https://github.com/neoclide/coc.nvim)
- `C-g` :确认修改 相当于git中的commit
- `C-g`h :撤回修改
- `C-@` :coc refresh
- `[g` :prev fault
- `]g` :next fault
- `gd` :Goto Definition
- `gt` :Goto type 
- `gi` :Goto implementation
- `gr` :Goto use References
- `S` :Show documentation
- `rn` :ReName
- `cf` :Coc Format

- `C-f` :Front scroll
- `C-b` :Back scroll
- Mappings for CocList <space><space> 具体可见coc文档

### [tagis](https://github.com/skywind3000/gutentags_plus)
	这个不好用 建议用coc自带的跳转将键盘映射c改为了g 
- `C-]` :上一个Tags
- `C-t` :下一个Tags
- `<leader>gs` :Find Symbol
- `<leader>gc` :Find function







