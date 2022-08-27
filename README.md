# **SysAdmin @ Upskill-ISCTE (2022)**

![Header](/assets/images/header.jpg)

# **Contents**

- [Summary](#summary)
- [Pre-requisites](#pre-requisites)
- [General Resources](#general-resources)
- [Curriculum](#curriculum)
    - [1. Operating Systems + Linux Admin](#1---operating-systems--linux-admin)
    - [2. Networking + Cisco Admin](#2---networking--cisco-admin)
    - [3. Cloud Computing + Microsoft Admin](#3---cloud-computing--microsoft-admin)
    - [4. Virtualization](#4---virtualization)
    - [5. Automation & Security](#5---automation--security)
    - [6. Persistency & Databases](#6---persistency--databases)
- [Advanced Resources](#advanced-resources)
- [To-Do](#to-do)

# **Summary**

A compilation of notes and resources collected by me (a student) of the SysAdmin course at Upskill-ISCTE.

It is meant to be a repository of shared knowledge for present and future students, or anyone interested in the field of System Administration.

**WARNING:** I have no official affiliation with ISCTE or Upskill and any content shared here is of my own responsability.

<details><summary>Tradução em Português de Portugal</summary>
<p>

Uma lista de notas e recursos, coletados por mim (uma estudante) do curso de SysAdmin no programa Upskill-ISCTE.

Este repositório tem como objetivo a partilha do conhecimento com outros estudantes do curso, assim como qualquer interessado na área da Administração de Sistemas.

**ATENÇAO:** Não tenho qualquer afiliação oficial com o ISCTE ou a Upskill, e qualquer conteúdo aqui partilhado é apenas da minha própria responsabilidade.

</p>
</details>
<p>

# **Pre-requisites:**

I cannot stress this enough but before you start your journey as a sysadmin, it is essential that you learn basic skills in order to utilize computers and related technology efficiently.
I assume that most people who have set their minds on such a life path, have had a somewhat extensive contact with computer but alas, it has never been correct for me before to make such assumptions before.

As such, I recommend checking out Wikiversity's [Computer Skills](https://en.wikiversity.org/wiki/Computer_Skills) course, move on to IC3 [Internet and Computing Core Certification](https://en.wikiversity.org/wiki/IC3) and finally to [IT Fundamentals](https://en.wikiversity.org/wiki/IT_Fundamentals/Collection).

This should be more than enough to get your foot in the world of IT and computers! Good luck!
# **General Resources**

- [Crash Course Computer Science](https://www.youtube.com/watch?v=tpIctyqH29Q&list=PL8dPuuaLjXtNlUrzyH5r6jN9ulIgZBpdo) - Series of 10-min videos from early computing and low level computing concepts like the binary system, RAM, instruction sets, all the way to high level concepts like Machine Learning and the Internet.

- Learn ASAP, these are universal skills across the IT world:
    - [Git and Github](https://docs.github.com/en)
        - [Pratical Exercises w/ GitHub Skills](https://skills.github.com/)
        - [Git Cheatsheet](https://training.github.com/downloads/github-git-cheat-sheet/)
    - Markup languages like [Markdown](https://learn-markdown.github.io/), [HTML](https://www.w3schools.com/html/html_intro.asp) and [XML](https://www.w3schools.com/xml/)
    - [Regular Expressions](https://regex101.com/)
    - Shortcuts for most commonly used tools via [ShortcutFoo](https://www.shortcutfoo.com/)
<p>

- [The Missing Semester of your CS Education](https://missing.csail.mit.edu/) - Aimed at CS students with some notions of programming and operating systems, this can be used by any auto-didact of an intermediate level. Essential if you want to learn to control the tools you're going to be working with (shell, vim, git, etc.)

- [Rico's cheatsheets](https://devhints.io/) Collection of cheatsheets related to programming, command-line utilities and other apps (Bash, Git, Vim, VSCode, Markdown, Regex, etc.)

- [Linode Docs](https://www.linode.com/docs/guides/) - Extensive library of Linux and Cloud Computing guides

- [DigitalOcean's Tutorials](https://www.digitalocean.com/community/tutorials) - Development and SysAdmin Tutorials

<p>

# Curriculum

## **1 - Operating Systems + Linux Admin**

### Setting up your learning environment

1. Setup a Linux Virtual Machine environment:

> Make sure you have at least 8GB of RAM on your machine. Ideally you have 16GB and an SSD with more than 256GB.

- On Windows and Apple Intel: [VirtualBox](https://www.virtualbox.org/)
- On Apple Silicon: [UTM](https://mac.getutm.app/)

    - Download Ubuntu 22.04 LTS:
        - For [x86_64/amd64 systems](https://ubuntu.com/download/desktop/thank-you?version=22.04.1&architecture=amd64) (most systems)
        - For [arm64 systems](https://cdimage.ubuntu.com/jammy/daily-live/current/jammy-desktop-arm64.iso) (M1 Macs, Raspberry Pi)

-- OR --

2. Run Windows Subsystem for Linux (WSL) on your Windows computer:
    - [Install Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/install)
    - Open a Powershell command prompt as an Administrator and run:

            wsl --install

    - [Get started](https://docs.microsoft.com/en-us/windows/wsl/setup/environment) with your new WSL environment

3. Install some useful tools:
    - [Homebrew Package Manager](https://brew.sh/) (for macOS users only)
    - [`tldr`](https://github.com/tldr-pages/tldr) - Community maintained help pages for CLI tools, for better readability than man pages. *Available as a package for most Linux distributions, homebrew for macOS and an extension for VSCode.*
        - Alternatively, [cht.sh](https://cht.sh/) is a website that compiles all of community driven documentation into a neat little package: you can either install the CLI client or simply use `curl` like so:
        <p>

        ```
        $ curl cht.sh/ls | more

        ## or as a bash function to add to your .bashrc

        doc () { curl "https://cht.sh/$1" | more }
        ```

    - [`shellcheck`](https://github.com/koalaman/shellcheck) - Linting tool to avoid common mistakes in your scripts. *Available as a package for most Linux distributions, homebrew for macOS and an extension for VSCode.*
<p>

### **Study Materials**

- Master the art of the command line [in one page](https://github.com/jlevy/the-art-of-command-line)
    - Or try out this free book by William Shotts, [The Linux Command Line](https://sourceforge.net/projects/linuxcommand/files/TLCL/19.01/TLCL-19.01.pdf/download) and it's sequel [Adventures with the Command Line](https://sourceforge.net/projects/linuxcommand/files/AWTLCL/21.10/AWTLCL-21.10.pdf/download). Covers basic command line use as well as bash shell scripting.
<p>

- [Learn vi/vim with Vim School](https://vimschool.netlify.app/) - Alternatively use the command line tutorial created by vim's developers (you might need to install the `vim-full` package)

        $ vimtutor

- `sed` and `awk`
    - [Learnbyexample's GNU sed](https://learnbyexample.github.io/learn_gnused/)
    - [Learnbyexample's GNU awk](https://learnbyexample.github.io/learn_gnuawk/)
    - [Learnbyexample's Text Processing with GNU coreutils](https://learnbyexample.github.io/cli_text_processing_coreutils/)
    - Parsing for Pentesters
        - [Part 1 - GNU coreutils](https://bluescreenofjeff.com/2016-07-26-finding-diamonds-in-the-rough-parsing-for-pentesters/)
        - [Part 2 - Regex](https://bluescreenofjeff.com/2016-10-14-black-magic-parsing-with-regular-expressions-parsing-for-pentesters/)
        - [Part 3 - awk and sed](https://bluescreenofjeff.com/2017-10-03-f-awk-yeah-advanced-sed-and-awk-usage-parsing-for-pentesters-3/)
<p>

- `htop` [explained](https://peteris.rocks/blog/htop/)

- `ssh` [cheat sheet](https://www.marcobehler.com/guides/ssh-cheat-sheet) for popular commands, key generation and SSH agents

- Other exercises:
    - [Linux Upskill Challenge](https://github.com/livialima/linuxupskillchallenge) - a series of challenges to teach you how to sysadmin a remote Linux server from the commandline. This gets you to setup a server on a cloud service like AWS or Azure.
    - [Operating Systems](https://github.com/bregman-arie/devops-exercises#operating-system)
    - [Hardware](https://github.com/bregman-arie/devops-exercises#hardware)
    - [Virtualization](https://github.com/bregman-arie/devops-exercises#virtualization) - ignore exercises after "Python - OOP"
    - [Regex](https://github.com/bregman-arie/devops-exercises#regex)

#### **Bash Scripting**

- [The Bash Hackers Wiki](https://wiki.bash-hackers.org/start) - All kinds of information on scripting, code snippets, how to's and further resources on bash and bash scripting.

- Practice your bash skills with exercises on [Exercism.org](https://exercism.org/tracks/bash/exercises) or at @bregman-arie's [repository](https://github.com/bregman-arie/devops-exercises/blob/master/topics/shell/README.md)

- [Pure bash alternatives to external processes](https://github.com/dylanaraps/pure-bash-bible) - build functions in bash that can replace external programs like sed, awk, seq, ls, etc. Good reference for troubleshooting programs and scripts written in bash. Also available for [POSIX sh](https://github.com/dylanaraps/pure-sh-bible)

- Improve your shell scripts:
    - [Serious Shell Programming](https://freebsdfrau.gitbook.io/serious-shell-programming/) - Learn to make your command line programs compatible with all kinds of systems, from macOS, *BSD and even Windows.
    - [Safe ways to do things in bash](https://github.com/anordal/shellharden/blob/master/how_to_do_things_safely_in_bash.md)
    - [Better Bash Scripting in 15 minutes](https://robertmuth.blogspot.com/2012/08/better-bash-scripting-in-15-minutes.html)
    - [Writing Robust Bash Shell Scripts](https://www.davidpashley.com/articles/writing-robust-shell-scripts/)

#### **LPIC-1 Certification**

- [Official LPI exam page](https://www.lpi.org/our-certifications/lpic-1-overview)

- [IBM's Roadmap for LPIC-01](https://developer.ibm.com/tutorials/l-lpic1-map/)

### **Further References**

- [GNU Manuals Online](https://www.gnu.org/manual/manual.html) - Most tools used in the course were developed by the GNU project. RTFM (Read the F*cking Manual) for every tool.

- [Arch Wiki](https://wiki.archlinux.org/) - Most complete wiki for a single Linux distribution, content can be used for most other distributions.

- [Gentoo Wiki](https://wiki.gentoo.org/wiki/Main_Page) - Same as Arch Wiki. Use as a reference for any distribution.

- [HowtoForge](https://www.howtoforge.com/) - Generalized Linux tutorials
### **Class Recommended Reading**

<details><summary>Need help? Look up Rot13</summary>
Lbh pna svaq nyy bs gurfr obbxf bayvar ng Yvotra.yv (vs gung nqqerff qbrf abg jbex, hfr QhpxQhpxTb gb frnepu sbe zveebf).

V zvtug nyfb or noyr gb cebivqr lbh n qvtvgny pbcl :)</details>

- [Modern Operating Systems, Global Edition](https://www.bookdepository.com/Modern-Operating-Systems-Global-Edition-Andrew-Tanenbaum/9781292061429?sr=1-1) 4th Edition
- [Sistemas Operativos](https://www.wook.pt/livro/sistemas-operativos-jose-alves-marques/14121092) 2nd Edition - Portuguese Only
- [Operating System Concepts Essentials](https://www.bookdepository.com/Operating-System-Concepts-Essentials-Second-Edition-Silberschatz/9781118804926?sr=1-1) 2nd Edition
- [Operating System Concepts](https://www.bookdepository.com/Operating-System-Concepts-Abraham-Silberschatz/9781119800361?sr=1-1) 10th Edition
- [Operating Systems: Internals and Design Principles, Global Edition](https://www.bookdepository.com/Operating-Systems-Internals-Design-Principles-Global-Edition-William-Stallings/9781292214290?sr=1-1) 9th Edition
- [Fundamental do Linux](https://www.wook.pt/livro/fundamental-do-linux-paulo-trezentos/178326) 3rd Edition - Portuguese Only
<p>


## **2 - Networking + Cisco Admin**

*To be updated in September 2022.*

## **3 - Cloud Computing + Microsoft Admin**

*To be updated in October 2022.*

## **4 - Virtualization**

*To be updated in November 2022.*

## **5 - Automation & Security**

*To be updated in December 2022.*

## **6 - Persistency & Databases**

*To be updated in February 2023.*

# **Advanced Resources**

(In case you get really into Computer Sciences)

- Before you dive in, make sure you're up to date with Khan Academy's [Algebra course](https://www.khanacademy.org/math/algebra-home) or use one of OpenStax's [free textbooks](https://openstax.org/subjects/math)

- Wikiversity's [School of Computer Science](https://en.wikiversity.org/wiki/School:Computer_Science)

- Path to a [fully free self-taught education in Computer Science](https://github.com/ossu/computer-science) via OSSU

- Deepen your knowledge by [teaching yourself Computer Science](https://teachyourselfcs.com/)

# **To-Do**

> Updated 2022-08-16

- [ ] Add solutions for class 12 exercises
- [ ] Add section for "student freebies"
- [ ] Translate to Portuguese