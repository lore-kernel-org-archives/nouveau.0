From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77371] [NVA3] gpu lockup on boot unless noaccel=1
Date: Sat, 12 Apr 2014 21:42:37 +0000
Message-ID: <bug-77371-8800-trxTmncDFI@http.bugs.freedesktop.org/>
References: <bug-77371-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0399333133=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77371-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0399333133==
Content-Type: multipart/alternative; boundary="1397338956.08d0A1.6575"; charset="us-ascii"


--1397338956.08d0A1.6575
Date: Sat, 12 Apr 2014 21:42:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77371

--- Comment #9 from jw.hendy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I just sent two traces to mmio [dot] dumps [at] gmail [dot] com, following the
instructions here:
- Setup: http://nouveau.freedesktop.org/wiki/MmioTrace/
- Running xinit/xinit + glxgears: https://wiki.ubuntu.com/X/MMIOTracing

Specific process:
- install nvidia drivers

$ sudo pacman -Q | grep nvidia
nvidia 334.21-4
nvidia-libgl 334.21-7
nvidia-utils 334.21-7

- boot system into recovery by adding `s` to kernel line

- unload nvidia and drm

# rmmod nvidia drm

- verify nvidia not loaded

# lsmod | grep nvidia   # no results returned

- start trace

(/sys/kernel/debug was already mounted)
# echo mmiotrace > /sys/kernel/debug/tracing/current_tracer
# cat /sys/kernel/debug/tracing/trace_pipe > /home/user/file.txt

- run test

1) ran `xinit "sleep 10"`
2) ran `xinit -e sh -c "glxgears & sleep 10"`

- stop trace

# echo nop > /sys/kernel/debug/tracing/current_tracer

- compressed files

$ xz -z file.txt
$ mv file.txt trace_quadro-fx-1800m_nv50-family-nva3_[xinit/glxgears].xz

- Send files and upload here as well (will come shortly)

This also prompted me to provide some more system details in case that is of
assistance:

- Computer: HP EliteBook 8540W (laptop)

- Running openbox 3.5.2 with following ~/.xinitrc contents:
#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

exec dbus-launch openbox-session

- various package information:

$ sudo pacman -Q | grep nouveau
nouveau-dri 10.1.0-4
xf86-video-nouveau 1.0.10-2

$ sudo pacman -Q |grep mesa
mesa 10.1.0-4
mesa-libgl 10.1.0-4

$ sudo pacman -Q | grep libtxc_dxtn
libtxc_dxtn 1.0.1-5

$ sudo pacmen -Q | grep xorg-server
xorg-server 1.15.0-5
xorg-server-common 1.15.0-5
xorg-server-utils 7.6-3

- screen information:

$ xrandr
Screen 0: minimum 320 x 200, current 1600 x 900, maximum 8192 x 8192
LVDS-1 connected 1600x900+0+0 (normal left inverted right x axis y axis) 344mm
x 193mm
   1600x900      60.04*+
   1152x864      59.96  
   1024x768      59.92  
   800x600       59.86  
   640x480       59.38  
   720x400       59.55  
   640x400       59.95  
   640x350       59.77  
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)
VGA-1 disconnected (normal left inverted right x axis y axis)

(No external monitors connected, if that wasn't apparent.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397338956.08d0A1.6575
Date: Sat, 12 Apr 2014 21:42:36 +0000
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
   title="NEW --- - [NVA3] gpu lockup on boot unless noaccel=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77371#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA3] gpu lockup on boot unless noaccel=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77371">bug 77371</a>
              from <span class="vcard"><a class="email" href="mailto:jw.hendy&#64;gmail.com" title="jw.hendy&#64;gmail.com">jw.hendy&#64;gmail.com</a>
</span></b>
        <pre>I just sent two traces to mmio [dot] dumps [at] gmail [dot] com, following the
instructions here:
- Setup: <a href="http://nouveau.freedesktop.org/wiki/MmioTrace/">http://nouveau.freedesktop.org/wiki/MmioTrace/</a>
- Running xinit/xinit + glxgears: <a href="https://wiki.ubuntu.com/X/MMIOTracing">https://wiki.ubuntu.com/X/MMIOTracing</a>

Specific process:
- install nvidia drivers

$ sudo pacman -Q | grep nvidia
nvidia 334.21-4
nvidia-libgl 334.21-7
nvidia-utils 334.21-7

- boot system into recovery by adding `s` to kernel line

- unload nvidia and drm

# rmmod nvidia drm

- verify nvidia not loaded

# lsmod | grep nvidia   # no results returned

- start trace

(/sys/kernel/debug was already mounted)
# echo mmiotrace &gt; /sys/kernel/debug/tracing/current_tracer
# cat /sys/kernel/debug/tracing/trace_pipe &gt; /home/user/file.txt

- run test

1) ran `xinit &quot;sleep 10&quot;`
2) ran `xinit -e sh -c &quot;glxgears &amp; sleep 10&quot;`

- stop trace

# echo nop &gt; /sys/kernel/debug/tracing/current_tracer

- compressed files

$ xz -z file.txt
$ mv file.txt trace_quadro-fx-1800m_nv50-family-nva3_[xinit/glxgears].xz

- Send files and upload here as well (will come shortly)

This also prompted me to provide some more system details in case that is of
assistance:

- Computer: HP EliteBook 8540W (laptop)

- Running openbox 3.5.2 with following ~/.xinitrc contents:
#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x &quot;$f&quot; ] &amp;&amp; . &quot;$f&quot;
  done
  unset f
fi

exec dbus-launch openbox-session

- various package information:

$ sudo pacman -Q | grep nouveau
nouveau-dri 10.1.0-4
xf86-video-nouveau 1.0.10-2

$ sudo pacman -Q |grep mesa
mesa 10.1.0-4
mesa-libgl 10.1.0-4

$ sudo pacman -Q | grep libtxc_dxtn
libtxc_dxtn 1.0.1-5

$ sudo pacmen -Q | grep xorg-server
xorg-server 1.15.0-5
xorg-server-common 1.15.0-5
xorg-server-utils 7.6-3

- screen information:

$ xrandr
Screen 0: minimum 320 x 200, current 1600 x 900, maximum 8192 x 8192
LVDS-1 connected 1600x900+0+0 (normal left inverted right x axis y axis) 344mm
x 193mm
   1600x900      60.04*+
   1152x864      59.96  
   1024x768      59.92  
   800x600       59.86  
   640x480       59.38  
   720x400       59.55  
   640x400       59.95  
   640x350       59.77  
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)
VGA-1 disconnected (normal left inverted right x axis y axis)

(No external monitors connected, if that wasn't apparent.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397338956.08d0A1.6575--

--===============0399333133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0399333133==--
