From: Efrem Mc <efremmc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 94725] Nouveau driver fails to poweron GPU on
 GM204 after dynamic poweroff
Date: Mon, 4 Apr 2016 18:25:21 -0700
Message-ID: <CAEhOZrcjxCZNz=Unbq_0Ko6dicZk0NPy3XJSQMehs8DQCiiZqw@mail.gmail.com>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
 <bug-94725-8800-0111GoOQVN@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a1143e5420b36a4052fb2b8ae
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-0111GoOQVN-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--001a1143e5420b36a4052fb2b8ae
Content-Type: multipart/alternative; boundary=001a1143e5420b369e052fb2b8ac

--001a1143e5420b369e052fb2b8ac
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

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
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB version 4.=
1
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
Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB version 4.=
0
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

> *Comment # 13 <https://bugs.freedesktop.org/show_bug.cgi?id=3D94725#c13> =
on
> bug 94725 <https://bugs.freedesktop.org/show_bug.cgi?id=3D94725> from Kar=
ol
> Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> *
>
> (In reply to Rashed Abdel-Tawab from comment #10 <https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D94725#c10>)> Created attachment 122654 <https://bug=
s.freedesktop.org/attachment.cgi?id=3D122654> [details] <https://bugs.freed=
esktop.org/attachment.cgi?id=3D122654&action=3Dedit>
> > dmesg using tentative fix
> >
> > Alexandre, using the tentative fix you uploaded it switches GPUs proper=
ly
> > now. Here is the dmesg from that since there are still some errors rela=
ted
> > to power state in it. Also, for some reason lshw is returning this for =
the
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
> >                 configuration: driver=3Dnouveau latency=3D255 maxlatenc=
y=3D255
> > mingnt=3D255
> >                 resources: irq:129 memory:dc000000-dcffffff
> > memory:b0000000-bfffffff memory:c0000000-c1ffffff ioport:e000(size=3D12=
8)
> > memory:dd000000-dd07ffff
> >
> > I don't know if that's related to this at all but before, if I set runp=
m=3D0
> > and run lshw, it would return the proper description (running it withou=
t
> > runpm would cause the system to hang)
>
> I have the same issue with bbswitch (and maybe vgaswitcheroo too). Basica=
lly
> this means that in d3cold we can't talke to the gpu and the information i=
sn't
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

--001a1143e5420b369e052fb2b8ac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>This what I captured from dmesg.=C2=A0 <br><br><=
/div>PCI 02:00.0 is a 730 GTX w/1Gb DDR5<br></div>PCI 01:00.0 is a 960 GTX =
w/4Gb DDR5<br><div><div><div><div><br><br>Apr 02 17:08:56 localhost kernel:=
 nouveau 0000:01:00.0: bios: version 84.06.26.00.2c<br>Apr 02 17:08:56 loca=
lhost kernel: nouveau 0000:01:00.0: gr: using external firmware<br>Apr 02 1=
7:08:56 localhost kernel: nouveau 0000:01:00.0: Direct firmware load for nv=
idia/gm206/fecs_inst.bin failed with error -2<br>Apr 02 17:08:56 localhost =
kernel: nouveau 0000:01:00.0: gr: failed to load fecs_inst<br>Apr 02 17:08:=
56 localhost kernel: nouveau 0000:01:00.0: disp: dcb 15 type 8 unknown<br>A=
pr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: fb: 4096 MiB GDDR5<b=
r>Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: VRAM: 4096 M=
iB<br>Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: GART: 10=
48576 MiB<br>Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: T=
MDS table version 2.0<br>Apr 02 17:08:56 localhost kernel: nouveau 0000:01:=
00.0: DRM: DCB version 4.1<br>Apr 02 17:08:56 localhost kernel: nouveau 000=
0:01:00.0: DRM: DCB outp 00: 01000f02 00020030<br>Apr 02 17:08:56 localhost=
 kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00000000<br>Apr 0=
2 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: 04011f=
82 00020030<br>Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM:=
 DCB outp 03: 02022f62 00020010<br>Apr 02 17:08:56 localhost kernel: nouvea=
u 0000:01:00.0: DRM: DCB outp 05: 02833f76 04400020<br>Apr 02 17:08:56 loca=
lhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f72 00020020<br>=
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB outp 15: 0=
1df5ff8 00000000<br>Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0:=
 DRM: DCB conn 00: 00001030<br>Apr 02 17:08:56 localhost kernel: nouveau 00=
00:01:00.0: DRM: DCB conn 01: 01000131<br>Apr 02 17:08:56 localhost kernel:=
 nouveau 0000:01:00.0: DRM: DCB conn 02: 00010261<br>Apr 02 17:08:56 localh=
ost kernel: nouveau 0000:01:00.0: DRM: DCB conn 03: 00020346<br>Apr 02 17:0=
8:56 localhost kernel: nouveau 0000:01:00.0: DRM: DCB conn 05: 00000570<br>=
Apr 02 17:08:56 localhost kernel: nouveau 0000:01:00.0: DRM: Pointer to fla=
t panel table invalid<br>Apr 02 17:08:56 localhost kernel: nouveau 0000:01:=
00.0: DRM: unknown connector type 70<br>Apr 02 17:08:56 localhost kernel: n=
ouveau 0000:01:00.0: DRM: failed to create encoder 1/8/0: -19<br>Apr 02 17:=
08:56 localhost kernel: nouveau 0000:01:00.0: DRM: Unknown-1 has no encoder=
s, removing<br>Apr 02 17:08:57 localhost kernel: nouveau 0000:01:00.0: DRM:=
 MM: using COPY for buffer copies<br>Apr 02 17:08:57 localhost kernel: nouv=
eau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, bo ffff88089ac02800=
<br>Apr 02 17:08:57 localhost kernel: nouveau 0000:01:00.0: fb0: nouveaufb =
frame buffer device<br>Apr 02 17:08:57 localhost kernel: nouveau 0000:02:00=
.0: enabling device (0000 -&gt; 0003)<br>Apr 02 17:08:57 localhost kernel: =
nouveau 0000:02:00.0: NVIDIA GK208B (b06070b1)<br>Apr 02 17:08:57 localhost=
 kernel: nouveau 0000:02:00.0: bios: version 80.28.78.00.01<br>Apr 02 17:08=
:58 localhost kernel: nouveau 0000:02:00.0: priv: HUB0: 086014 ffffffff (1f=
70820c)<br>Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: fb: 1024=
 MiB GDDR5<br>Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: =
VRAM: 1024 MiB<br>Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: D=
RM: GART: 1048576 MiB<br>Apr 02 17:08:58 localhost kernel: nouveau 0000:02:=
00.0: DRM: TMDS table version 2.0<br>Apr 02 17:08:58 localhost kernel: nouv=
eau 0000:02:00.0: DRM: DCB version 4.0<br>Apr 02 17:08:58 localhost kernel:=
 nouveau 0000:02:00.0: DRM: DCB outp 00: 01000f02 00020030<br>Apr 02 17:08:=
58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB outp 01: 02011f62 00020=
010<br>Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: DRM: DCB out=
p 02: 02022f10 00000000<br>Apr 02 17:08:58 localhost kernel: nouveau 0000:0=
2:00.0: DRM: DCB conn 00: 00001031<br>Apr 02 17:08:58 localhost kernel: nou=
veau 0000:02:00.0: DRM: DCB conn 01: 00002161<br>Apr 02 17:08:58 localhost =
kernel: nouveau 0000:02:00.0: DRM: DCB conn 02: 00000200<br>Apr 02 17:08:58=
 localhost kernel: nouveau 0000:02:00.0: DRM: MM: using COPY for buffer cop=
ies<br>Apr 02 17:08:58 localhost kernel: nouveau 0000:02:00.0: No connector=
s reported connected with modes<br>Apr 02 17:08:59 localhost kernel: nouvea=
u 0000:02:00.0: DRM: allocated 1024x768 fb: 0x60000, bo ffff88089a47c400<br=
>Apr 02 17:08:59 localhost kernel: nouveau 0000:02:00.0: fb1: nouveaufb fra=
me buffer device<br><br><br><br><br>Apr 02 17:09:01 localhost.localdomain k=
ernel: mei_me 0000:00:16.0: enabling device (0000 -&gt; 0002)<br>Apr 02 17:=
09:01 localhost.localdomain kernel: snd_hda_intel 0000:01:00.1: Disabling M=
SI<br>Apr 02 17:09:01 localhost.localdomain kernel: snd_hda_intel 0000:01:0=
0.1: Handle vga_switcheroo audio client<br>Apr 02 17:09:01 localhost.locald=
omain kernel: snd_hda_intel 0000:02:00.1: Disabling MSI<br>Apr 02 17:09:01 =
localhost.localdomain kernel: snd_hda_intel 0000:02:00.1: Handle vga_switch=
eroo audio client<br>Apr 02 17:09:02 localhost.localdomain kernel: snd_hda_=
intel 0000:00:1f.3: failed to add i915 component master (-19)<br>Apr 02 17:=
09:02 localhost.localdomain kernel: e1000e 0000:00:1f.6: Interrupt Throttli=
ng Rate (ints/sec) set to dynamic conservative mode<br>Apr 02 17:09:02 loca=
lhost.localdomain kernel: e1000e 0000:00:1f.6 eth1: registered PHC clock<br=
>Apr 02 17:09:02 localhost.localdomain kernel: e1000e 0000:00:1f.6 eth1: (P=
CI Express:2.5GT/s:Width x1) 00:1f:bc:0f:37:76<br>Apr 02 17:09:02 localhost=
.localdomain kernel: e1000e 0000:00:1f.6 eth1: Intel(R) PRO/1000 Network Co=
nnection<br>Apr 02 17:09:02 localhost.localdomain kernel: e1000e 0000:00:1f=
.6 eth1: MAC: 12, PHY: 12, PBA No: FFFFFF-0FF<br>Apr 02 17:09:03 localhost.=
localdomain kernel: e1000e 0000:00:1f.6 enp0s31f6: renamed from eth1<br>Apr=
 02 17:09:11 localhost.localdomain kernel: ahci 0000:00:17.0: port does not=
 support device sleep<br>Apr 02 17:09:29 localhost.localdomain kernel: e100=
0e 0000:00:1f.6 enp0s31f6: 10/100 speed: disabling TSO<br><br><br></div></d=
iv></div></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Apr 1, 2016 at 8:17 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org" target=3D"_blank">bugzilla-daemon@freede=
sktop.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
   =20
     =20
   =20
    <div>
      <p>
        </p><div>
            <b><a title=3D"NEW - Nouveau driver fails to poweron GPU on GM2=
04 after dynamic poweroff" href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D94725#c13" target=3D"_blank">Comment # 13</a>
              on <a title=3D"NEW - Nouveau driver fails to poweron GPU on G=
M204 after dynamic poweroff" href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D94725" target=3D"_blank">bug 94725</a>
              from <span><a href=3D"mailto:freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org" titl=
e=3D"Karol Herbst &lt;freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org&gt;" target=3D"_blank"> <s=
pan>Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Rashed Abdel-Tawab from <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D94725#c10" target=3D"_blank">comment #10</=
a>)
<span class=3D""><span>&gt; Created <span><a href=3D"https://bugs.freedeskt=
op.org/attachment.cgi?id=3D122654" name=3D"m_6388218857151565490_attach_122=
654" title=3D"dmesg using tentative fix" target=3D"_blank">attachment 12265=
4</a> <a href=3D"https://bugs.freedesktop.org/attachment.cgi?id=3D122654&am=
p;action=3Dedit" title=3D"dmesg using tentative fix" target=3D"_blank">[det=
ails]</a></span>
&gt; dmesg using tentative fix
&gt;=20
&gt; Alexandre, using the tentative fix you uploaded it switches GPUs prope=
rly
&gt; now. Here is the dmesg from that since there are still some errors rel=
ated
&gt; to power state in it. Also, for some reason lshw is returning this for=
 the
