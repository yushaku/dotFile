# config of vimium extention

## how to use

Navigating the current page

```txt
?       show the help dialog for a list of all available keys
h       scroll left
j       scroll down
k       scroll up
l       scroll right
gg      scroll to top of the page
G       scroll to bottom of the page
d       scroll down half a page
u       scroll up half a page

f       open a link in the current tab
F       open a link in a new tab

r       reload

yy      copy the current url to the clipboard
yf      copy a link url to the clipboard

gf      cycle forward to the next frame
gF      focus the main/top frame

gu      go up one level in the URL hierarchy
gU      go up to root of the URL hierarchy

ge      edit the current URL
gE      edit the current URL and open in a new tab

i       enter insert mode
v       enter visual mode; use p/P to paste-and-go, use y to yank
c       enter caret mode, move cursor around and select text with `v`
```

Navigating to new pages:

```txt
J       go back in history
K       go forward in history
H       go one tab left
L       go one tab right

o       Open URL, bookmark, or history entry
O       Open URL, bookmark, history entry in a new tab

b       Open bookmark
B       Open bookmark in a new tab
```

Using find:

```txt
/       enter find mode -- type your search query and hit enter to search, or Esc to cancel
n       cycle forward to the next find match
N       cycle backward to the previous find match
```

## Excluded URLs and keys

- https?://www.youtube.com: [i t f l k j]

## Custom key mappings

- map z LinkHints.activateMode
- map t Vomnibar.activateTabSelection
- map J goBack
- map K goForward
- map H previousTab
- map L nextTab
- map <c-d> scrollPageDown
- map <c-u> scrollPageUp
- map m Marks.activateCreateMode swap
- map ' Marks.activateGotoMode swap
- map i focusInput

## Custom search engines

- b: https://www.bing.com/search?q=%s Bing
- y: https://you.com/search?q=%s You
