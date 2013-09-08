From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69083] [NV84] using DVI to VGA adapter for CRT and
 specifying supported "PreferredMode" >EDID preferred mode,
 screen output is compressed into small fraction of top scan lines
Date: Sun, 08 Sep 2013 07:18:01 +0000
Message-ID: <bug-69083-8800-8CEsAf6Cdb@http.bugs.freedesktop.org/>
References: <bug-69083-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1929801122=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69083-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1929801122==
Content-Type: multipart/alternative; boundary="1378624681.5a1ADEC1.31100"; charset="us-ascii"


--1378624681.5a1ADEC1.31100
Date: Sun, 8 Sep 2013 07:18:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69083

--- Comment #2 from Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org> ---
Created attachment 85420
  --> https://bugs.freedesktop.org/attachment.cgi?id=85420&action=edit
verbose xrandr output per comment infra

(In reply to comment #1)
> Are you sure that the display is actually compressed into the top few
> scanlines? e.g. do you see the mouse cursor in there when you move it
> around?

I started working out this problem 3 months ago. I spent mucho hours trying to
separate it from other bugs at the time. It took me more than two days. A small
sample of the 93 saved logs from that time:
http://fm.no-ip.com/Tmp/Linux/Xorg/PrefMode/

As the session begins to open I see the wallpaper colors, which later change as
Konsole and the panel should be painted. But, I can see the tip of the mouse
pointer in it at times.

> Does it show your normal background?

Can't really tell. My *normal* background is usually hidden under a pile of
windows.

> Or is it just garbage that
> happens to not have 0's for the top few scanlines' worth of data?

It's clearly a color pattern based upon the wallpaper and the panel and
Konsole.

> I've never used PreferredMode before. If you remove it, I assume everything
> works fine?

Yup. Without it happily uses the EDID preference instead of mine.

> What happens if you run something like

> xrandr --output DVI-I-1 --mode 1920x1440

> does that fix things for you? Can you supply the output of

> xrandr --verbose

> after X has started? (You can e.g. ssh in and run DISPLAY=:0 xrandr
> --verbose)

Instead of trying to figure out ssh, I made this script:

xrandr --verbose  > xrandrout.txt
echo mark >> xrandrout.txt
xrandr --output DVI-I-1 --mode 1920x1440
echo mark >> xrandrout.txt
xrandr --verbose  >> xrandrout.txt

I closed a working prior session with Konsole open, added back to configfile
the non-working PreferredMode, started new session, and after a short wait for
Konsole to get open I ran the script.

It changed nothing WRT to the bug, display still mostly just black. Good thing
Ctrl-Alt-BS works.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378624681.5a1ADEC1.31100
Date: Sun, 8 Sep 2013 07:18:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083">bug 69083</a>
              from <span class="vcard"><a class="email" href="mailto:mrmazda&#64;earthlink.net" title="Felix Miata &lt;mrmazda&#64;earthlink.net&gt;"> <span class="fn">Felix Miata</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=85420" name="attach_85420" title="verbose xrandr output per comment infra">attachment 85420</a> <a href="attachment.cgi?id=85420&amp;action=edit" title="verbose xrandr output per comment infra">[details]</a></span>
verbose xrandr output per comment infra

(In reply to <a href="show_bug.cgi?id=69083#c1">comment #1</a>)
<span class="quote">&gt; Are you sure that the display is actually compressed into the top few
&gt; scanlines? e.g. do you see the mouse cursor in there when you move it
&gt; around?</span >

I started working out this problem 3 months ago. I spent mucho hours trying to
separate it from other bugs at the time. It took me more than two days. A small
sample of the 93 saved logs from that time:
<a href="http://fm.no-ip.com/Tmp/Linux/Xorg/PrefMode/">http://fm.no-ip.com/Tmp/Linux/Xorg/PrefMode/</a>

As the session begins to open I see the wallpaper colors, which later change as
Konsole and the panel should be painted. But, I can see the tip of the mouse
pointer in it at times.

<span class="quote">&gt; Does it show your normal background?</span >

Can't really tell. My *normal* background is usually hidden under a pile of
windows.

<span class="quote">&gt; Or is it just garbage that
&gt; happens to not have 0's for the top few scanlines' worth of data?</span >

It's clearly a color pattern based upon the wallpaper and the panel and
Konsole.

<span class="quote">&gt; I've never used PreferredMode before. If you remove it, I assume everything
&gt; works fine?</span >

Yup. Without it happily uses the EDID preference instead of mine.

<span class="quote">&gt; What happens if you run something like</span >

<span class="quote">&gt; xrandr --output DVI-I-1 --mode 1920x1440</span >

<span class="quote">&gt; does that fix things for you? Can you supply the output of</span >

<span class="quote">&gt; xrandr --verbose</span >

<span class="quote">&gt; after X has started? (You can e.g. ssh in and run DISPLAY=:0 xrandr
&gt; --verbose)</span >

Instead of trying to figure out ssh, I made this script:

xrandr --verbose  &gt; xrandrout.txt
echo mark &gt;&gt; xrandrout.txt
xrandr --output DVI-I-1 --mode 1920x1440
echo mark &gt;&gt; xrandrout.txt
xrandr --verbose  &gt;&gt; xrandrout.txt

I closed a working prior session with Konsole open, added back to configfile
the non-working PreferredMode, started new session, and after a short wait for
Konsole to get open I ran the script.

It changed nothing WRT to the bug, display still mostly just black. Good thing
Ctrl-Alt-BS works.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378624681.5a1ADEC1.31100--

--===============1929801122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1929801122==--
