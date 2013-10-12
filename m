From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
Date: Sat, 12 Oct 2013 16:02:16 +0000
Message-ID: <bug-70388-8800-CPLVho9eCr@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0851214373=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0851214373==
Content-Type: multipart/alternative; boundary="1381593736.0E3d0.7227"; charset="us-ascii"


--1381593736.0E3d0.7227
Date: Sat, 12 Oct 2013 16:02:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

--- Comment #2 from Rostislav Krasny <rosti.bsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #1)
> What version of Mesa are you using?

9.2.0. The latest packages of Fedora 19:

[rosti@localhost ~]$ rpm -qa | grep mesa
mesa-libgbm-9.2-1.20130919.fc19.i686
mesa-dri-drivers-9.2-1.20130919.fc19.i686
mesa-libGLU-9.0.0-2.fc19.i686
mesa-libxatracker-9.2-1.20130919.fc19.i686
mesa-libwayland-egl-9.2-1.20130919.fc19.i686
mesa-filesystem-9.2-1.20130919.fc19.i686
mesa-libEGL-9.2-1.20130919.fc19.i686
mesa-libglapi-9.2-1.20130919.fc19.i686
mesa-libGL-9.2-1.20130919.fc19.i686

Following logs might be intersting as well:

Oct 12 17:29:59 localhost.localdomain xinit[275]: kdeinit4: Aborting. $HOME not
set!
Oct 12 17:29:59 localhost.localdomain xinit[275]: (__main__.py:364):
Gtk-CRITICAL **: gtk_box_reorder_child: assertion `old_link != NULL' failed
Oct 12 17:29:59 localhost.localdomain xinit[275]: kdeinit4: Aborting. $HOME not
set!kwin(362): Couldn't start kglobalaccel from kglobalaccel.desktop:  "KLaunc
Oct 12 17:29:59 localhost.localdomain xinit[275]: The name org.kde.klauncher
was not provided by any .service files
Oct 12 17:29:59 localhost.localdomain xinit[275]: "
Oct 12 17:30:01 localhost.localdomain xinit[275]: kdeinit4: Aborting. $HOME not
set!kwin(362): No ksycoca4 database available!
Oct 12 17:30:01 localhost.localdomain xinit[275]: kwin(362)/kdecore (trader)
KServiceTypeTrader::defaultOffers: KServiceTypeTrader: serviceType 
"KWin/Script"
Oct 12 17:30:05 localhost.localdomain xinit[275]: [<class
'pyanaconda.ui.gui.spokes.password.PasswordSpoke'>, <class
'pyanaconda.ui.gui.spokes.user.UserSpoke'
Oct 12 17:30:05 localhost.localdomain xinit[275]: OpenGL vendor string:        
          nouveau
Oct 12 17:30:05 localhost.localdomain xinit[275]: OpenGL renderer string:      
          Gallium 0.4 on NV34
Oct 12 17:30:05 localhost.localdomain xinit[275]: OpenGL version string:       
          1.5 Mesa 9.2.0
Oct 12 17:30:05 localhost.localdomain xinit[275]: OpenGL shading language
version string: 1.20
Oct 12 17:30:05 localhost.localdomain xinit[275]: Driver:                      
          Nouveau
Oct 12 17:30:05 localhost.localdomain xinit[275]: GPU class:                   
          NV30
Oct 12 17:30:05 localhost.localdomain xinit[275]: OpenGL version:              
          1.5
Oct 12 17:30:05 localhost.localdomain xinit[275]: GLSL version:                
          1.20
Oct 12 17:30:05 localhost.localdomain xinit[275]: Mesa version:                
          9.2
Oct 12 17:30:05 localhost.localdomain xinit[275]: Linux kernel version:        
          3.11.3
Oct 12 17:30:05 localhost.localdomain xinit[275]: Direct rendering:            
          yes
Oct 12 17:30:05 localhost.localdomain xinit[275]: Requires strict binding:     
          yes
Oct 12 17:30:05 localhost.localdomain xinit[275]: GLSL shaders:                
          limited
Oct 12 17:30:05 localhost.localdomain xinit[275]: Texture NPOT support:        
          no
Oct 12 17:30:05 localhost.localdomain xinit[275]: Virtual Machine:             
          no
Oct 12 17:30:05 localhost.localdomain xinit[275]: kdeinit4: Aborting. $HOME not
set!kwin(362): No ksycoca4 database available!
Oct 12 17:30:05 localhost.localdomain xinit[275]: kwin(362)/kdecore (trader)
KServiceTypeTrader::defaultOffers: KServiceTypeTrader: serviceType 
"KWin/Effect"
Oct 12 17:30:05 localhost.localdomain systemd[1]: Reloading.
Oct 12 17:30:05 localhost.localdomain LVM: Logical Volume autoactivation
enabled.
Oct 12 17:30:05 localhost.localdomain LVM: Activation generator successfully
completed.
Oct 12 17:30:06 localhost.localdomain xinit[275]: /bin/xinit: connection to X
server lost
Oct 12 17:30:06 localhost.localdomain xinit[275]: waiting for X server to shut
down kwin: Fatal IO error: client killed
Oct 12 17:30:06 localhost.localdomain xinit[275]: (EE) QThreadStorage: Thread
0x8ed0d40 exited after QThreadStorage 32 destroyed
Oct 12 17:30:06 localhost.localdomain xinit[275]: QThreadStorage: Thread
0x8ed0d40 exited after QThreadStorage 31 destroyed
Oct 12 17:30:06 localhost.localdomain xinit[275]: Server terminated
successfully (0). Closing log file.


> Also, what process owns 0xcccc0000 -- I assume X?

Do you mean the process name written in the "failed to idle channel" error
message? It depends on the DE. Currently I've Fedora 19 with KDE DE installed.
It's KDE 4.11.2. And following logs are taken from journalctl -a

Oct 12 18:18:18 localhost.localdomain kernel: nouveau E[kwin[2776]] failed to
idle channel 0xcccc0000 [kwin[2776]]
Oct 12 18:18:33 localhost.localdomain kernel: nouveau E[kwin[2776]] failed to
idle channel 0xcccc0000 [kwin[2776]]
Oct 12 18:18:48 localhost.localdomain kernel: nouveau E[ X[2521]] failed to
idle channel 0xcccc0000 [X[2521]]
Oct 12 18:18:48 localhost.localdomain systemd[1]: Started Show Plymouth Reboot
Screen.
Oct 12 18:19:03 localhost.localdomain kernel: nouveau E[ X[2521]] failed to
idle channel 0xcccc0000 [X[2521]]

KDE was stuck again. I was able only to move the mouse and to switch to console
terminals (Ctlr-Aft-Fn). So after some time (5 - 10 minutes) I switched to
console and ran 'shutdown -r now'. As you can see the above logs were written
during the shutdown. And there are two processes owned the 0xcccc0000: kwin and
X. Also there could be the same failure of idling channel but whithout any
process name within the square brackets. I had seen that on Arch Linux.

> The full dmesg would definitely be nice to have.

I will attach it.

> What chipset do you have (lspci -nn wouldn't hurt)?

[rosti@localhost ~]$ lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation 82865G/PE/P DRAM
Controller/Host-Hub Interface [8086:2570] (rev 02)
00:01.0 PCI bridge [0604]: Intel Corporation 82865G/PE/P AGP Bridge [8086:2571]
(rev 02)
00:06.0 System peripheral [0880]: Intel Corporation 82865G/PE/P Processor to
I/O Memory Interface [8086:2576] (rev 02)
00:1d.0 USB controller [0c03]: Intel Corporation 82801EB/ER (ICH5/ICH5R) USB
UHCI Controller #1 [8086:24d2] (rev 02)
00:1d.1 USB controller [0c03]: Intel Corporation 82801EB/ER (ICH5/ICH5R) USB
UHCI Controller #2 [8086:24d4] (rev 02)
00:1d.2 USB controller [0c03]: Intel Corporation 82801EB/ER (ICH5/ICH5R) USB
UHCI Controller #3 [8086:24d7] (rev 02)
00:1d.3 USB controller [0c03]: Intel Corporation 82801EB/ER (ICH5/ICH5R) USB
UHCI Controller #4 [8086:24de] (rev 02)
00:1d.7 USB controller [0c03]: Intel Corporation 82801EB/ER (ICH5/ICH5R) USB2
EHCI Controller [8086:24dd] (rev 02)
00:1e.0 PCI bridge [0604]: Intel Corporation 82801 PCI Bridge [8086:244e] (rev
c2)
00:1f.0 ISA bridge [0601]: Intel Corporation 82801EB/ER (ICH5/ICH5R) LPC
Interface Bridge [8086:24d0] (rev 02)
00:1f.1 IDE interface [0101]: Intel Corporation 82801EB/ER (ICH5/ICH5R) IDE
Controller [8086:24db] (rev 02)
00:1f.3 SMBus [0c05]: Intel Corporation 82801EB/ER (ICH5/ICH5R) SMBus
Controller [8086:24d3] (rev 02)
00:1f.5 Multimedia audio controller [0401]: Intel Corporation 82801EB/ER
(ICH5/ICH5R) AC'97 Audio Controller [8086:24d5] (rev 02)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV34 [GeForce FX
5500] [10de:0326] (rev a1)
02:09.0 Ethernet controller [0200]: Marvell Technology Group Ltd. 88E8001
Gigabit Ethernet Controller [11ab:4320] (rev 13)

> Does setting agpmode=4 or agpmode=0 help at all?

Didn't try yet but I will. Where to set it?

> Another idea -- add MESA_EXTENSION_OVERRIDE=-GL_ARB_framebuffer_object to
> your system environment (make sure that the DM gets it).

Do you mean setting it in the ~/.bashrc or where?

> FWIW, my personal experience with a NV34 (PCI-E) is that as soon as I open
> chrome or firefox, it hangs hard; before then, no issues. And that's without
> any sort of compositor/etc in the fray.

I use Firefox 24.0 right now and it doesn't make any problem with nouveau.
Actually I'm in KDE Plasma Workspace (failsafe session). This failsafe mode
disables something in KDE that allows me to use KDE without nouveau failure.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381593736.0E3d0.7227
Date: Sat, 12 Oct 2013 16:02:16 +0000
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
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">bug 70388</a>
              from <span class="vcard"><a class="email" href="mailto:rosti.bsd&#64;gmail.com" title="Rostislav Krasny &lt;rosti.bsd&#64;gmail.com&gt;"> <span class="fn">Rostislav Krasny</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70388#c1">comment #1</a>)
<span class="quote">&gt; What version of Mesa are you using?</span >

9.2.0. The latest packages of Fedora 19:

[rosti&#64;localhost ~]$ rpm -qa | grep mesa
mesa-libgbm-9.2-1.20130919.fc19.i686
mesa-dri-drivers-9.2-1.20130919.fc19.i686
mesa-libGLU-9.0.0-2.fc19.i686
mesa-libxatracker-9.2-1.20130919.fc19.i686
mesa-libwayland-egl-9.2-1.20130919.fc19.i686
mesa-filesystem-9.2-1.20130919.fc19.i686
mesa-libEGL-9.2-1.20130919.fc19.i686
mesa-libglapi-9.2-1.20130919.fc19.i686
mesa-libGL-9.2-1.20130919.fc19.i686

Following logs might be intersting as well:

Oct 12 17:29:59 localhost.localdomain xinit[275]: kdeinit4: Aborting. $HOME not
set!
Oct 12 17:29:59 localhost.localdomain xinit[275]: (__main__.py:364):
Gtk-CRITICAL **: gtk_box_reorder_child: assertion `old_link != NULL' failed
Oct 12 17:29:59 localhost.localdomain xinit[275]: kdeinit4: Aborting. $HOME not
set!kwin(362): Couldn't start kglobalaccel from kglobalaccel.desktop:  &quot;KLaunc
Oct 12 17:29:59 localhost.localdomain xinit[275]: The name org.kde.klauncher
was not provided by any .service files
Oct 12 17:29:59 localhost.localdomain xinit[275]: &quot;
Oct 12 17:30:01 localhost.localdomain xinit[275]: kdeinit4: Aborting. $HOME not
set!kwin(362): No ksycoca4 database available!
Oct 12 17:30:01 localhost.localdomain xinit[275]: kwin(362)/kdecore (trader)
KServiceTypeTrader::defaultOffers: KServiceTypeTrader: serviceType 
&quot;KWin/Script&quot;
Oct 12 17:30:05 localhost.localdomain xinit[275]: [&lt;class
'pyanaconda.ui.gui.spokes.password.PasswordSpoke'&gt;, &lt;class
'pyanaconda.ui.gui.spokes.user.UserSpoke'
Oct 12 17:30:05 localhost.localdomain xinit[275]: OpenGL vendor string:        
          nouveau
Oct 12 17:30:05 localhost.localdomain xinit[275]: OpenGL renderer string:      
          Gallium 0.4 on NV34
Oct 12 17:30:05 localhost.localdomain xinit[275]: OpenGL version string:       
          1.5 Mesa 9.2.0
Oct 12 17:30:05 localhost.localdomain xinit[275]: OpenGL shading language
version string: 1.20
Oct 12 17:30:05 localhost.localdomain xinit[275]: Driver:                      
          Nouveau
Oct 12 17:30:05 localhost.localdomain xinit[275]: GPU class:                   
          NV30
Oct 12 17:30:05 localhost.localdomain xinit[275]: OpenGL version:              
          1.5
Oct 12 17:30:05 localhost.localdomain xinit[275]: GLSL version:                
          1.20
Oct 12 17:30:05 localhost.localdomain xinit[275]: Mesa version:                
          9.2
Oct 12 17:30:05 localhost.localdomain xinit[275]: Linux kernel version:        
          3.11.3
Oct 12 17:30:05 localhost.localdomain xinit[275]: Direct rendering:            
          yes
Oct 12 17:30:05 localhost.localdomain xinit[275]: Requires strict binding:     
          yes
Oct 12 17:30:05 localhost.localdomain xinit[275]: GLSL shaders:                
          limited
Oct 12 17:30:05 localhost.localdomain xinit[275]: Texture NPOT support:        
          no
Oct 12 17:30:05 localhost.localdomain xinit[275]: Virtual Machine:             
          no
Oct 12 17:30:05 localhost.localdomain xinit[275]: kdeinit4: Aborting. $HOME not
set!kwin(362): No ksycoca4 database available!
Oct 12 17:30:05 localhost.localdomain xinit[275]: kwin(362)/kdecore (trader)
KServiceTypeTrader::defaultOffers: KServiceTypeTrader: serviceType 
&quot;KWin/Effect&quot;
Oct 12 17:30:05 localhost.localdomain systemd[1]: Reloading.
Oct 12 17:30:05 localhost.localdomain LVM: Logical Volume autoactivation
enabled.
Oct 12 17:30:05 localhost.localdomain LVM: Activation generator successfully
completed.
Oct 12 17:30:06 localhost.localdomain xinit[275]: /bin/xinit: connection to X
server lost
Oct 12 17:30:06 localhost.localdomain xinit[275]: waiting for X server to shut
down kwin: Fatal IO error: client killed
Oct 12 17:30:06 localhost.localdomain xinit[275]: (EE) QThreadStorage: Thread
0x8ed0d40 exited after QThreadStorage 32 destroyed
Oct 12 17:30:06 localhost.localdomain xinit[275]: QThreadStorage: Thread
0x8ed0d40 exited after QThreadStorage 31 destroyed
Oct 12 17:30:06 localhost.localdomain xinit[275]: Server terminated
successfully (0). Closing log file.


<span class="quote">&gt; Also, what process owns 0xcccc0000 -- I assume X?</span >

Do you mean the process name written in the &quot;failed to idle channel&quot; error
message? It depends on the DE. Currently I've Fedora 19 with KDE DE installed.
It's KDE 4.11.2. And following logs are taken from journalctl -a

Oct 12 18:18:18 localhost.localdomain kernel: nouveau E[kwin[2776]] failed to
idle channel 0xcccc0000 [kwin[2776]]
Oct 12 18:18:33 localhost.localdomain kernel: nouveau E[kwin[2776]] failed to
idle channel 0xcccc0000 [kwin[2776]]
Oct 12 18:18:48 localhost.localdomain kernel: nouveau E[ X[2521]] failed to
idle channel 0xcccc0000 [X[2521]]
Oct 12 18:18:48 localhost.localdomain systemd[1]: Started Show Plymouth Reboot
Screen.
Oct 12 18:19:03 localhost.localdomain kernel: nouveau E[ X[2521]] failed to
idle channel 0xcccc0000 [X[2521]]

KDE was stuck again. I was able only to move the mouse and to switch to console
terminals (Ctlr-Aft-Fn). So after some time (5 - 10 minutes) I switched to
console and ran 'shutdown -r now'. As you can see the above logs were written
during the shutdown. And there are two processes owned the 0xcccc0000: kwin and
X. Also there could be the same failure of idling channel but whithout any
process name within the square brackets. I had seen that on Arch Linux.

<span class="quote">&gt; The full dmesg would definitely be nice to have.</span >

I will attach it.

<span class="quote">&gt; What chipset do you have (lspci -nn wouldn't hurt)?</span >

[rosti&#64;localhost ~]$ lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation 82865G/PE/P DRAM
Controller/Host-Hub Interface [8086:2570] (rev 02)
00:01.0 PCI bridge [0604]: Intel Corporation 82865G/PE/P AGP Bridge [8086:2571]
(rev 02)
00:06.0 System peripheral [0880]: Intel Corporation 82865G/PE/P Processor to
I/O Memory Interface [8086:2576] (rev 02)
00:1d.0 USB controller [0c03]: Intel Corporation 82801EB/ER (ICH5/ICH5R) USB
UHCI Controller #1 [8086:24d2] (rev 02)
00:1d.1 USB controller [0c03]: Intel Corporation 82801EB/ER (ICH5/ICH5R) USB
UHCI Controller #2 [8086:24d4] (rev 02)
00:1d.2 USB controller [0c03]: Intel Corporation 82801EB/ER (ICH5/ICH5R) USB
UHCI Controller #3 [8086:24d7] (rev 02)
00:1d.3 USB controller [0c03]: Intel Corporation 82801EB/ER (ICH5/ICH5R) USB
UHCI Controller #4 [8086:24de] (rev 02)
00:1d.7 USB controller [0c03]: Intel Corporation 82801EB/ER (ICH5/ICH5R) USB2
EHCI Controller [8086:24dd] (rev 02)
00:1e.0 PCI bridge [0604]: Intel Corporation 82801 PCI Bridge [8086:244e] (rev
c2)
00:1f.0 ISA bridge [0601]: Intel Corporation 82801EB/ER (ICH5/ICH5R) LPC
Interface Bridge [8086:24d0] (rev 02)
00:1f.1 IDE interface [0101]: Intel Corporation 82801EB/ER (ICH5/ICH5R) IDE
Controller [8086:24db] (rev 02)
00:1f.3 SMBus [0c05]: Intel Corporation 82801EB/ER (ICH5/ICH5R) SMBus
Controller [8086:24d3] (rev 02)
00:1f.5 Multimedia audio controller [0401]: Intel Corporation 82801EB/ER
(ICH5/ICH5R) AC'97 Audio Controller [8086:24d5] (rev 02)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV34 [GeForce FX
5500] [10de:0326] (rev a1)
02:09.0 Ethernet controller [0200]: Marvell Technology Group Ltd. 88E8001
Gigabit Ethernet Controller [11ab:4320] (rev 13)

<span class="quote">&gt; Does setting agpmode=4 or agpmode=0 help at all?</span >

Didn't try yet but I will. Where to set it?

<span class="quote">&gt; Another idea -- add MESA_EXTENSION_OVERRIDE=-GL_ARB_framebuffer_object to
&gt; your system environment (make sure that the DM gets it).</span >

Do you mean setting it in the ~/.bashrc or where?

<span class="quote">&gt; FWIW, my personal experience with a NV34 (PCI-E) is that as soon as I open
&gt; chrome or firefox, it hangs hard; before then, no issues. And that's without
&gt; any sort of compositor/etc in the fray.</span >

I use Firefox 24.0 right now and it doesn't make any problem with nouveau.
Actually I'm in KDE Plasma Workspace (failsafe session). This failsafe mode
disables something in KDE that allows me to use KDE without nouveau failure.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381593736.0E3d0.7227--

--===============0851214373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0851214373==--
