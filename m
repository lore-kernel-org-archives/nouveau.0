From: Geoffrey Allott <geoffrey-7+OH0nGT2YffYlcmKV82iw@public.gmane.org>
Subject: Reproducable Crashes in Nouveau with GM204 [GeForce GTX
 980]
Date: Sun, 5 Apr 2020 11:48:30 +0100 (BST)
Message-ID: <123831959.52748.1586083710760@email.ionos.co.uk>
Reply-To: Geoffrey Allott <geoffrey-7+OH0nGT2YffYlcmKV82iw@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1871102133=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1871102133==
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!doctype html>
<html>
 <head> 
  <meta charset="UTF-8"> 
 </head>
 <body>
  <div>
   Greetings, I hope this bug report is in the right place; the documentation at&nbsp;
   <a href="https://nouveau.freedesktop.org/wiki/Bugs/">https://nouveau.freedesktop.org/wiki/Bugs/</a>&nbsp;links to a defunct bugzilla page.
  </div>
  <div>
   <br>
  </div>
  <div>
   I'm running an NVIDIA Corporation GM204 &nbsp;[GeForce GTX 980] graphics card in an EVGA X99 classified motherboard, outputting over DisplayPort. I'm running Arch Linux with kernel&nbsp;5.5.13-arch2-1, and I'm using gnome under wayland (so no X server except for Xwayland).
  </div>
  <div>
   <br>
  </div>
  <div>
   When running OpenGL applications, the driver appears to crash very frequently. I've managed to reproduce the issue with the following script (epiphany is gnome web, based on webkit):
  </div>
  <div>
   <br>
  </div>
  <div>
   <div>
    #!/bin/sh
   </div>
   <br>
   <div>
    time=$(date +%F.%T)
   </div>
   <div>
    stdbuf -oL dmesg --color=always --follow &gt; dmesg.$time.log &amp; disown
   </div>
   <div>
    stdbuf -eL epiphany --private-instance https://webglsamples.org/aquarium/aquarium.html 2&gt;epiphany.$time.log &amp; disown
   </div>
   <br>
   <div>
    for i in $(seq 1 120); do
   </div>&nbsp; &nbsp; sleep 1
   <br>&nbsp; &nbsp; sync
   <div>
    done
   </div>
   <div>
    reboot
   </div>
   <div>
    <br>
   </div>
   <div>
    The visible effect of this is:
   </div>
   <div>
    * I see the web page open and fish swimming around the aquarium
   </div>
   <div>
    * After a couple of seconds one of a few things will happen:
   </div>
   <div>
    &nbsp; 1. The screen and mouse pointer completely freezes
   </div>
   <div>
    &nbsp; 2. The graphics will glitch out (partially, improperly rendered etc.)
   </div>
   <div>
    &nbsp; 3. Sometimes the web page will just go blank but I'll be able to move the mouse and close it
   </div>
   <div>
    * After this, there is about an 80% chance that my script will actually run the `reboot` command; the other 20% of the time I have to power off manually
    <br>
    <br>The errors I'm seeing in the dmesg log are various but here's a few of them:
    <br>*&nbsp;WARNING: CPU: 12 PID: 232 at drivers/gpu/drm/nouveau/nvif/vmm.c:68 nvif_vmm_put+0x6a/0x80 [nouveau]
    <br>*&nbsp;nouveau 0000:02:00.0: fifo: SCHED_ERROR 06 []
    <br>*&nbsp;nouveau 0000:02:00.0: fifo: runlist 0 update timeout
    <br>*&nbsp;nouveau 0000:02:00.0: gr: TRAP ch 3 [00fee57000 WebKitWebProces[1328]]
    <br>*&nbsp;nouveau 0000:02:00.0: gr: GPC0/PROP trap: 00000020 [RT_HEIGHT_OVERRUN] x = 336, y = 1176, format = 11, storage type = 0
    <br>
    <br>There is also an error that occurs /before/ I run my script at bootup which is
    <br>*&nbsp;nouveau 0000:02:00.0: bus: MMIO write of 80000136 FAULT at 10eb14 [ IBUS ]
    <br>
    <br>From epiphany I'm seeing errors like:
    <br>*&nbsp;Gdk-Message: 09:45:34.493: Error reading events from display: Connection reset by peer
    <br>*&nbsp;Gdk-Message: 09:53:08.281: Error flushing display: Broken pipe
    <br>*&nbsp;WebKitWebProcess: ../libdrm-2.4.100/nouveau/pushbuf.c:723: nouveau_pushbuf_data: Assertion `kref' failed.
    <br>*&nbsp;nouveau: kernel rejected pushbuf: Invalid argument
    <br>
    <br>I ran the script 10 times and I've uploaded the full logs here:&nbsp;
    <a href="https://easyupload.io/ieil63">https://easyupload.io/ieil63</a>
    <br>
    <br>Regards
    <br>Geoffrey Allott
   </div>
  </div> 
 </body>
</html>

--===============1871102133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1871102133==--
