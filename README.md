babelio-pages
=============

Stats on your Babelio exported data


What is Babelio ?
-----------------
[Babelio](www.babelio.com) is a french web application which helps you to keep your readings up to date and share your thought with other readers.

Why babelio-pages ?
-------------------
Babelio tells me how many books I've read. And It's great. But I was asking myself how many pages it is ?<br/>
And there is babelio-pages ! Bringing you some stats on your readings.

How does it work ?
------------------

You need to have the ruby language installed and the script babelio-pages.rb need to be executable.

From [Babelio](www.babelio.com) website, export your library into the same directory as babelio-pages.rb.

From the directory containing the script, just launch it :

```shell
$ ./babelio-pages.rb -h
Usage: babelio_pages.rb [options]
    -f, --filename FILENAME          Set CSV filename (default: biblio.csv)
    -u, --uri URI                    Set URI (default: http://openisbn.com)
    -i, --isbn ISBN                  Only display this ISBN details (default: none)
    -h, --help                       Show this message
```

Here is an example of output :
```shell
$ ./babelio-pages.rb
E..-......-E-.............---............E.........................E..EE..........................
You've read 47098 pages from 117 books.

== Stats ===============
The thinest book has 121 pages
The bigger book has 1273 pages
The average pages per book is 402
The median pages per book is 352
```

You can also display details for a specific book this way :

```shell
$ ./babelio-pages.rb -i 2258082773
Project OpenISBN 
----------------------------------------------------------------------------------- 
Title: Les Veufs Noirs 
Cover:  http://www.openisbn.com/cover/2258082773_72.jpg 
Author: Isaac Asimov, 
Publisher: Omnibus 
Pages: 1104 
ISBN10: 2258082773 
ISBN13: 9782258082779 
URL: http://www.openisbn.com/isbn/9782258082779/ 
List Price: 28.00 
Price comparison: 
URL: http://www.openisbn.com/price/9782258082779/ 
----------------------------------------------------------------------------------- 
http://www.openisbn.com
```