&gt; nVidia GPU now:
&gt;=20
&gt; *-generic
&gt;                 description: Unassigned class
&gt;                 product: Illegal Vendor ID
&gt;                 vendor: Illegal Vendor ID
&gt;                 physical id: 0
&gt;                 bus info: pci@0000:01:00.0
&gt;                 version: ff
&gt;                 width: 32 bits
&gt;                 clock: 66MHz
&gt;                 capabilities: bus_master vga_palette cap_list rom
&gt;                 configuration: driver=3Dnouveau latency=3D255 maxlaten=
cy=3D255
&gt; mingnt=3D255
&gt;                 resources: irq:129 memory:dc000000-dcffffff
&gt; memory:b0000000-bfffffff memory:c0000000-c1ffffff ioport:e000(size=3D1=
28)
&gt; memory:dd000000-dd07ffff
&gt;=20
&gt; I don&#39;t know if that&#39;s related to this at all but before, if I=
 set runpm=3D0
&gt; and run lshw, it would return the proper description (running it witho=
ut
&gt; runpm would cause the system to hang)</span></span>

I have the same issue with bbswitch (and maybe vgaswitcheroo too). Basicall=
y
this means that in d3cold we can&#39;t talke to the gpu and the information=
 isn&#39;t
cached or something like that.</pre>
        </div>
      <p></p><span class=3D"">
      <hr>
      <span>You are receiving this mail because:</span>
     =20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </span></div>
<br>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a><br>
<br></blockquote></div><br></div>

--001a1143e5420b369e052fb2b8ac--

--001a1143e5420b36a4052fb2b8ae
Content-Type: text/plain; charset=US-ASCII; name="_msg_kernel_pci-23.txt"
Content-Disposition: attachment; filename="_msg_kernel_pci-23.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_immqoxd80

