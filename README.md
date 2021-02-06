# komapainter

Komapainter creates PNG images of Shogi pieces (koma). It is inspired by Masafumi Yokoyama's [Ruby gem](https://github.com/myokoym/shogi_koma).

This package is a tale of a programmer's hubris and laziness...

## How to Use

Assuming the program is installed somewhere in your PATH, usage is simple:

```
> komapainter -n 飛車 -o rook.png
```

The first argument is the name of the piece whose image you want to generate. `Komapainter` supports 1 or 2 character piece names. If the name you supply is more than 2 characters long, the first and last character will appear in the image.

The second argument is the name of the file to which the image should be saved. If the file already exists, it will be overwritten.

Finally, `komapainter` supports a `-p` (*promoted*) option which will write the piece name in red.

`Komapainter` supports short and long option names. Try

```
komapainter -h
```

for more details.

### Current Bug Warning

Currently the images are saved in the wrong orientation. You will need to rotate them 180° and flip horizontally. You can do this using the standard `Preview.app` or almost any image manipulation program.

### Examples

```
> komapainter -n 飛車 -o hisha.png
```

<img src="https://github.com/profburke/komapainter/blob/main/samples/hisha.png" width="100">

```
> komapainter -p -n と -o tokin.png
```

<img src="https://github.com/profburke/komapainter/blob/main/samples/tokin.png" width="100">

```
> komapainter -n 王将 -o oushou.png
```

<img src="https://github.com/profburke/komapainter/blob/main/samples/oushou.png" width="100">


## How to Install

`Komapainter` requires Swift 5.3 or greater. 

**Note:** `komapainter` uses Apple's `CoreGraphics` and `CoreText` libraries. So, although Swift will run on Linux and other systems, you will not be able to compile the program on anything other than a computer running macOS.

After cloning this repository, `cd` to the newly created directory and enter the command:

```
> make install
```

This will compile the program and copy it to `/usr/local/bin`. You need to have write permissions for the destination.

## How to Contribute

Thank you for taking the time to contribute!

There are many ways to contribute in addition to submitting code. Bug reports, feature suggestions, a logo for the project, and improvements to documentation are all appreciated.

##### Bug Reports and Feature Suggestions

Please submit bug reports and feature suggestions by creating a [new issue](https://github.com/profburke/komapainter/issues/new). If possible, look for an existing [open issue](https://github.com/profburke/komapainter/issues) that is related and comment on it.

When creating an issue, the more detail, the better. For bug reports in partciular, try to include at least the following information:

* The application version
* The operating system (macOS, Windows, etc) and version
* The expected behavior
* The observed behavior
* Step-by-step instructions for reproducing the bug
* Screenshots for GUI issues


##### Pull Requests

Ensure the PR description clearly describes the problem and solution. It should include the relevant issue number, if applicable.


##### Documentation Improvements

Preferably, submit documentation changes by pull request. However, feel free to post your changes to an [issue](https://github.com/profburke/komapainter/issues/new) or send them to the project team.


<!-- ### Credits -->

## License

This project is licensed under the BSD 3-Clause License. For details, please read the [LICENSE](https://github.com/profburke/komapainter/blob/master/LICENSE) file.
