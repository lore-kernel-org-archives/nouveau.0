From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to poweron GPU on GM204
 after dynamic poweroff
Date: Tue, 05 Apr 2016 01:25:24 +0000
Message-ID: <bug-94725-8800-nq9JzL2ONA@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1675874457=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1675874457==
Content-Type: multipart/alternative; boundary="14598195250.bc2B1.16937";
 charset="UTF-8"


--14598195250.bc2B1.16937
Date: Tue, 5 Apr 2016 01:25:24 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94725

--- Comment #14 from Efrem McCrimon <efremmc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This what I captured from dmesg.

PCI 02:00.0 is a 730 GTX w/1Gb DDR5
PCI 01:00.0 is a 960 GTX w/4Gb DDR5


Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: bios: version
84.06.26.00.2c
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: gr: using external
firmware
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: Direct firmware
load for nvidia/gm206/fecs_inst.bin failed with error -2
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: gr: failed to load
fecs_inst
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: disp: dcb 15 type 8
unknown
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: GART: 1048576
MiB
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: TMDS table
version 2.0
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB version 4.1
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 00:
01000f02 00020030
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 01:
02000f00 00000000
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 02:
04011f82 00020030
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 03:
02022f62 00020010
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 05:
02833f76 04400020
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 06:
02033f72 00020020
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 15:
01df5ff8 00000000
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB conn 00:
00001030
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB conn 01:
01000131
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB conn 02:
00010261
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB conn 03:
00020346
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB conn 05:
00000570
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: Pointer to
flat panel table invalid
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: unknown
connector type 70
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: failed to
create encoder 1/8/0: -19
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: Unknown-1 has
no encoders, removing
Apr 02 17:08:57 localhost kernel: nouveau 0000:01:00.0: DRM: MM: using COPY
for buffer copies
Apr 02 17:08:57 localhost kernel: nouveau 0000:01:00.0: DRM: allocated
1920x1080 fb: 0x60000, bo ffff88089ac02800
Apr 02 17:08:57 localhost kernel: nouveau 0000:01:00.0: fb0: nouveaufb
frame buffer device
Apr 02 17:08:57 localhost kernel: nouveau 0000:02:00.0: enabling device
(0000 -> 0003)
Apr 02 17:08:57 localhost kernel: nouveau 0000:02:00.0: NVIDIA GK208B
(b06070b1)
Apr 02 17:08:57 localhost kernel: nouveau 0000:02:00.0: bios: version
80.28.78.00.01
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: priv: HUB0: 086014
ffffffff (1f70820c)
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: fb: 1024 MiB GDDR5
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: VRAM: 1024 MiB
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: GART: 1048576
MiB
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: TMDS table
version 2.0
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB version 4.0
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB outp 00:
01000f02 00020030
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB outp 01:
02011f62 00020010
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB outp 02:
02022f10 00000000
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB conn 00:
00001031
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB conn 01:
00002161
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB conn 02:
00000200
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: MM: using COPY
for buffer copies
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: No connectors
reported connected with modes
Apr 02 17:08:59 localhost kernel: nouveau 0000:02:00.0: DRM: allocated
1024x768 fb: 0x60000, bo ffff88089a47c400
Apr 02 17:08:59 localhost kernel: nouveau 0000:02:00.0: fb1: nouveaufb
frame buffer device




