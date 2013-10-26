From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70875] [NVC1] NOUVEAU(0): [drm] failed to set drm
 interface version
Date: Sat, 26 Oct 2013 14:41:22 +0000
Message-ID: <bug-70875-8800-I57YRF40A2@http.bugs.freedesktop.org/>
References: <bug-70875-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2135457298=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70875-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2135457298==
Content-Type: multipart/alternative; boundary="1382798482.aa6bFdD1.24552"; charset="us-ascii"


--1382798482.aa6bFdD1.24552
Date: Sat, 26 Oct 2013 14:41:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70875

--- Comment #4 from Marcin Zajaczkowski <mszpak-5tc4TXWwyLM@public.gmane.org> ---
Thanks for your reply!

This is the first time I try bumblebee mostly to disabled NVidia card to
increase a battery work time.

It seems I can have a hardware mux.

$ xrandr --listproviders
Providers: number : 3
Provider 0: id: 0x8e cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
2 outputs: 4 associated providers: 2 name:Intel
Provider 1: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 2 associated providers: 2 name:nouveau
Provider 2: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 2 associated providers: 2 name:nouveau
(I don't know why NVidia card is listed twice)

and was able to start glxinfo with both card using Prime as described here:
http://nouveau.freedesktop.org/wiki/Optimus/#usingoptimusprime


A system log section before I installed bumblebee (more complete log attached):
kernel: [    1.703270] VGA switcheroo: detected Optimus DSM method
\_SB_.PCI0.PEGR.GFX0 handle
kernel: [    1.703288] nouveau 0000:01:00.0: enabling device (0004 -> 0007)
kernel: [    1.739039] [drm] Supports vblank timestamp caching Rev 1
(10.10.2010).
kernel: [    1.739040] [drm] Driver supports precise vblank timestamp query.
(...)
kernel: [    2.143215] [drm] Initialized i915 1.6.0 20080730 for 0000:00:02.0
on minor 0
(...)
kernel: [    2.642413] vga_switcheroo: enabled
(...)
kernel: [    2.756832] [drm] Initialized nouveau 1.1.1 20120801 for
0000:01:00.0 on minor 1

*With* bumblebee I have later also:
kernel: [    5.951667] bbswitch: module verification failed: signature and/or
required key missing - tainting kernel
kernel: [    5.952491] bbswitch: version 0.7
kernel: [    5.952499] bbswitch: Found integrated VGA device 0000:00:02.0:
\_SB_.PCI0.GFX0
kernel: [    5.952505] bbswitch: Found discrete VGA device 0000:01:00.0:
\_SB_.PCI0.PEGR.GFX0
kernel: [    5.952518] ACPI Warning: \_SB_.PCI0.PEGR.GFX0._DSM: Argument #4
type mismatch - Found [Buffer], ACPI requires [Package]
(20130517/nsarguments-95)
kernel: [    5.952645] bbswitch: detected an Optimus _DSM function
kernel: [    5.952655] bbswitch: Succesfully loaded. Discrete card 0000:01:00.0
is on
kernel: [    5.984317] [TTM] Finalizing pool allocator
kernel: [    5.984324] [TTM] Finalizing DMA pool allocator
kernel: [    5.984564] [TTM] Zone  kernel: Used memory at exit: 0 kiB
kernel: [    5.984569] [TTM] Zone   dma32: Used memory at exit: 0 kiB
kernel: [    5.984572] vga_switcheroo: disabled
kernel: [    5.986835] [drm] Module unloaded
kernel: [    5.987886] bbswitch: disabling discrete graphics
kernel: [    5.987897] ACPI Warning: \_SB_.PCI0.PEGR.GFX0._DSM: Argument #4
type mismatch - Found [Buffer], ACPI requires [Package]
(20130517/nsarguments-95)
kernel: [    5.998773] pci 0000:01:00.0: Refused to change power state,
currently in D0

and:
xrandr --listproviders
Providers: number : 1
Provider 0: id: 0x45 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
2 outputs: 4 associated providers: 0 name:Intel
(which is fine if I just want to have NVidia card disabled to increase battery
work time)


I also tried to use switcheroo to force X server to use discrete graphics after
X restart using instructions from:
https://fedoraproject.org/wiki/QA:Testcase_vga_switcheroo
but I ended with black both screens (even switching to a text console was not
visible - an external monitor had not imput signal).

kernel: [ 1321.653945] vga_switcheroo: client 1 refused switch
kernel: [ 1321.653950] vga_switcheroo: setting delayed switch to client 1
(... - X restart)
kernel: [ 1360.615922] vga_switcheroo: processing delayed switch to 1
kernel: [ 1360.615931] vga_switcheroo: client 1 refused switch
kernel: [ 1360.616169] vga_switcheroo: processing delayed switch to 1
kernel: [ 1360.764972] fbcon: Remapping primary device, fb0, to tty 1-63
kernel: [ 1360.854562] i915: switched off

A complete log from that time period attached.

After a restart I checked old Xorg log (attached) and it seems that X server
was able to start with nouveau driver without mentioned drm error.

In that case maybe you have a suspicion what can cause a mentioned "[drm]
failed to set drm interface version" when using bumblebee?

The second question could be - Why did I end with black screens after that
operation?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382798482.aa6bFdD1.24552
Date: Sat, 26 Oct 2013 14:41:22 +0000
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
   title="NEW --- - [NVC1] NOUVEAU(0): [drm] failed to set drm interface version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70875#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] NOUVEAU(0): [drm] failed to set drm interface version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70875">bug 70875</a>
              from <span class="vcard"><a class="email" href="mailto:mszpak&#64;wp.pl" title="Marcin Zajaczkowski &lt;mszpak&#64;wp.pl&gt;"> <span class="fn">Marcin Zajaczkowski</span></a>
</span></b>
        <pre>Thanks for your reply!

This is the first time I try bumblebee mostly to disabled NVidia card to
increase a battery work time.

It seems I can have a hardware mux.

$ xrandr --listproviders
Providers: number : 3
Provider 0: id: 0x8e cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
2 outputs: 4 associated providers: 2 name:Intel
Provider 1: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 2 associated providers: 2 name:nouveau
Provider 2: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 2 associated providers: 2 name:nouveau
(I don't know why NVidia card is listed twice)

and was able to start glxinfo with both card using Prime as described here:
<a href="http://nouveau.freedesktop.org/wiki/Optimus/#usingoptimusprime">http://nouveau.freedesktop.org/wiki/Optimus/#usingoptimusprime</a>


A system log section before I installed bumblebee (more complete log attached):
kernel: [    1.703270] VGA switcheroo: detected Optimus DSM method
\_SB_.PCI0.PEGR.GFX0 handle
kernel: [    1.703288] nouveau 0000:01:00.0: enabling device (0004 -&gt; 0007)
kernel: [    1.739039] [drm] Supports vblank timestamp caching Rev 1
(10.10.2010).
kernel: [    1.739040] [drm] Driver supports precise vblank timestamp query.
(...)
kernel: [    2.143215] [drm] Initialized i915 1.6.0 20080730 for 0000:00:02.0
on minor 0
(...)
kernel: [    2.642413] vga_switcheroo: enabled
(...)
kernel: [    2.756832] [drm] Initialized nouveau 1.1.1 20120801 for
0000:01:00.0 on minor 1

*With* bumblebee I have later also:
kernel: [    5.951667] bbswitch: module verification failed: signature and/or
required key missing - tainting kernel
kernel: [    5.952491] bbswitch: version 0.7
kernel: [    5.952499] bbswitch: Found integrated VGA device 0000:00:02.0:
\_SB_.PCI0.GFX0
kernel: [    5.952505] bbswitch: Found discrete VGA device 0000:01:00.0:
\_SB_.PCI0.PEGR.GFX0
kernel: [    5.952518] ACPI Warning: \_SB_.PCI0.PEGR.GFX0._DSM: Argument #4
type mismatch - Found [Buffer], ACPI requires [Package]
(20130517/nsarguments-95)
kernel: [    5.952645] bbswitch: detected an Optimus _DSM function
kernel: [    5.952655] bbswitch: Succesfully loaded. Discrete card 0000:01:00.0
is on
kernel: [    5.984317] [TTM] Finalizing pool allocator
kernel: [    5.984324] [TTM] Finalizing DMA pool allocator
kernel: [    5.984564] [TTM] Zone  kernel: Used memory at exit: 0 kiB
kernel: [    5.984569] [TTM] Zone   dma32: Used memory at exit: 0 kiB
kernel: [    5.984572] vga_switcheroo: disabled
kernel: [    5.986835] [drm] Module unloaded
kernel: [    5.987886] bbswitch: disabling discrete graphics
kernel: [    5.987897] ACPI Warning: \_SB_.PCI0.PEGR.GFX0._DSM: Argument #4
type mismatch - Found [Buffer], ACPI requires [Package]
(20130517/nsarguments-95)
kernel: [    5.998773] pci 0000:01:00.0: Refused to change power state,
currently in D0

and:
xrandr --listproviders
Providers: number : 1
Provider 0: id: 0x45 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
2 outputs: 4 associated providers: 0 name:Intel
(which is fine if I just want to have NVidia card disabled to increase battery
work time)


I also tried to use switcheroo to force X server to use discrete graphics after
X restart using instructions from:
<a href="https://fedoraproject.org/wiki/QA:Testcase_vga_switcheroo">https://fedoraproject.org/wiki/QA:Testcase_vga_switcheroo</a>
but I ended with black both screens (even switching to a text console was not
visible - an external monitor had not imput signal).

kernel: [ 1321.653945] vga_switcheroo: client 1 refused switch
kernel: [ 1321.653950] vga_switcheroo: setting delayed switch to client 1
(... - X restart)
kernel: [ 1360.615922] vga_switcheroo: processing delayed switch to 1
kernel: [ 1360.615931] vga_switcheroo: client 1 refused switch
kernel: [ 1360.616169] vga_switcheroo: processing delayed switch to 1
kernel: [ 1360.764972] fbcon: Remapping primary device, fb0, to tty 1-63
kernel: [ 1360.854562] i915: switched off

A complete log from that time period attached.

After a restart I checked old Xorg log (attached) and it seems that X server
was able to start with nouveau driver without mentioned drm error.

In that case maybe you have a suspicion what can cause a mentioned &quot;[drm]
failed to set drm interface version&quot; when using bumblebee?

The second question could be - Why did I end with black screens after that
operation?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382798482.aa6bFdD1.24552--

--===============2135457298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2135457298==--