LS0gTG9ncyBiZWdpbiBhdCBTYXQgMjAxNi0wNC0wMiAxNzowODo1NiBFRFQsIGVuZCBhdCBTYXQg
MjAxNi0wNC0wMiAxOTozNjo0NyBFRFQuIC0tCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2Vy
bmVsOiBwY2kgMDAwMDowMDowMC4wOiBbODA4NjoxOTFmXSB0eXBlIDAwIGNsYXNzIDB4MDYwMDAw
CkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDowMS4wOiBbODA4
NjoxOTAxXSB0eXBlIDAxIGNsYXNzIDB4MDYwNDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qg
a2VybmVsOiBwY2kgMDAwMDowMDowMS4wOiBQTUUjIHN1cHBvcnRlZCBmcm9tIEQwIEQzaG90IEQz
Y29sZApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDA6MDEuMDog
U3lzdGVtIHdha2V1cCBkaXNhYmxlZCBieSBBQ1BJCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qg
a2VybmVsOiBwY2kgMDAwMDowMDowMS4xOiBbODA4NjoxOTA1XSB0eXBlIDAxIGNsYXNzIDB4MDYw
NDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDowMS4xOiBQ
TUUjIHN1cHBvcnRlZCBmcm9tIEQwIEQzaG90IEQzY29sZApBcHIgMDIgMTc6MDg6NTYgbG9jYWxo
b3N0IGtlcm5lbDogcGNpIDAwMDA6MDA6MDEuMTogU3lzdGVtIHdha2V1cCBkaXNhYmxlZCBieSBB
Q1BJCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxNC4wOiBb
ODA4NjphMTJmXSB0eXBlIDAwIGNsYXNzIDB4MGMwMzMwCkFwciAwMiAxNzowODo1NiBsb2NhbGhv
c3Qga2VybmVsOiBwY2kgMDAwMDowMDoxNC4wOiByZWcgMHgxMDogW21lbSAweGRhMTMwMDAwLTB4
ZGExM2ZmZmYgNjRiaXRdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAw
MDowMDoxNC4wOiBQTUUjIHN1cHBvcnRlZCBmcm9tIEQzaG90IEQzY29sZApBcHIgMDIgMTc6MDg6
NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDA6MTQuMDogU3lzdGVtIHdha2V1cCBkaXNh
YmxlZCBieSBBQ1BJCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDow
MDoxNC4yOiBbODA4NjphMTMxXSB0eXBlIDAwIGNsYXNzIDB4MTE4MDAwCkFwciAwMiAxNzowODo1
NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxNC4yOiByZWcgMHgxMDogW21lbSAweGRh
MTUxMDAwLTB4ZGExNTFmZmYgNjRiaXRdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVs
OiBwY2kgMDAwMDowMDoxNS4wOiBbODA4NjphMTYwXSB0eXBlIDAwIGNsYXNzIDB4MTE4MDAwCkFw
ciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxNS4wOiByZWcgMHgx
MDogW21lbSAweGRhMTUwMDAwLTB4ZGExNTBmZmYgNjRiaXRdCkFwciAwMiAxNzowODo1NiBsb2Nh
bGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxNS4xOiBbODA4NjphMTYxXSB0eXBlIDAwIGNsYXNz
IDB4MTE4MDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDox
NS4xOiByZWcgMHgxMDogW21lbSAweGRhMTRmMDAwLTB4ZGExNGZmZmYgNjRiaXRdCkFwciAwMiAx
NzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxNi4wOiBbODA4NjphMTNhXSB0
eXBlIDAwIGNsYXNzIDB4MDc4MDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBw
Y2kgMDAwMDowMDoxNi4wOiByZWcgMHgxMDogW21lbSAweGRhMTRlMDAwLTB4ZGExNGVmZmYgNjRi
aXRdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxNi4wOiBQ
TUUjIHN1cHBvcnRlZCBmcm9tIEQzaG90CkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVs
OiBwY2kgMDAwMDowMDoxNy4wOiBbODA4NjphMTAyXSB0eXBlIDAwIGNsYXNzIDB4MDEwNjAxCkFw
ciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxNy4wOiByZWcgMHgx
MDogW21lbSAweGRhMTQ4MDAwLTB4ZGExNDlmZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qg
a2VybmVsOiBwY2kgMDAwMDowMDoxNy4wOiByZWcgMHgxNDogW21lbSAweGRhMTRkMDAwLTB4ZGEx
NGQwZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxNy4w
OiByZWcgMHgxODogW2lvICAweGYwNTAtMHhmMDU3XQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0
IGtlcm5lbDogcGNpIDAwMDA6MDA6MTcuMDogcmVnIDB4MWM6IFtpbyAgMHhmMDQwLTB4ZjA0M10K
QXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAwOjE3LjA6IHJlZyAw
eDIwOiBbaW8gIDB4ZjAyMC0weGYwM2ZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVs
OiBwY2kgMDAwMDowMDoxNy4wOiByZWcgMHgyNDogW21lbSAweGRhMTRjMDAwLTB4ZGExNGM3ZmZd
CkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxNy4wOiBQTUUj
IHN1cHBvcnRlZCBmcm9tIEQzaG90CkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBw
Y2kgMDAwMDowMDoxZC4wOiBbODA4NjphMTE4XSB0eXBlIDAxIGNsYXNzIDB4MDYwNDAwCkFwciAw
MiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxZC4wOiBQTUUjIHN1cHBv
cnRlZCBmcm9tIEQwIEQzaG90IEQzY29sZApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5l
bDogcGNpIDAwMDA6MDA6MWQuMDogU3lzdGVtIHdha2V1cCBkaXNhYmxlZCBieSBBQ1BJCkFwciAw
MiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxZS4wOiBbODA4NjphMTI3
XSB0eXBlIDAwIGNsYXNzIDB4MTE4MDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVs
OiBwY2kgMDAwMDowMDoxZS4wOiByZWcgMHgxMDogW21lbSAweGRhMTRiMDAwLTB4ZGExNGJmZmYg
NjRiaXRdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxZi4w
OiBbODA4NjphMTQ1XSB0eXBlIDAwIGNsYXNzIDB4MDYwMTAwCkFwciAwMiAxNzowODo1NiBsb2Nh
bGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxZi4yOiBbODA4NjphMTIxXSB0eXBlIDAwIGNsYXNz
IDB4MDU4MDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDox
Zi4yOiByZWcgMHgxMDogW21lbSAweGRhMTQ0MDAwLTB4ZGExNDdmZmZdCkFwciAwMiAxNzowODo1
NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxZi4zOiBbODA4NjphMTcwXSB0eXBlIDAw
IGNsYXNzIDB4MDQwMzAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAw
MDowMDoxZi4zOiByZWcgMHgxMDogW21lbSAweGRhMTQwMDAwLTB4ZGExNDNmZmYgNjRiaXRdCkFw
ciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxZi4zOiByZWcgMHgy
MDogW21lbSAweGRhMTIwMDAwLTB4ZGExMmZmZmYgNjRiaXRdCkFwciAwMiAxNzowODo1NiBsb2Nh
bGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxZi4zOiBQTUUjIHN1cHBvcnRlZCBmcm9tIEQzaG90
IEQzY29sZApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDA6MWYu
MzogU3lzdGVtIHdha2V1cCBkaXNhYmxlZCBieSBBQ1BJCkFwciAwMiAxNzowODo1NiBsb2NhbGhv
c3Qga2VybmVsOiBwY2kgMDAwMDowMDoxZi40OiBbODA4NjphMTIzXSB0eXBlIDAwIGNsYXNzIDB4
MGMwNTAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxZi40
OiByZWcgMHgxMDogW21lbSAweGRhMTRhMDAwLTB4ZGExNGEwZmYgNjRiaXRdCkFwciAwMiAxNzow
ODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxZi40OiByZWcgMHgyMDogW2lvICAw
eGYwMDAtMHhmMDFmXQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6
MDA6MWYuNjogWzgwODY6MTViOF0gdHlwZSAwMCBjbGFzcyAweDAyMDAwMApBcHIgMDIgMTc6MDg6
NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDA6MWYuNjogcmVnIDB4MTA6IFttZW0gMHhk
YTEwMDAwMC0weGRhMTFmZmZmXQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNp
IDAwMDA6MDA6MWYuNjogUE1FIyBzdXBwb3J0ZWQgZnJvbSBEMCBEM2hvdCBEM2NvbGQKQXByIDAy
IDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAwOjFmLjY6IFN5c3RlbSB3YWtl
dXAgZGlzYWJsZWQgYnkgQUNQSQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNp
IDAwMDA6MDE6MDAuMDogWzEwZGU6MTQwMV0gdHlwZSAwMCBjbGFzcyAweDAzMDAwMApBcHIgMDIg
MTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDE6MDAuMDogcmVnIDB4MTA6IFtt
ZW0gMHhkZDAwMDAwMC0weGRkZmZmZmZmXQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5l
bDogcGNpIDAwMDA6MDE6MDAuMDogcmVnIDB4MTQ6IFttZW0gMHhhMDAwMDAwMC0weGFmZmZmZmZm
IDY0Yml0IHByZWZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDow
MTowMC4wOiByZWcgMHgxYzogW21lbSAweGIwMDAwMDAwLTB4YjFmZmZmZmYgNjRiaXQgcHJlZl0K
QXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAxOjAwLjA6IHJlZyAw
eDI0OiBbaW8gIDB4ZTAwMC0weGUwN2ZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVs
OiBwY2kgMDAwMDowMTowMC4wOiByZWcgMHgzMDogW21lbSAweGRlMDAwMDAwLTB4ZGUwN2ZmZmYg
cHJlZl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAxOjAwLjA6
IFN5c3RlbSB3YWtldXAgZGlzYWJsZWQgYnkgQUNQSQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0
IGtlcm5lbDogcGNpIDAwMDA6MDE6MDAuMTogWzEwZGU6MGZiYV0gdHlwZSAwMCBjbGFzcyAweDA0
MDMwMApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDE6MDAuMTog
cmVnIDB4MTA6IFttZW0gMHhkZTA4MDAwMC0weGRlMDgzZmZmXQpBcHIgMDIgMTc6MDg6NTYgbG9j
YWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDA6MDEuMDogUENJIGJyaWRnZSB0byBbYnVzIDAxXQpB
cHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDA6MDEuMDogICBicmlk
Z2Ugd2luZG93IFtpbyAgMHhlMDAwLTB4ZWZmZl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBr
ZXJuZWw6IHBjaSAwMDAwOjAwOjAxLjA6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4ZGQwMDAwMDAt
MHhkZTBmZmZmZl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAw
OjAxLjA6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4YTAwMDAwMDAtMHhiMWZmZmZmZiA2NGJpdCBw
cmVmXQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDI6MDAuMDog
WzEwZGU6MTI4N10gdHlwZSAwMCBjbGFzcyAweDAzMDAwMApBcHIgMDIgMTc6MDg6NTYgbG9jYWxo
b3N0IGtlcm5lbDogcGNpIDAwMDA6MDI6MDAuMDogcmVnIDB4MTA6IFttZW0gMHhkYjAwMDAwMC0w
eGRiZmZmZmZmXQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDI6
MDAuMDogcmVnIDB4MTQ6IFttZW0gMHhiODAwMDAwMC0weGJmZmZmZmZmIDY0Yml0IHByZWZdCkFw
ciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMjowMC4wOiByZWcgMHgx
YzogW21lbSAweGMwMDAwMDAwLTB4YzFmZmZmZmYgNjRiaXQgcHJlZl0KQXByIDAyIDE3OjA4OjU2
IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAyOjAwLjA6IHJlZyAweDI0OiBbaW8gIDB4ZDAw
MC0weGQwN2ZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMjow
MC4wOiByZWcgMHgzMDogW21lbSAweGRjMDAwMDAwLTB4ZGMwN2ZmZmYgcHJlZl0KQXByIDAyIDE3
OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAyOjAwLjA6IFN5c3RlbSB3YWtldXAg
ZGlzYWJsZWQgYnkgQUNQSQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAw
MDA6MDI6MDAuMTogWzEwZGU6MGUwZl0gdHlwZSAwMCBjbGFzcyAweDA0MDMwMApBcHIgMDIgMTc6
MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDI6MDAuMTogcmVnIDB4MTA6IFttZW0g
MHhkYzA4MDAwMC0weGRjMDgzZmZmXQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDog
cGNpIDAwMDA6MDA6MDEuMTogUENJIGJyaWRnZSB0byBbYnVzIDAyXQpBcHIgMDIgMTc6MDg6NTYg
bG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDA6MDEuMTogICBicmlkZ2Ugd2luZG93IFtpbyAg
MHhkMDAwLTB4ZGZmZl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAw
OjAwOjAxLjE6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4ZGIwMDAwMDAtMHhkYzBmZmZmZl0KQXBy
IDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAwOjAxLjE6ICAgYnJpZGdl
IHdpbmRvdyBbbWVtIDB4YjgwMDAwMDAtMHhjMWZmZmZmZiA2NGJpdCBwcmVmXQpBcHIgMDIgMTc6
MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDM6MDAuMDogWzgwODY6MTU2Yl0gdHlw
ZSAwMSBjbGFzcyAweDA2MDQwMApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNp
IDAwMDA6MDM6MDAuMDogc3VwcG9ydHMgRDEgRDIKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBr
ZXJuZWw6IHBjaSAwMDAwOjAzOjAwLjA6IFBNRSMgc3VwcG9ydGVkIGZyb20gRDAgRDEgRDIgRDNo
b3QgRDNjb2xkCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMzow
MC4wOiBTeXN0ZW0gd2FrZXVwIGRpc2FibGVkIGJ5IEFDUEkKQXByIDAyIDE3OjA4OjU2IGxvY2Fs
aG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAwOjFkLjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAwMy0zYl0K
QXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAwOjFkLjA6ICAgYnJp
ZGdlIHdpbmRvdyBbbWVtIDB4YzQwMDAwMDAtMHhkYTBmZmZmZl0KQXByIDAyIDE3OjA4OjU2IGxv
Y2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAwOjFkLjA6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4
NzAwMDAwMDAtMHg5MWZmZmZmZiA2NGJpdCBwcmVmXQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0
IGtlcm5lbDogcGNpIDAwMDA6MDM6MDAuMDogYnJpZGdlIGNvbmZpZ3VyYXRpb24gaW52YWxpZCAo
W2J1cyAwMC0wMF0pLCByZWNvbmZpZ3VyaW5nCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2Vy
bmVsOiBwY2kgMDAwMDowNDowMC4wOiBbODA4NjoxNTZiXSB0eXBlIDAxIGNsYXNzIDB4MDYwNDAw
CkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMC4wOiBzdXBw
b3J0cyBEMSBEMgpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6
MDAuMDogUE1FIyBzdXBwb3J0ZWQgZnJvbSBEMCBEMSBEMiBEM2hvdCBEM2NvbGQKQXByIDAyIDE3
OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAzLjA6IFs4MDg2OjE1NmJdIHR5
cGUgMDEgY2xhc3MgMHgwNjA0MDAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBj
aSAwMDAwOjA0OjAzLjA6IHN1cHBvcnRzIEQxIEQyCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qg
a2VybmVsOiBwY2kgMDAwMDowNDowMy4wOiBQTUUjIHN1cHBvcnRlZCBmcm9tIEQwIEQxIEQyIEQz
aG90IEQzY29sZApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6
MDQuMDogWzgwODY6MTU2Yl0gdHlwZSAwMSBjbGFzcyAweDA2MDQwMApBcHIgMDIgMTc6MDg6NTYg
bG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6MDQuMDogc3VwcG9ydHMgRDEgRDIKQXByIDAy
IDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjA0LjA6IFBNRSMgc3VwcG9y
dGVkIGZyb20gRDAgRDEgRDIgRDNob3QgRDNjb2xkCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qg
a2VybmVsOiBwY2kgMDAwMDowMzowMC4wOiBQQ0kgYnJpZGdlIHRvIFtidXMgMDQtZmZdCkFwciAw
MiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMzowMC4wOiAgIGJyaWRnZSB3
aW5kb3cgW2lvICAweDAwMDAtMHgwZmZmXQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5l
bDogcGNpIDAwMDA6MDM6MDAuMDogICBicmlkZ2Ugd2luZG93IFttZW0gMHgwMDAwMDAwMC0weDAw
MGZmZmZmXQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDM6MDAu
MDogICBicmlkZ2Ugd2luZG93IFttZW0gMHgwMDAwMDAwMC0weDAwMGZmZmZmIDY0Yml0IHByZWZd
CkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMC4wOiBicmlk
Z2UgY29uZmlndXJhdGlvbiBpbnZhbGlkIChbYnVzIDAwLTAwXSksIHJlY29uZmlndXJpbmcKQXBy
IDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAzLjA6IGJyaWRnZSBj
b25maWd1cmF0aW9uIGludmFsaWQgKFtidXMgMDAtMDBdKSwgcmVjb25maWd1cmluZwpBcHIgMDIg
MTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6MDQuMDogYnJpZGdlIGNvbmZp
Z3VyYXRpb24gaW52YWxpZCAoW2J1cyAwMC0wMF0pLCByZWNvbmZpZ3VyaW5nCkFwciAwMiAxNzow
ODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNTowMC4wOiBbODA4NjoxNTZhXSB0eXBl
IDAwIGNsYXNzIDB4MDg4MDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kg
MDAwMDowNTowMC4wOiByZWcgMHgxMDogW21lbSAweDAwMDAwMDAwLTB4MDAwM2ZmZmZdCkFwciAw
MiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNTowMC4wOiByZWcgMHgxNDog
W21lbSAweDAwMDAwMDAwLTB4MDAwMDBmZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2Vy
bmVsOiBwY2kgMDAwMDowNTowMC4wOiBzdXBwb3J0cyBEMSBEMgpBcHIgMDIgMTc6MDg6NTYgbG9j
YWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDU6MDAuMDogUE1FIyBzdXBwb3J0ZWQgZnJvbSBEMCBE
MSBEMiBEM2hvdCBEM2NvbGQKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAw
MDAwOjA0OjAwLjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAwNS1mZl0KQXByIDAyIDE3OjA4OjU2IGxv
Y2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAwLjA6ICAgYnJpZGdlIHdpbmRvdyBbaW8gIDB4
MDAwMC0weDBmZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDow
NDowMC4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAweDAwMDAwMDAwLTB4MDAwZmZmZmZdCkFwciAw
MiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMC4wOiAgIGJyaWRnZSB3
aW5kb3cgW21lbSAweDAwMDAwMDAwLTB4MDAwZmZmZmYgNjRiaXQgcHJlZl0KQXByIDAyIDE3OjA4
OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAzLjA6IFBDSSBicmlkZ2UgdG8gW2J1
cyAwNi1mZl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAz
LjA6ICAgYnJpZGdlIHdpbmRvdyBbaW8gIDB4MDAwMC0weDBmZmZdCkFwciAwMiAxNzowODo1NiBs
b2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMy4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAw
eDAwMDAwMDAwLTB4MDAwZmZmZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBw
Y2kgMDAwMDowNDowMy4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAweDAwMDAwMDAwLTB4MDAwZmZm
ZmYgNjRiaXQgcHJlZl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAw
OjA0OjA0LjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAwNy1mZl0KQXByIDAyIDE3OjA4OjU2IGxvY2Fs
aG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjA0LjA6ICAgYnJpZGdlIHdpbmRvdyBbaW8gIDB4MDAw
MC0weDBmZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDow
NC4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAweDAwMDAwMDAwLTB4MDAwZmZmZmZdCkFwciAwMiAx
NzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowNC4wOiAgIGJyaWRnZSB3aW5k
b3cgW21lbSAweDAwMDAwMDAwLTB4MDAwZmZmZmYgNjRiaXQgcHJlZl0KQXByIDAyIDE3OjA4OjU2
IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAwLjA6IGJyaWRnZSB3aW5kb3cgW2lvICAw
eDEwMDAtMHgwZmZmXSB0byBbYnVzIDA1XSBhZGRfc2l6ZSAxMDAwCkFwciAwMiAxNzowODo1NiBs
b2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMC4wOiBicmlkZ2Ugd2luZG93IFttZW0gMHgw
MDEwMDAwMC0weDAwMGZmZmZmIDY0Yml0IHByZWZdIHRvIFtidXMgMDVdIGFkZF9zaXplIDIwMDAw
MCBhZGRfYWxpZ24gMTAwMDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kg
MDAwMDowNDowMC4wOiBicmlkZ2Ugd2luZG93IFttZW0gMHgwMDEwMDAwMC0weDAwMWZmZmZmXSB0
byBbYnVzIDA1XSBhZGRfc2l6ZSAyMDAwMDAgYWRkX2FsaWduIDEwMDAwMApBcHIgMDIgMTc6MDg6
NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6MDMuMDogYnJpZGdlIHdpbmRvdyBbaW8g
IDB4MTAwMC0weDBmZmZdIHRvIFtidXMgMDZdIGFkZF9zaXplIDEwMDAKQXByIDAyIDE3OjA4OjU2
IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAzLjA6IGJyaWRnZSB3aW5kb3cgW21lbSAw
eDAwMTAwMDAwLTB4MDAwZmZmZmYgNjRiaXQgcHJlZl0gdG8gW2J1cyAwNl0gYWRkX3NpemUgMjAw
MDAwIGFkZF9hbGlnbiAxMDAwMDAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBj
aSAwMDAwOjA0OjAzLjA6IGJyaWRnZSB3aW5kb3cgW21lbSAweDAwMTAwMDAwLTB4MDAwZmZmZmZd
IHRvIFtidXMgMDZdIGFkZF9zaXplIDIwMDAwMCBhZGRfYWxpZ24gMTAwMDAwCkFwciAwMiAxNzow
ODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowNC4wOiBicmlkZ2Ugd2luZG93IFtp
byAgMHgxMDAwLTB4MGZmZl0gdG8gW2J1cyAwN10gYWRkX3NpemUgMTAwMApBcHIgMDIgMTc6MDg6
NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6MDQuMDogYnJpZGdlIHdpbmRvdyBbbWVt
IDB4MDAxMDAwMDAtMHgwMDBmZmZmZiA2NGJpdCBwcmVmXSB0byBbYnVzIDA3XSBhZGRfc2l6ZSAy
MDAwMDAgYWRkX2FsaWduIDEwMDAwMApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDog
cGNpIDAwMDA6MDQ6MDQuMDogYnJpZGdlIHdpbmRvdyBbbWVtIDB4MDAxMDAwMDAtMHgwMDBmZmZm
Zl0gdG8gW2J1cyAwN10gYWRkX3NpemUgMjAwMDAwIGFkZF9hbGlnbiAxMDAwMDAKQXByIDAyIDE3
OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAwLjA6IHJlc1sxM109W2lvICAw
eDEwMDAtMHgwZmZmXSByZXNfdG9fZGV2X3JlcyBhZGRfc2l6ZSAxMDAwIG1pbl9hbGlnbiAxMDAw
CkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMy4wOiByZXNb
MTNdPVtpbyAgMHgxMDAwLTB4MGZmZl0gcmVzX3RvX2Rldl9yZXMgYWRkX3NpemUgMTAwMCBtaW5f
YWxpZ24gMTAwMApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6
MDQuMDogcmVzWzEzXT1baW8gIDB4MTAwMC0weDBmZmZdIHJlc190b19kZXZfcmVzIGFkZF9zaXpl
IDEwMDAgbWluX2FsaWduIDEwMDAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBj
aSAwMDAwOjAzOjAwLjA6IGJyaWRnZSB3aW5kb3cgW2lvICAweDEwMDAtMHgwZmZmXSB0byBbYnVz
IDA0LTA3XSBhZGRfc2l6ZSAzMDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBw
Y2kgMDAwMDowNDowMC4wOiByZXNbMTVdPVttZW0gMHgwMDEwMDAwMC0weDAwMGZmZmZmIDY0Yml0
IHByZWZdIHJlc190b19kZXZfcmVzIGFkZF9zaXplIDIwMDAwMCBtaW5fYWxpZ24gMTAwMDAwCkFw
ciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMC4wOiByZXNbMTVd
PVttZW0gMHgwMDEwMDAwMC0weDAwMGZmZmZmIDY0Yml0IHByZWZdIHJlc190b19kZXZfcmVzIGFk
ZF9zaXplIDIwMDAwMCBtaW5fYWxpZ24gMTAwMDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qg
a2VybmVsOiBwY2kgMDAwMDowNDowMy4wOiByZXNbMTVdPVttZW0gMHgwMDEwMDAwMC0weDAwMGZm
ZmZmIDY0Yml0IHByZWZdIHJlc190b19kZXZfcmVzIGFkZF9zaXplIDIwMDAwMCBtaW5fYWxpZ24g
MTAwMDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMy4w
OiByZXNbMTVdPVttZW0gMHgwMDEwMDAwMC0weDAwMGZmZmZmIDY0Yml0IHByZWZdIHJlc190b19k
ZXZfcmVzIGFkZF9zaXplIDIwMDAwMCBtaW5fYWxpZ24gMTAwMDAwCkFwciAwMiAxNzowODo1NiBs
b2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowNC4wOiByZXNbMTVdPVttZW0gMHgwMDEwMDAw
MC0weDAwMGZmZmZmIDY0Yml0IHByZWZdIHJlc190b19kZXZfcmVzIGFkZF9zaXplIDIwMDAwMCBt
aW5fYWxpZ24gMTAwMDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAw
MDowNDowNC4wOiByZXNbMTVdPVttZW0gMHgwMDEwMDAwMC0weDAwMGZmZmZmIDY0Yml0IHByZWZd
IHJlc190b19kZXZfcmVzIGFkZF9zaXplIDIwMDAwMCBtaW5fYWxpZ24gMTAwMDAwCkFwciAwMiAx
NzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMzowMC4wOiBicmlkZ2Ugd2luZG93
IFttZW0gMHgwMDEwMDAwMC0weDAwMGZmZmZmIDY0Yml0IHByZWZdIHRvIFtidXMgMDQtMDddIGFk
ZF9zaXplIDYwMDAwMCBhZGRfYWxpZ24gMTAwMDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qg
a2VybmVsOiBwY2kgMDAwMDowNDowMC4wOiByZXNbMTRdPVttZW0gMHgwMDEwMDAwMC0weDAwMWZm
ZmZmXSByZXNfdG9fZGV2X3JlcyBhZGRfc2l6ZSAyMDAwMDAgbWluX2FsaWduIDEwMDAwMApBcHIg
MDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6MDAuMDogcmVzWzE0XT1b
bWVtIDB4MDAxMDAwMDAtMHgwMDFmZmZmZl0gcmVzX3RvX2Rldl9yZXMgYWRkX3NpemUgMjAwMDAw
IG1pbl9hbGlnbiAxMDAwMDAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAw
MDAwOjA0OjAzLjA6IHJlc1sxNF09W21lbSAweDAwMTAwMDAwLTB4MDAwZmZmZmZdIHJlc190b19k
ZXZfcmVzIGFkZF9zaXplIDIwMDAwMCBtaW5fYWxpZ24gMTAwMDAwCkFwciAwMiAxNzowODo1NiBs
b2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMy4wOiByZXNbMTRdPVttZW0gMHgwMDEwMDAw
MC0weDAwMGZmZmZmXSByZXNfdG9fZGV2X3JlcyBhZGRfc2l6ZSAyMDAwMDAgbWluX2FsaWduIDEw
MDAwMApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6MDQuMDog
cmVzWzE0XT1bbWVtIDB4MDAxMDAwMDAtMHgwMDBmZmZmZl0gcmVzX3RvX2Rldl9yZXMgYWRkX3Np
emUgMjAwMDAwIG1pbl9hbGlnbiAxMDAwMDAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJu
ZWw6IHBjaSAwMDAwOjA0OjA0LjA6IHJlc1sxNF09W21lbSAweDAwMTAwMDAwLTB4MDAwZmZmZmZd
IHJlc190b19kZXZfcmVzIGFkZF9zaXplIDIwMDAwMCBtaW5fYWxpZ24gMTAwMDAwCkFwciAwMiAx
NzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMzowMC4wOiBicmlkZ2Ugd2luZG93
IFttZW0gMHgwMDEwMDAwMC0weDAwMWZmZmZmXSB0byBbYnVzIDA0LTA3XSBhZGRfc2l6ZSA2MDAw
MDAgYWRkX2FsaWduIDEwMDAwMApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNp
IDAwMDA6MDM6MDAuMDogcmVzWzEzXT1baW8gIDB4MTAwMC0weDBmZmZdIHJlc190b19kZXZfcmVz
IGFkZF9zaXplIDMwMDAgbWluX2FsaWduIDEwMDAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBr
ZXJuZWw6IHBjaSAwMDAwOjAwOjFkLjA6IGJyaWRnZSB3aW5kb3cgW2lvICAweDEwMDAtMHgwZmZm
XSB0byBbYnVzIDAzLTNiXSBhZGRfc2l6ZSAzMDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qg
a2VybmVsOiBwY2kgMDAwMDowMDoxZC4wOiByZXNbMTNdPVtpbyAgMHgxMDAwLTB4MGZmZl0gcmVz
X3RvX2Rldl9yZXMgYWRkX3NpemUgMzAwMCBtaW5fYWxpZ24gMTAwMApBcHIgMDIgMTc6MDg6NTYg
bG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDA6MWQuMDogcmVzWzEzXT1baW8gIDB4MTAwMC0w
eDNmZmZdIHJlc190b19kZXZfcmVzIGFkZF9zaXplIDMwMDAgbWluX2FsaWduIDEwMDAKQXByIDAy
IDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAwOjFkLjA6IEJBUiAxMzogYXNz
aWduZWQgW2lvICAweDIwMDAtMHg0ZmZmXQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5l
bDogcGNpIDAwMDA6MDA6MDEuMDogUENJIGJyaWRnZSB0byBbYnVzIDAxXQpBcHIgMDIgMTc6MDg6
NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDA6MDEuMDogICBicmlkZ2Ugd2luZG93IFtp
byAgMHhlMDAwLTB4ZWZmZl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAw
MDAwOjAwOjAxLjA6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4ZGQwMDAwMDAtMHhkZTBmZmZmZl0K
QXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAwOjAxLjA6ICAgYnJp
ZGdlIHdpbmRvdyBbbWVtIDB4YTAwMDAwMDAtMHhiMWZmZmZmZiA2NGJpdCBwcmVmXQpBcHIgMDIg
MTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDA6MDEuMTogUENJIGJyaWRnZSB0
byBbYnVzIDAyXQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDA6
MDEuMTogICBicmlkZ2Ugd2luZG93IFtpbyAgMHhkMDAwLTB4ZGZmZl0KQXByIDAyIDE3OjA4OjU2
IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAwOjAxLjE6ICAgYnJpZGdlIHdpbmRvdyBbbWVt
IDB4ZGIwMDAwMDAtMHhkYzBmZmZmZl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6
IHBjaSAwMDAwOjAwOjAxLjE6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4YjgwMDAwMDAtMHhjMWZm
ZmZmZiA2NGJpdCBwcmVmXQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAw
MDA6MDM6MDAuMDogcmVzWzE0XT1bbWVtIDB4MDAxMDAwMDAtMHgwMDFmZmZmZl0gcmVzX3RvX2Rl
dl9yZXMgYWRkX3NpemUgNjAwMDAwIG1pbl9hbGlnbiAxMDAwMDAKQXByIDAyIDE3OjA4OjU2IGxv
Y2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAzOjAwLjA6IHJlc1sxNF09W21lbSAweDAwMTAwMDAw
LTB4MDA3ZmZmZmZdIHJlc190b19kZXZfcmVzIGFkZF9zaXplIDYwMDAwMCBtaW5fYWxpZ24gMTAw
MDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMzowMC4wOiBy
ZXNbMTVdPVttZW0gMHgwMDEwMDAwMC0weDAwMGZmZmZmIDY0Yml0IHByZWZdIHJlc190b19kZXZf
cmVzIGFkZF9zaXplIDYwMDAwMCBtaW5fYWxpZ24gMTAwMDAwCkFwciAwMiAxNzowODo1NiBsb2Nh
bGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMzowMC4wOiByZXNbMTVdPVttZW0gMHgwMDEwMDAwMC0w
eDAwNmZmZmZmIDY0Yml0IHByZWZdIHJlc190b19kZXZfcmVzIGFkZF9zaXplIDYwMDAwMCBtaW5f
YWxpZ24gMTAwMDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDow
MzowMC4wOiByZXNbMTNdPVtpbyAgMHgxMDAwLTB4MGZmZl0gcmVzX3RvX2Rldl9yZXMgYWRkX3Np
emUgMzAwMCBtaW5fYWxpZ24gMTAwMApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDog
cGNpIDAwMDA6MDM6MDAuMDogcmVzWzEzXT1baW8gIDB4MTAwMC0weDNmZmZdIHJlc190b19kZXZf
cmVzIGFkZF9zaXplIDMwMDAgbWluX2FsaWduIDEwMDAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9z
dCBrZXJuZWw6IHBjaSAwMDAwOjAzOjAwLjA6IEJBUiAxNDogYXNzaWduZWQgW21lbSAweGM0MDAw
MDAwLTB4YzQ2ZmZmZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAw
MDowMzowMC4wOiBCQVIgMTU6IGFzc2lnbmVkIFttZW0gMHg3MDAwMDAwMC0weDcwNWZmZmZmIDY0
Yml0IHByZWZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMzow
MC4wOiBCQVIgMTM6IGFzc2lnbmVkIFtpbyAgMHgyMDAwLTB4NGZmZl0KQXByIDAyIDE3OjA4OjU2
IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAwLjA6IHJlc1sxNF09W21lbSAweDAwMTAw
MDAwLTB4MDAxZmZmZmZdIHJlc190b19kZXZfcmVzIGFkZF9zaXplIDIwMDAwMCBtaW5fYWxpZ24g
MTAwMDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMC4w
OiByZXNbMTRdPVttZW0gMHgwMDEwMDAwMC0weDAwM2ZmZmZmXSByZXNfdG9fZGV2X3JlcyBhZGRf
c2l6ZSAyMDAwMDAgbWluX2FsaWduIDEwMDAwMApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtl
cm5lbDogcGNpIDAwMDA6MDQ6MDAuMDogcmVzWzE1XT1bbWVtIDB4MDAxMDAwMDAtMHgwMDBmZmZm
ZiA2NGJpdCBwcmVmXSByZXNfdG9fZGV2X3JlcyBhZGRfc2l6ZSAyMDAwMDAgbWluX2FsaWduIDEw
MDAwMApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6MDAuMDog
cmVzWzE1XT1bbWVtIDB4MDAxMDAwMDAtMHgwMDJmZmZmZiA2NGJpdCBwcmVmXSByZXNfdG9fZGV2
X3JlcyBhZGRfc2l6ZSAyMDAwMDAgbWluX2FsaWduIDEwMDAwMApBcHIgMDIgMTc6MDg6NTYgbG9j
YWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6MDMuMDogcmVzWzE0XT1bbWVtIDB4MDAxMDAwMDAt
MHgwMDBmZmZmZl0gcmVzX3RvX2Rldl9yZXMgYWRkX3NpemUgMjAwMDAwIG1pbl9hbGlnbiAxMDAw
MDAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAzLjA6IHJl
c1sxNF09W21lbSAweDAwMTAwMDAwLTB4MDAyZmZmZmZdIHJlc190b19kZXZfcmVzIGFkZF9zaXpl
IDIwMDAwMCBtaW5fYWxpZ24gMTAwMDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVs
OiBwY2kgMDAwMDowNDowMy4wOiByZXNbMTVdPVttZW0gMHgwMDEwMDAwMC0weDAwMGZmZmZmIDY0
Yml0IHByZWZdIHJlc190b19kZXZfcmVzIGFkZF9zaXplIDIwMDAwMCBtaW5fYWxpZ24gMTAwMDAw
CkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMy4wOiByZXNb
MTVdPVttZW0gMHgwMDEwMDAwMC0weDAwMmZmZmZmIDY0Yml0IHByZWZdIHJlc190b19kZXZfcmVz
IGFkZF9zaXplIDIwMDAwMCBtaW5fYWxpZ24gMTAwMDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhv
c3Qga2VybmVsOiBwY2kgMDAwMDowNDowNC4wOiByZXNbMTRdPVttZW0gMHgwMDEwMDAwMC0weDAw
MGZmZmZmXSByZXNfdG9fZGV2X3JlcyBhZGRfc2l6ZSAyMDAwMDAgbWluX2FsaWduIDEwMDAwMApB
cHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6MDQuMDogcmVzWzE0
XT1bbWVtIDB4MDAxMDAwMDAtMHgwMDJmZmZmZl0gcmVzX3RvX2Rldl9yZXMgYWRkX3NpemUgMjAw
MDAwIG1pbl9hbGlnbiAxMDAwMDAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBj
aSAwMDAwOjA0OjA0LjA6IHJlc1sxNV09W21lbSAweDAwMTAwMDAwLTB4MDAwZmZmZmYgNjRiaXQg
cHJlZl0gcmVzX3RvX2Rldl9yZXMgYWRkX3NpemUgMjAwMDAwIG1pbl9hbGlnbiAxMDAwMDAKQXBy
IDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjA0LjA6IHJlc1sxNV09
W21lbSAweDAwMTAwMDAwLTB4MDAyZmZmZmYgNjRiaXQgcHJlZl0gcmVzX3RvX2Rldl9yZXMgYWRk
X3NpemUgMjAwMDAwIG1pbl9hbGlnbiAxMDAwMDAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBr
ZXJuZWw6IHBjaSAwMDAwOjA0OjAwLjA6IHJlc1sxM109W2lvICAweDEwMDAtMHgwZmZmXSByZXNf
dG9fZGV2X3JlcyBhZGRfc2l6ZSAxMDAwIG1pbl9hbGlnbiAxMDAwCkFwciAwMiAxNzowODo1NiBs
b2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMC4wOiByZXNbMTNdPVtpbyAgMHgxMDAwLTB4
MWZmZl0gcmVzX3RvX2Rldl9yZXMgYWRkX3NpemUgMTAwMCBtaW5fYWxpZ24gMTAwMApBcHIgMDIg
MTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6MDMuMDogcmVzWzEzXT1baW8g
IDB4MTAwMC0weDBmZmZdIHJlc190b19kZXZfcmVzIGFkZF9zaXplIDEwMDAgbWluX2FsaWduIDEw
MDAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAzLjA6IHJl
c1sxM109W2lvICAweDEwMDAtMHgxZmZmXSByZXNfdG9fZGV2X3JlcyBhZGRfc2l6ZSAxMDAwIG1p
bl9hbGlnbiAxMDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDow
NDowNC4wOiByZXNbMTNdPVtpbyAgMHgxMDAwLTB4MGZmZl0gcmVzX3RvX2Rldl9yZXMgYWRkX3Np
emUgMTAwMCBtaW5fYWxpZ24gMTAwMApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDog
cGNpIDAwMDA6MDQ6MDQuMDogcmVzWzEzXT1baW8gIDB4MTAwMC0weDFmZmZdIHJlc190b19kZXZf
cmVzIGFkZF9zaXplIDEwMDAgbWluX2FsaWduIDEwMDAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9z
dCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAwLjA6IEJBUiAxNDogYXNzaWduZWQgW21lbSAweGM0MDAw
MDAwLTB4YzQyZmZmZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAw
MDowNDowMC4wOiBCQVIgMTU6IGFzc2lnbmVkIFttZW0gMHg3MDAwMDAwMC0weDcwMWZmZmZmIDY0
Yml0IHByZWZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDow
My4wOiBCQVIgMTQ6IGFzc2lnbmVkIFttZW0gMHhjNDMwMDAwMC0weGM0NGZmZmZmXQpBcHIgMDIg
MTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6MDMuMDogQkFSIDE1OiBhc3Np
Z25lZCBbbWVtIDB4NzAyMDAwMDAtMHg3MDNmZmZmZiA2NGJpdCBwcmVmXQpBcHIgMDIgMTc6MDg6
NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6MDQuMDogQkFSIDE0OiBhc3NpZ25lZCBb
bWVtIDB4YzQ1MDAwMDAtMHhjNDZmZmZmZl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJu
ZWw6IHBjaSAwMDAwOjA0OjA0LjA6IEJBUiAxNTogYXNzaWduZWQgW21lbSAweDcwNDAwMDAwLTB4
NzA1ZmZmZmYgNjRiaXQgcHJlZl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBj
aSAwMDAwOjA0OjAwLjA6IEJBUiAxMzogYXNzaWduZWQgW2lvICAweDIwMDAtMHgyZmZmXQpBcHIg
MDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpIDAwMDA6MDQ6MDMuMDogQkFSIDEzOiBh
c3NpZ25lZCBbaW8gIDB4MzAwMC0weDNmZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2Vy
bmVsOiBwY2kgMDAwMDowNDowNC4wOiBCQVIgMTM6IGFzc2lnbmVkIFtpbyAgMHg0MDAwLTB4NGZm
Zl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA1OjAwLjA6IEJB
UiAwOiBhc3NpZ25lZCBbbWVtIDB4YzQwMDAwMDAtMHhjNDAzZmZmZl0KQXByIDAyIDE3OjA4OjU2
IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA1OjAwLjA6IEJBUiAxOiBhc3NpZ25lZCBbbWVt
IDB4YzQwNDAwMDAtMHhjNDA0MGZmZl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6
IHBjaSAwMDAwOjA0OjAwLjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAwNV0KQXByIDAyIDE3OjA4OjU2
IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAwLjA6ICAgYnJpZGdlIHdpbmRvdyBbaW8g
IDB4MjAwMC0weDJmZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAw
MDowNDowMC4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAweGM0MDAwMDAwLTB4YzQyZmZmZmZdCkFw
ciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMC4wOiAgIGJyaWRn
ZSB3aW5kb3cgW21lbSAweDcwMDAwMDAwLTB4NzAxZmZmZmYgNjRiaXQgcHJlZl0KQXByIDAyIDE3
OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAzLjA6IFBDSSBicmlkZ2UgdG8g
W2J1cyAwNl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjA0OjAz
LjA6ICAgYnJpZGdlIHdpbmRvdyBbaW8gIDB4MzAwMC0weDNmZmZdCkFwciAwMiAxNzowODo1NiBs
b2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowMy4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAw
eGM0MzAwMDAwLTB4YzQ0ZmZmZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBw
Y2kgMDAwMDowNDowMy4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAweDcwMjAwMDAwLTB4NzAzZmZm
ZmYgNjRiaXQgcHJlZl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAw
OjA0OjA0LjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAwN10KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9z
dCBrZXJuZWw6IHBjaSAwMDAwOjA0OjA0LjA6ICAgYnJpZGdlIHdpbmRvdyBbaW8gIDB4NDAwMC0w
eDRmZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowNC4w
OiAgIGJyaWRnZSB3aW5kb3cgW21lbSAweGM0NTAwMDAwLTB4YzQ2ZmZmZmZdCkFwciAwMiAxNzow
ODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowNDowNC4wOiAgIGJyaWRnZSB3aW5kb3cg
W21lbSAweDcwNDAwMDAwLTB4NzA1ZmZmZmYgNjRiaXQgcHJlZl0KQXByIDAyIDE3OjA4OjU2IGxv
Y2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAzOjAwLjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAwNC0w
N10KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAzOjAwLjA6ICAg
YnJpZGdlIHdpbmRvdyBbaW8gIDB4MjAwMC0weDRmZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhv
c3Qga2VybmVsOiBwY2kgMDAwMDowMzowMC4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAweGM0MDAw
MDAwLTB4YzQ2ZmZmZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAw
MDowMzowMC4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAweDcwMDAwMDAwLTB4NzA1ZmZmZmYgNjRi
aXQgcHJlZl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAwOjFk
LjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAwMy0zYl0KQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBr
ZXJuZWw6IHBjaSAwMDAwOjAwOjFkLjA6ICAgYnJpZGdlIHdpbmRvdyBbaW8gIDB4MjAwMC0weDRm
ZmZdCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxZC4wOiAg
IGJyaWRnZSB3aW5kb3cgW21lbSAweGM0MDAwMDAwLTB4ZGEwZmZmZmZdCkFwciAwMiAxNzowODo1
NiBsb2NhbGhvc3Qga2VybmVsOiBwY2kgMDAwMDowMDoxZC4wOiAgIGJyaWRnZSB3aW5kb3cgW21l
bSAweDcwMDAwMDAwLTB4OTFmZmZmZmYgNjRiaXQgcHJlZl0KQXByIDAyIDE3OjA4OjU2IGxvY2Fs
aG9zdCBrZXJuZWw6IHBjaSAwMDAwOjAxOjAwLjA6IFZpZGVvIGRldmljZSB3aXRoIHNoYWRvd2Vk
IFJPTQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogcGNpZXBvcnQgMDAwMDowMzow
MC4wOiBlbmFibGluZyBkZXZpY2UgKDAwMDAgLT4gMDAwMykKQXByIDAyIDE3OjA4OjU2IGxvY2Fs
aG9zdCBrZXJuZWw6IHBjaWVwb3J0IDAwMDA6MDQ6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAw
IC0+IDAwMDMpCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBwY2llcG9ydCAwMDAw
OjA0OjAzLjA6IGVuYWJsaW5nIGRldmljZSAoMDAwMCAtPiAwMDAzKQpBcHIgMDIgMTc6MDg6NTYg
bG9jYWxob3N0IGtlcm5lbDogcGNpZXBvcnQgMDAwMDowNDowNC4wOiBlbmFibGluZyBkZXZpY2Ug
KDAwMDAgLT4gMDAwMykKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IGFoY2kgMDAw
MDowMDoxNy4wOiB2ZXJzaW9uIDMuMApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDog
YWhjaSAwMDAwOjAwOjE3LjA6IEFIQ0kgMDAwMS4wMzAxIDMyIHNsb3RzIDYgcG9ydHMgNiBHYnBz
IDB4M2YgaW1wbCBTQVRBIG1vZGUKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IGFo
Y2kgMDAwMDowMDoxNy4wOiBmbGFnczogNjRiaXQgbmNxIHNudGYgcG0gbGVkIGNsbyBvbmx5IHBp
byBzbHVtIHBhcnQgZW1zIGRlc28gc2FkbSBzZHMgYXBzdCAKQXByIDAyIDE3OjA4OjU2IGxvY2Fs
aG9zdCBrZXJuZWw6IHhoY2lfaGNkIDAwMDA6MDA6MTQuMDogeEhDSSBIb3N0IENvbnRyb2xsZXIK
QXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IHhoY2lfaGNkIDAwMDA6MDA6MTQuMDog
bmV3IFVTQiBidXMgcmVnaXN0ZXJlZCwgYXNzaWduZWQgYnVzIG51bWJlciAxCkFwciAwMiAxNzow
ODo1NiBsb2NhbGhvc3Qga2VybmVsOiB4aGNpX2hjZCAwMDAwOjAwOjE0LjA6IGhjYyBwYXJhbXMg
MHgyMDAwNzdjMSBoY2kgdmVyc2lvbiAweDEwMCBxdWlya3MgMHgwMDEwOTgxMApBcHIgMDIgMTc6
MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogeGhjaV9oY2QgMDAwMDowMDoxNC4wOiBjYWNoZSBsaW5l
IHNpemUgb2YgNjQgaXMgbm90IHN1cHBvcnRlZApBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtl
cm5lbDogbm91dmVhdSAwMDAwOjAxOjAwLjA6IE5WSURJQSBHTTIwNiAoMTI2MDEwYTEpCkFwciAw
MiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiB4aGNpX2hjZCAwMDAwOjAwOjE0LjA6IHhIQ0kg
SG9zdCBDb250cm9sbGVyCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiB4aGNpX2hj
ZCAwMDAwOjAwOjE0LjA6IG5ldyBVU0IgYnVzIHJlZ2lzdGVyZWQsIGFzc2lnbmVkIGJ1cyBudW1i
ZXIgMgpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogbm91dmVhdSAwMDAwOjAxOjAw
LjA6IGJpb3M6IHZlcnNpb24gODQuMDYuMjYuMDAuMmMKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9z
dCBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4wOiBncjogdXNpbmcgZXh0ZXJuYWwgZmlybXdh
cmUKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4w
OiBEaXJlY3QgZmlybXdhcmUgbG9hZCBmb3IgbnZpZGlhL2dtMjA2L2ZlY3NfaW5zdC5iaW4gZmFp
bGVkIHdpdGggZXJyb3IgLTIKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZl
YXUgMDAwMDowMTowMC4wOiBncjogZmFpbGVkIHRvIGxvYWQgZmVjc19pbnN0CkFwciAwMiAxNzow
ODo1NiBsb2NhbGhvc3Qga2VybmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZGlzcDogZGNiIDE1
IHR5cGUgOCB1bmtub3duCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVsOiBub3V2ZWF1
IDAwMDA6MDE6MDAuMDogZmI6IDQwOTYgTWlCIEdERFI1CkFwciAwMiAxNzowODo1NiBsb2NhbGhv
c3Qga2VybmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBWUkFNOiA0MDk2IE1pQgpBcHIg
MDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogbm91dmVhdSAwMDAwOjAxOjAwLjA6IERSTTog
R0FSVDogMTA0ODU3NiBNaUIKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZl
YXUgMDAwMDowMTowMC4wOiBEUk06IFRNRFMgdGFibGUgdmVyc2lvbiAyLjAKQXByIDAyIDE3OjA4
OjU2IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4wOiBEUk06IERDQiB2ZXJz
aW9uIDQuMQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogbm91dmVhdSAwMDAwOjAx
OjAwLjA6IERSTTogRENCIG91dHAgMDA6IDAxMDAwZjAyIDAwMDIwMDMwCkFwciAwMiAxNzowODo1
NiBsb2NhbGhvc3Qga2VybmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBEQ0Igb3V0cCAw
MTogMDIwMDBmMDAgMDAwMDAwMDAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IG5v
dXZlYXUgMDAwMDowMTowMC4wOiBEUk06IERDQiBvdXRwIDAyOiAwNDAxMWY4MiAwMDAyMDAzMApB
cHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogbm91dmVhdSAwMDAwOjAxOjAwLjA6IERS
TTogRENCIG91dHAgMDM6IDAyMDIyZjYyIDAwMDIwMDEwCkFwciAwMiAxNzowODo1NiBsb2NhbGhv
c3Qga2VybmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBEQ0Igb3V0cCAwNTogMDI4MzNm
NzYgMDQ0MDAwMjAKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZlYXUgMDAw
MDowMTowMC4wOiBEUk06IERDQiBvdXRwIDA2OiAwMjAzM2Y3MiAwMDAyMDAyMApBcHIgMDIgMTc6
MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogbm91dmVhdSAwMDAwOjAxOjAwLjA6IERSTTogRENCIG91
dHAgMTU6IDAxZGY1ZmY4IDAwMDAwMDAwCkFwciAwMiAxNzowODo1NiBsb2NhbGhvc3Qga2VybmVs
OiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBEQ0IgY29ubiAwMDogMDAwMDEwMzAKQXByIDAy
IDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4wOiBEUk06IERD
QiBjb25uIDAxOiAwMTAwMDEzMQpBcHIgMDIgMTc6MDg6NTYgbG9jYWxob3N0IGtlcm5lbDogbm91
dmVhdSAwMDAwOjAxOjAwLjA6IERSTTogRENCIGNvbm4gMDI6IDAwMDEwMjYxCkFwciAwMiAxNzow
ODo1NiBsb2NhbGhvc3Qga2VybmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBEQ0IgY29u
biAwMzogMDAwMjAzNDYKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZlYXUg
MDAwMDowMTowMC4wOiBEUk06IERDQiBjb25uIDA1OiAwMDAwMDU3MApBcHIgMDIgMTc6MDg6NTYg
bG9jYWxob3N0IGtlcm5lbDogbm91dmVhdSAwMDAwOjAxOjAwLjA6IERSTTogUG9pbnRlciB0byBm
bGF0IHBhbmVsIHRhYmxlIGludmFsaWQKQXByIDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6
IG5vdXZlYXUgMDAwMDowMTowMC4wOiBEUk06IHVua25vd24gY29ubmVjdG9yIHR5cGUgNzAKQXBy
IDAyIDE3OjA4OjU2IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4wOiBEUk06
IGZhaWxlZCB0byBjcmVhdGUgZW5jb2RlciAxLzgvMDogLTE5CkFwciAwMiAxNzowODo1NiBsb2Nh
bGhvc3Qga2VybmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBVbmtub3duLTEgaGFzIG5v
IGVuY29kZXJzLCByZW1vdmluZwpBcHIgMDIgMTc6MDg6NTcgbG9jYWxob3N0IGtlcm5lbDogbm91
dmVhdSAwMDAwOjAxOjAwLjA6IERSTTogTU06IHVzaW5nIENPUFkgZm9yIGJ1ZmZlciBjb3BpZXMK
QXByIDAyIDE3OjA4OjU3IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4wOiBE
Uk06IGFsbG9jYXRlZCAxOTIweDEwODAgZmI6IDB4NjAwMDAsIGJvIGZmZmY4ODA4OWFjMDI4MDAK
QXByIDAyIDE3OjA4OjU3IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4wOiBm
YjA6IG5vdXZlYXVmYiBmcmFtZSBidWZmZXIgZGV2aWNlCkFwciAwMiAxNzowODo1NyBsb2NhbGhv
c3Qga2VybmVsOiBub3V2ZWF1IDAwMDA6MDI6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+
IDAwMDMpCkFwciAwMiAxNzowODo1NyBsb2NhbGhvc3Qga2VybmVsOiBub3V2ZWF1IDAwMDA6MDI6
MDAuMDogTlZJRElBIEdLMjA4QiAoYjA2MDcwYjEpCkFwciAwMiAxNzowODo1NyBsb2NhbGhvc3Qg
a2VybmVsOiBub3V2ZWF1IDAwMDA6MDI6MDAuMDogYmlvczogdmVyc2lvbiA4MC4yOC43OC4wMC4w
MQpBcHIgMDIgMTc6MDg6NTggbG9jYWxob3N0IGtlcm5lbDogbm91dmVhdSAwMDAwOjAyOjAwLjA6
IHByaXY6IEhVQjA6IDA4NjAxNCBmZmZmZmZmZiAoMWY3MDgyMGMpCkFwciAwMiAxNzowODo1OCBs
b2NhbGhvc3Qga2VybmVsOiBub3V2ZWF1IDAwMDA6MDI6MDAuMDogZmI6IDEwMjQgTWlCIEdERFI1
CkFwciAwMiAxNzowODo1OCBsb2NhbGhvc3Qga2VybmVsOiBub3V2ZWF1IDAwMDA6MDI6MDAuMDog
RFJNOiBWUkFNOiAxMDI0IE1pQgpBcHIgMDIgMTc6MDg6NTggbG9jYWxob3N0IGtlcm5lbDogbm91
dmVhdSAwMDAwOjAyOjAwLjA6IERSTTogR0FSVDogMTA0ODU3NiBNaUIKQXByIDAyIDE3OjA4OjU4
IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMjowMC4wOiBEUk06IFRNRFMgdGFibGUg
dmVyc2lvbiAyLjAKQXByIDAyIDE3OjA4OjU4IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZlYXUgMDAw
MDowMjowMC4wOiBEUk06IERDQiB2ZXJzaW9uIDQuMApBcHIgMDIgMTc6MDg6NTggbG9jYWxob3N0
IGtlcm5lbDogbm91dmVhdSAwMDAwOjAyOjAwLjA6IERSTTogRENCIG91dHAgMDA6IDAxMDAwZjAy
IDAwMDIwMDMwCkFwciAwMiAxNzowODo1OCBsb2NhbGhvc3Qga2VybmVsOiBub3V2ZWF1IDAwMDA6
MDI6MDAuMDogRFJNOiBEQ0Igb3V0cCAwMTogMDIwMTFmNjIgMDAwMjAwMTAKQXByIDAyIDE3OjA4
OjU4IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMjowMC4wOiBEUk06IERDQiBvdXRw
IDAyOiAwMjAyMmYxMCAwMDAwMDAwMApBcHIgMDIgMTc6MDg6NTggbG9jYWxob3N0IGtlcm5lbDog
bm91dmVhdSAwMDAwOjAyOjAwLjA6IERSTTogRENCIGNvbm4gMDA6IDAwMDAxMDMxCkFwciAwMiAx
NzowODo1OCBsb2NhbGhvc3Qga2VybmVsOiBub3V2ZWF1IDAwMDA6MDI6MDAuMDogRFJNOiBEQ0Ig
Y29ubiAwMTogMDAwMDIxNjEKQXByIDAyIDE3OjA4OjU4IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZl
YXUgMDAwMDowMjowMC4wOiBEUk06IERDQiBjb25uIDAyOiAwMDAwMDIwMApBcHIgMDIgMTc6MDg6
NTggbG9jYWxob3N0IGtlcm5lbDogbm91dmVhdSAwMDAwOjAyOjAwLjA6IERSTTogTU06IHVzaW5n
IENPUFkgZm9yIGJ1ZmZlciBjb3BpZXMKQXByIDAyIDE3OjA4OjU4IGxvY2FsaG9zdCBrZXJuZWw6
IG5vdXZlYXUgMDAwMDowMjowMC4wOiBObyBjb25uZWN0b3JzIHJlcG9ydGVkIGNvbm5lY3RlZCB3
aXRoIG1vZGVzCkFwciAwMiAxNzowODo1OSBsb2NhbGhvc3Qga2VybmVsOiBub3V2ZWF1IDAwMDA6
MDI6MDAuMDogRFJNOiBhbGxvY2F0ZWQgMTAyNHg3NjggZmI6IDB4NjAwMDAsIGJvIGZmZmY4ODA4
OWE0N2M0MDAKQXByIDAyIDE3OjA4OjU5IGxvY2FsaG9zdCBrZXJuZWw6IG5vdXZlYXUgMDAwMDow
MjowMC4wOiBmYjE6IG5vdXZlYXVmYiBmcmFtZSBidWZmZXIgZGV2aWNlCkFwciAwMiAxNzowOTow
MSBsb2NhbGhvc3QubG9jYWxkb21haW4ga2VybmVsOiBtZWlfbWUgMDAwMDowMDoxNi4wOiBlbmFi
bGluZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikKQXByIDAyIDE3OjA5OjAxIGxvY2FsaG9zdC5sb2Nh
bGRvbWFpbiBrZXJuZWw6IHNuZF9oZGFfaW50ZWwgMDAwMDowMTowMC4xOiBEaXNhYmxpbmcgTVNJ
CkFwciAwMiAxNzowOTowMSBsb2NhbGhvc3QubG9jYWxkb21haW4ga2VybmVsOiBzbmRfaGRhX2lu
dGVsIDAwMDA6MDE6MDAuMTogSGFuZGxlIHZnYV9zd2l0Y2hlcm9vIGF1ZGlvIGNsaWVudApBcHIg
MDIgMTc6MDk6MDEgbG9jYWxob3N0LmxvY2FsZG9tYWluIGtlcm5lbDogc25kX2hkYV9pbnRlbCAw
MDAwOjAyOjAwLjE6IERpc2FibGluZyBNU0kKQXByIDAyIDE3OjA5OjAxIGxvY2FsaG9zdC5sb2Nh
bGRvbWFpbiBrZXJuZWw6IHNuZF9oZGFfaW50ZWwgMDAwMDowMjowMC4xOiBIYW5kbGUgdmdhX3N3
aXRjaGVyb28gYXVkaW8gY2xpZW50CkFwciAwMiAxNzowOTowMiBsb2NhbGhvc3QubG9jYWxkb21h
aW4ga2VybmVsOiBzbmRfaGRhX2ludGVsIDAwMDA6MDA6MWYuMzogZmFpbGVkIHRvIGFkZCBpOTE1
IGNvbXBvbmVudCBtYXN0ZXIgKC0xOSkKQXByIDAyIDE3OjA5OjAyIGxvY2FsaG9zdC5sb2NhbGRv
bWFpbiBrZXJuZWw6IGUxMDAwZSAwMDAwOjAwOjFmLjY6IEludGVycnVwdCBUaHJvdHRsaW5nIFJh
dGUgKGludHMvc2VjKSBzZXQgdG8gZHluYW1pYyBjb25zZXJ2YXRpdmUgbW9kZQpBcHIgMDIgMTc6
MDk6MDIgbG9jYWxob3N0LmxvY2FsZG9tYWluIGtlcm5lbDogZTEwMDBlIDAwMDA6MDA6MWYuNiBl
dGgxOiByZWdpc3RlcmVkIFBIQyBjbG9jawpBcHIgMDIgMTc6MDk6MDIgbG9jYWxob3N0LmxvY2Fs
ZG9tYWluIGtlcm5lbDogZTEwMDBlIDAwMDA6MDA6MWYuNiBldGgxOiAoUENJIEV4cHJlc3M6Mi41
R1QvczpXaWR0aCB4MSkgMDA6MWY6YmM6MGY6Mzc6NzYKQXByIDAyIDE3OjA5OjAyIGxvY2FsaG9z
dC5sb2NhbGRvbWFpbiBrZXJuZWw6IGUxMDAwZSAwMDAwOjAwOjFmLjYgZXRoMTogSW50ZWwoUikg
UFJPLzEwMDAgTmV0d29yayBDb25uZWN0aW9uCkFwciAwMiAxNzowOTowMiBsb2NhbGhvc3QubG9j
YWxkb21haW4ga2VybmVsOiBlMTAwMGUgMDAwMDowMDoxZi42IGV0aDE6IE1BQzogMTIsIFBIWTog
MTIsIFBCQSBObzogRkZGRkZGLTBGRgpBcHIgMDIgMTc6MDk6MDMgbG9jYWxob3N0LmxvY2FsZG9t
YWluIGtlcm5lbDogZTEwMDBlIDAwMDA6MDA6MWYuNiBlbnAwczMxZjY6IHJlbmFtZWQgZnJvbSBl
dGgxCkFwciAwMiAxNzowOToxMSBsb2NhbGhvc3QubG9jYWxkb21haW4ga2VybmVsOiBhaGNpIDAw
MDA6MDA6MTcuMDogcG9ydCBkb2VzIG5vdCBzdXBwb3J0IGRldmljZSBzbGVlcApBcHIgMDIgMTc6
MDk6MjkgbG9jYWxob3N0LmxvY2FsZG9tYWluIGtlcm5lbDogZTEwMDBlIDAwMDA6MDA6MWYuNiBl
bnAwczMxZjY6IDEwLzEwMCBzcGVlZDogZGlzYWJsaW5nIFRTTwo=
--001a1143e5420b36a4052fb2b8ae
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--001a1143e5420b36a4052fb2b8ae--