Apr 02 17:09:01 localhost.localdomain kernel: mei_me 0000:00:16.0: enabling
device (0000 -> 0002)
Apr 02 17:09:01 localhost.localdomain kernel: snd_hda_intel 0000:01:00.1:
Disabling MSI
Apr 02 17:09:01 localhost.localdomain kernel: snd_hda_intel 0000:01:00.1:
Handle vga_switcheroo audio client
Apr 02 17:09:01 localhost.localdomain kernel: snd_hda_intel 0000:02:00.1:
Disabling MSI
Apr 02 17:09:01 localhost.localdomain kernel: snd_hda_intel 0000:02:00.1:
Handle vga_switcheroo audio client
Apr 02 17:09:02 localhost.localdomain kernel: snd_hda_intel 0000:00:1f.3:
failed to add i915 component master (-19)
Apr 02 17:09:02 localhost.localdomain kernel: e1000e 0000:00:1f.6:
Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
Apr 02 17:09:02 localhost.localdomain kernel: e1000e 0000:00:1f.6 eth1:
registered PHC clock
Apr 02 17:09:02 localhost.localdomain kernel: e1000e 0000:00:1f.6 eth1:
(PCI Express:2.5GT/s:Width x1) 00:1f:bc:0f:37:76
Apr 02 17:09:02 localhost.localdomain kernel: e1000e 0000:00:1f.6 eth1:
Intel(R) PRO/1000 Network Connection
Apr 02 17:09:02 localhost.localdomain kernel: e1000e 0000:00:1f.6 eth1:
MAC: 12, PHY: 12, PBA No: FFFFFF-0FF
Apr 02 17:09:03 localhost.localdomain kernel: e1000e 0000:00:1f.6
enp0s31f6: renamed from eth1
Apr 02 17:09:11 localhost.localdomain kernel: ahci 0000:00:17.0: port does
not support device sleep
Apr 02 17:09:29 localhost.localdomain kernel: e1000e 0000:00:1f.6
enp0s31f6: 10/100 speed: disabling TSO



On Fri, Apr 1, 2016 at 8:17 AM, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:

