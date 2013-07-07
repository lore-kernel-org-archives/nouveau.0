From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Sun, 07 Jul 2013 16:20:49 +0000
Message-ID: <bug-54700-8800-WuCr7Ry4Hj@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0338664517=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0338664517==
Content-Type: multipart/alternative; boundary="1373214049.f0851.5189"; charset="us-ascii"


--1373214049.f0851.5189
Date: Sun, 7 Jul 2013 16:20:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #14 from r.ductor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to comment #12)

Hello, I had just installed the nvidia proprietary driver :(((( when I saw the
questions, so now I've unistalled everything just to answer ...

> * Does the corruption/distored graphics occur before X ?

framebuffer console seems ok. The anomalous graphics starts when loading kdm.
See the picture above.

> * Wondering how much effect this has "Unknown LVDS configuration bits"
> Does that issue occur on a non LVDS output - eg. when you have monitor
> plugged to the VGA and LVDS is off ?

It's a laptop: how can I do that?

> * Does the "distorted graphics" differ if you (re)move the mesa driver
> nouveau_vieux.so ?

YES, just reproduced after
  mv /usr/lib/i386-linux-gnu/dri/{,__unloaded__}nouveau_vieux_dri.so

> * Why do you have custom modelines in your xorg.conf? 

Do not know. I do not have a xorg.conf, nor I did not modified anything apart
the conf files in xorg, which are currently disabled by the -off suffix (by
they are trivial, anyway, see below)

root@majorana:~# ls /etc/X11
app-defaults  default-display-manager  rgb.txt  xinit  xorg.conf.d  Xreset.d   
Xsession    Xsession.options  Xwrapper.config
cursors       fonts                    X        xkb    Xreset       Xresources 
Xsession.d  XvMCConfig

root@majorana:~# ls /etc/X11/xorg.conf.d/
modesetting.conf-off  nouveau.conf-off  nvidia.conf-off  vesa.conf-off

root@majorana:~# cat /etc/X11/xorg.conf.d/*
Section "Device"
Identifier "Device0"
Driver "modesetting"
BusID "pci:0000:01:00.0"
EndSection

Section "Device"
Identifier "Device0"
Driver "nouveau"
EndSection

Section "Device"
Identifier "Device0"
Driver "nvidia"
EndSection

Section "Device"
Identifier "Device0"
Driver "vesa"
EndSection

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373214049.f0851.5189
Date: Sun, 7 Jul 2013 16:20:49 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:r.ductor&#64;gmail.com" title="r.ductor&#64;gmail.com">r.ductor&#64;gmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54700#c12">comment #12</a>)

Hello, I had just installed the nvidia proprietary driver :(((( when I saw the
questions, so now I've unistalled everything just to answer ...

<span class="quote">&gt; * Does the corruption/distored graphics occur before X ?</span >

framebuffer console seems ok. The anomalous graphics starts when loading kdm.
See the picture above.

<span class="quote">&gt; * Wondering how much effect this has &quot;Unknown LVDS configuration bits&quot;
&gt; Does that issue occur on a non LVDS output - eg. when you have monitor
&gt; plugged to the VGA and LVDS is off ?</span >

It's a laptop: how can I do that?

<span class="quote">&gt; * Does the &quot;distorted graphics&quot; differ if you (re)move the mesa driver
&gt; nouveau_vieux.so ?</span >

YES, just reproduced after
  mv /usr/lib/i386-linux-gnu/dri/{,__unloaded__}nouveau_vieux_dri.so

<span class="quote">&gt; * Why do you have custom modelines in your xorg.conf? </span >

Do not know. I do not have a xorg.conf, nor I did not modified anything apart
the conf files in xorg, which are currently disabled by the -off suffix (by
they are trivial, anyway, see below)

root&#64;majorana:~# ls /etc/X11
app-defaults  default-display-manager  rgb.txt  xinit  xorg.conf.d  Xreset.d   
Xsession    Xsession.options  Xwrapper.config
cursors       fonts                    X        xkb    Xreset       Xresources 
Xsession.d  XvMCConfig

root&#64;majorana:~# ls /etc/X11/xorg.conf.d/
modesetting.conf-off  nouveau.conf-off  nvidia.conf-off  vesa.conf-off

root&#64;majorana:~# cat /etc/X11/xorg.conf.d/*
Section &quot;Device&quot;
Identifier &quot;Device0&quot;
Driver &quot;modesetting&quot;
BusID &quot;pci:0000:01:00.0&quot;
EndSection

Section &quot;Device&quot;
Identifier &quot;Device0&quot;
Driver &quot;nouveau&quot;
EndSection

Section &quot;Device&quot;
Identifier &quot;Device0&quot;
Driver &quot;nvidia&quot;
EndSection

Section &quot;Device&quot;
Identifier &quot;Device0&quot;
Driver &quot;vesa&quot;
EndSection</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373214049.f0851.5189--

--===============0338664517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0338664517==--
