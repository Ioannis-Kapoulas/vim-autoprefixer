# vim-autoprefixer

Adds [autoprefixer](https://github.com/ai/autoprefixer) support to [Vim](http://www.vim.org/).

Copyright (c) 2014 Ioannis Kapoulas

About
-----

With vim-autoprefixer you can use the power of Autoprefixer without leaving vim. Write your CSS and add vendor prefixes automatically using values from [Can I Use](http://caniuse.com/). Autoprefixer utilizes the most recent data from Can I Use to add only necessary vendor prefixes. It also removes old, unnecessary prefixes from your CSS.

vim-autoprefixer plugin works in normal and visual vim mode. Select a block of CSS code in visual mode hit F7 and aply prefixes on it, in normal mode the plugin processes the entire file.

Note that vim-autoprefixer interact with the user and promt for Autoprefixer options, if you don’t set any option and hit Enter vim-aytoprefixer continue with Autoprefixer default settings.


</br>
Installation
------------

vim-autoprefixer requires `node.js` and `npm` utility. If you have `node.js` intalled in your system skip the **step 1**.

</br>
**STEP 1** -->`Node.js` installation

On **Ubuntu** you can install it with:

```
sudo add-apt-repository ppa:chris-lea/node.js
```
```
sudo apt-get update
```
```
sudo apt-get install nodejs
```
Make sure you’ve got the very most recent release of npm:

```
sudo npm install npm -g
```
On **MacOSX** you can install the binary [node.js](http://nodejs.org/dist/v0.10.30/node-v0.10.30.pkg) or with brew:

```
brew install node
```
</br></br>
**STEP 2** -->`autoprefixer` installation

On **Linux** and **MacOSX** run in a terminal:

```
sudo npm install --global autoprefixer
```
Test it. Open a terminal paste this code and hit enter:

```
echo '.mi{transition: transform 1s;} a{box-sizing: border-box;}' > test.css
```

Run the test:

```
autoprefixer test.css
```
Get help:

```
autoprefixer -h
```
On **Ubuntu** if you get errors try:

```
sudo apt-get install nodejs-legacy
```
</br></br>
**STEP 3** -->`vim-aytoprefixer.vim` installation

You can install the plugin manually just extract the zip file and place the content files in your .vim subfolders.


Place in ~/.vim/plugin/`vim-autoprefixer.vim`</br>
and in ~/.vim/doc/`vim-autoprefixer.txt`

 Or you can install it with [Vundle](http://github.com/gmarik/vundle) or [Pathogen](https://github.com/tpope/vim-pathogen)

</br>
Usage
-----

### Add vendor prefixes in entire file
First of all open an existing CSS file or write some from scratch:

```css
.myclass {
    -webkit-border-radius: 5px;
    border-radius: 5px;
}

a {
    display: flex;
}
```
* -1- Press ESC to set vim in normal mode.
* -2- Press F7
* -3- Prefixmycss executing and waiting for options

```bash
Add vendor prefixes to CSS rules
Hit ENTER or you can add Autoprefixes CLI Options
Enter options :
```
* -4- Just press ENTER and view your buffer to change in this:

```css
.myclass {
    border-radius: 5px;           <-- removed unecessary vendor prefix
}

a {
    display: -webkit-box;         <--
    display: -webkit-flex;           |- vendor prefixes added
    display: -ms-flexbox;         <--
    display: flex;
}
```
Alternative in step -3- you can set some options:

```bash
Add vendor prefixes to CSS rules
Hit ENTER or you can add Autoprefixes CLI Options
Enter options :-b "last 2 versions, > 1%" 
```
or:

```bash
Add vendor prefixes to CSS rules
Hit ENTER or you can add Autoprefixes CLI Options
Enter options :-b "last 11 versions"
```
Your CSS code now prefixed like this:

```css
.myclass {
    -webkit-border-radius: 5px;
    border-radius: 5px;
}

a {
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
}
```
</br>
### Add vendor prefixes in selected items
Like the previus example write some CSS code:

```css
a {
    box-sizing: border-box;
}

.myclass {
    box-sizing: border-box;
}

```
* -1- Press ESC to exit insert mode.
* -2- Press v and select the entire class or use your mouse.
* -3- Press F7
* -4- Set some options and hit ENTER
Vendor prefixes added only in the class:

```css
a {
    box-sizing: border-box;
}

.myclass {
    -moz-box-sizing: border-box;
         box-sizing: border-box;
}

```
</br>
ToDo
----

- [ ] Vim Helpfile
- [x] Supporting more Autoprefixer options

License
-------

#### The [MIT](https://github.com/Ioannis-Kapoulas/vim-autoprefixer/blob/master/LICENSE) License (MIT)