> *Comment # 13 <https://bugs.freedesktop.org/show_bug.cgi?id=94725#c13> on
> bug 94725 <https://bugs.freedesktop.org/show_bug.cgi?id=94725> from Karol
> Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> *
>
> (In reply to Rashed Abdel-Tawab from comment #10 <https://bugs.freedesktop.org/show_bug.cgi?id=94725#c10>)> Created attachment 122654 <https://bugs.freedesktop.org/attachment.cgi?id=122654> [details] <https://bugs.freedesktop.org/attachment.cgi?id=122654&action=edit>
> > dmesg using tentative fix
> >
> > Alexandre, using the tentative fix you uploaded it switches GPUs properly
> > now. Here is the dmesg from that since there are still some errors related
> > to power state in it. Also, for some reason lshw is returning this for the
> > nVidia GPU now:
> >
> > *-generic
> >                 description: Unassigned class
> >                 product: Illegal Vendor ID
> >                 vendor: Illegal Vendor ID
> >                 physical id: 0
> >                 bus info: pci@0000:01:00.0
> >                 version: ff
> >                 width: 32 bits
> >                 clock: 66MHz
> >                 capabilities: bus_master vga_palette cap_list rom
> >                 configuration: driver=nouveau latency=255 maxlatency=255
> > mingnt=255
> >                 resources: irq:129 memory:dc000000-dcffffff
> > memory:b0000000-bfffffff memory:c0000000-c1ffffff ioport:e000(size=128)
> > memory:dd000000-dd07ffff
> >
> > I don't know if that's related to this at all but before, if I set runpm=0
> > and run lshw, it would return the proper description (running it without
> > runpm would cause the system to hang)
>
> I have the same issue with bbswitch (and maybe vgaswitcheroo too). Basically
> this means that in d3cold we can't talke to the gpu and the information isn't
> cached or something like that.
>
> ------------------------------
> You are receiving this mail because:
>
>    - You are the assignee for the bug.
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14598195250.bc2B1.16937
Date: Tue, 5 Apr 2016 01:25:25 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725">bug 94725</a>
              from <span class="vcard"><a class="email" href="mailto:efremmc2&#64;gmail.com" title="Efrem McCrimon &lt;efremmc2&#64;gmail.com&gt;"> <span class="fn">Efrem McCrimon</span></a>
</span></b>
        <pre>This what I captured from dmesg.

PCI 02:00.0 is a 730 GTX w/1Gb DDR5
PCI 01:00.0 is a 960 GTX w/4Gb DDR5


Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: bios: version
84.06.26.00.2c
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: gr: using external
firmware
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: Direct firmware
load for nvidia/gm206/fecs_inst.bin failed with error -2
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: gr: failed to load
fecs_inst
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: disp: dcb 15 type 8
unknown
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: GART: 1048576
MiB
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: TMDS table
version 2.0
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB version 4.1
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 00:
01000f02 00020030
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 01:
02000f00 00000000
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 02:
04011f82 00020030
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 03:
02022f62 00020010
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 05:
02833f76 04400020
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 06:
02033f72 00020020
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 15:
01df5ff8 00000000
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB conn 00:
00001030
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB conn 01:
01000131
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB conn 02:
00010261
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB conn 03:
00020346
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB conn 05:
00000570
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: Pointer to
flat panel table invalid
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: unknown
connector type 70
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: failed to
create encoder 1/8/0: -19
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: Unknown-1 has
no encoders, removing
Apr 02 17:08:57 localhost kernel: nouveau 0000:01:00.0: DRM: MM: using COPY
for buffer copies
Apr 02 17:08:57 localhost kernel: nouveau 0000:01:00.0: DRM: allocated
1920x1080 fb: 0x60000, bo ffff88089ac02800
Apr 02 17:08:57 localhost kernel: nouveau 0000:01:00.0: fb0: nouveaufb
frame buffer device
Apr 02 17:08:57 localhost kernel: nouveau 0000:02:00.0: enabling device
(0000 -&gt; 0003)
Apr 02 17:08:57 localhost kernel: nouveau 0000:02:00.0: NVIDIA GK208B
(b06070b1)
Apr 02 17:08:57 localhost kernel: nouveau 0000:02:00.0: bios: version
80.28.78.00.01
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: priv: HUB0: 086014
ffffffff (1f70820c)
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: fb: 1024 MiB GDDR5
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: VRAM: 1024 MiB
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: GART: 1048576
MiB
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: TMDS table
version 2.0
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB version 4.0
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB outp 00:
01000f02 00020030
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB outp 01:
02011f62 00020010
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB outp 02:
02022f10 00000000
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB conn 00:
00001031
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB conn 01:
00002161
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB conn 02:
00000200
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: MM: using COPY
for buffer copies
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: No connectors
reported connected with modes
Apr 02 17:08:59 localhost kernel: nouveau 0000:02:00.0: DRM: allocated
1024x768 fb: 0x60000, bo ffff88089a47c400
Apr 02 17:08:59 localhost kernel: nouveau 0000:02:00.0: fb1: nouveaufb
frame buffer device




Apr 02 17:09:01 localhost.localdomain kernel: mei_me 0000:00:16.0: enabling
device (0000 -&gt; 0002)
Apr 02 17:09:01 localhost.localdomain kernel: snd_hda_intel 0000:01:00.1:
Disabling MSI
Apr 02 17:09:01 localhost.localdomain kernel: snd_hda_intel 0000:01:00.1:
Handle vga_switcheroo audio client
Apr 02 17:09:01 localhost.localdomain kernel: snd_hda_intel 0000:02:00.1:
Disabling MSI
Apr 02 17:09:01 localhost.localdomain kernel: snd_hda_intel 0000:02:00.1:
Handle vga_switcheroo audio client
Apr 02 17:09:02 localhost.localdomain kernel: snd_hda_intel 0000:00:1f.3:
failed to add i915 component master (-19)
Apr 02 17:09:02 localhost.localdomain kernel: e1000e 0000:00:1f.6:
Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
Apr 02 17:09:02 localhost.localdomain kernel: e1000e 0000:00:1f.6 eth1:
registered PHC clock
Apr 02 17:09:02 localhost.localdomain kernel: e1000e 0000:00:1f.6 eth1:
(PCI Express:2.5GT/s:Width x1) 00:1f:bc:0f:37:76
Apr 02 17:09:02 localhost.localdomain kernel: e1000e 0000:00:1f.6 eth1:
Intel(R) PRO/1000 Network Connection
Apr 02 17:09:02 localhost.localdomain kernel: e1000e 0000:00:1f.6 eth1:
MAC: 12, PHY: 12, PBA No: FFFFFF-0FF
Apr 02 17:09:03 localhost.localdomain kernel: e1000e 0000:00:1f.6
enp0s31f6: renamed from eth1
Apr 02 17:09:11 localhost.localdomain kernel: ahci 0000:00:17.0: port does
not support device sleep
Apr 02 17:09:29 localhost.localdomain kernel: e1000e 0000:00:1f.6
enp0s31f6: 10/100 speed: disabling TSO



On Fri, Apr 1, 2016 at 8:17 AM, &lt;<a href="mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt; wrote:

<span class="quote">&gt; *<a href="show_bug.cgi?id=94725#c13">Comment # 13</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="show_bug.cgi?id=94725#c13">https://bugs.freedesktop.org/show_bug.cgi?id=94725#c13</a>&gt; on
&gt; <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="show_bug.cgi?id=94725">bug 94725</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="show_bug.cgi?id=94725">https://bugs.freedesktop.org/show_bug.cgi?id=94725</a>&gt; from Karol
&gt; Herbst &lt;<a href="mailto:freedesktop&#64;karolherbst.de">freedesktop&#64;karolherbst.de</a>&gt; *</span >
&gt;
<span class="quote">&gt; (In reply to Rashed Abdel-Tawab from <a href="show_bug.cgi?id=94725#c10">comment #10</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="show_bug.cgi?id=94725#c10">https://bugs.freedesktop.org/show_bug.cgi?id=94725#c10</a>&gt;)&gt; Created <span class=""><a href="attachment.cgi?id=122654" name="attach_122654" title="dmesg using tentative fix">attachment 122654</a> <a href="attachment.cgi?id=122654&amp;action=edit" title="dmesg using tentative fix">[details]</a></span> &lt;<a href="https://bugs.freedesktop.org/attachment.cgi?id=122654">https://bugs.freedesktop.org/attachment.cgi?id=122654</a>&gt; [details] &lt;<a href="https://bugs.freedesktop.org/attachment.cgi?id=122654&amp;action=edit">https://bugs.freedesktop.org/attachment.cgi?id=122654&amp;action=edit</a>&gt;
&gt; &gt; dmesg using tentative fix
&gt; &gt;
&gt; &gt; Alexandre, using the tentative fix you uploaded it switches GPUs properly
&gt; &gt; now. Here is the dmesg from that since there are still some errors related
&gt; &gt; to power state in it. Also, for some reason lshw is returning this for the
&gt; &gt; nVidia GPU now:
&gt; &gt;
&gt; &gt; *-generic
&gt; &gt;                 description: Unassigned class
&gt; &gt;                 product: Illegal Vendor ID
&gt; &gt;                 vendor: Illegal Vendor ID
&gt; &gt;                 physical id: 0
&gt; &gt;                 bus info: pci&#64;0000:01:00.0
&gt; &gt;                 version: ff
&gt; &gt;                 width: 32 bits
&gt; &gt;                 clock: 66MHz
&gt; &gt;                 capabilities: bus_master vga_palette cap_list rom
&gt; &gt;                 configuration: driver=nouveau latency=255 maxlatency=255
&gt; &gt; mingnt=255
&gt; &gt;                 resources: irq:129 memory:dc000000-dcffffff
&gt; &gt; memory:b0000000-bfffffff memory:c0000000-c1ffffff ioport:e000(size=128)
&gt; &gt; memory:dd000000-dd07ffff
&gt; &gt;
&gt; &gt; I don't know if that's related to this at all but before, if I set runpm=0
&gt; &gt; and run lshw, it would return the proper description (running it without
&gt; &gt; runpm would cause the system to hang)</span >
&gt;
<span class="quote">&gt; I have the same issue with bbswitch (and maybe vgaswitcheroo too). Basically
&gt; this means that in d3cold we can't talke to the gpu and the information isn't
&gt; cached or something like that.</span >
&gt;
<span class="quote">&gt; ------------------------------
&gt; You are receiving this mail because:</span >
&gt;
<span class="quote">&gt;    - You are the assignee for the bug.</span >
&gt;
&gt;
<span class="quote">&gt; _______________________________________________
&gt; Nouveau mailing list
&gt; <a href="mailto:Nouveau&#64;lists.freedesktop.org">Nouveau&#64;lists.freedesktop.org</a>
&gt; <a href="https://lists.freedesktop.org/mailman/listinfo/nouveau">https://lists.freedesktop.org/mailman/listinfo/nouveau</a></span >
&gt;
&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14598195250.bc2B1.16937--

--===============1675874457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1675874457==--
