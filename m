From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78092] GK208M [GeForce GT 730M] (rev ff) (prog-if
 ff) nouveau module load fail
Date: Wed, 30 Apr 2014 06:23:30 +0000
Message-ID: <bug-78092-8800-Hb2LUA7Uay@http.bugs.freedesktop.org/>
References: <bug-78092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1988343971=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1988343971==
Content-Type: multipart/alternative; boundary="1398839010.43622D10.29364"; charset="us-ascii"


--1398839010.43622D10.29364
Date: Wed, 30 Apr 2014 06:23:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78092

--- Comment #9 from Anton Gubarkov <anton.gubarkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 98211
  --> https://bugs.freedesktop.org/attachment.cgi?id=98211&action=edit
acpidump

When I applied
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=2677c8889a40d7404cc8fc9210cb59fdf95efa63
 to  3.15-rc3, it did init.

2349-pb8edcn ~ # xrandr --listprovidersProviders: number : 2
Provider 0: id: 0x88 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
3 outputs: 6 associated providers: 0 name:Intel
Provider 1: id: 0x5f cap: 0x5, Source Output, Source Offload crtcs: 0 outputs:
0 associated providers: 0 name:nouveau
2349-pb8edcn ~ # xrandr --setprovideroffloadsink nouveau Intel

I get ~ 180 frames/sec from GT730 in glxspheres. 

acpi_osi=!Windows 2012 is the carry-over from previous kernels to make
backlight control buttons work on my Lenovo thinkpad T540p. They no longer work
on 3.15-rc3, so I removed this parameter. 

 I removed the patch from nouveau_acpi.c and re-tested optimus detection w/o
acpi_osi=!Windows 2012. It doesn't initialize due to the same reason - no
VBIOS.


2349-pb8edcn linux # lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v3/4th Gen Core
Processor DRAM Controller [8086:0c04] (rev 06)
00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v3/4th Gen Core
Processor PCI Express x16 Controller [8086:0c01] (rev 06)
00:02.0 VGA compatible controller [0300]: Intel Corporation 4th Gen Core
Processor Integrated Graphics Controller [8086:0416] (rev 06)
00:03.0 Audio device [0403]: Intel Corporation Xeon E3-1200 v3/4th Gen Core
Processor HD Audio Controller [8086:0c0c] (rev 06)
00:14.0 USB controller [0c03]: Intel Corporation 8 Series/C220 Series Chipset
Family USB xHCI [8086:8c31] (rev 04)
00:16.0 Communication controller [0780]: Intel Corporation 8 Series/C220 Series
Chipset Family MEI Controller #1 [8086:8c3a] (rev 04)
00:19.0 Ethernet controller [0200]: Intel Corporation Ethernet Connection
I217-LM [8086:153a] (rev 04)
00:1a.0 USB controller [0c03]: Intel Corporation 8 Series/C220 Series Chipset
Family USB EHCI #2 [8086:8c2d] (rev 04)
00:1b.0 Audio device [0403]: Intel Corporation 8 Series/C220 Series Chipset
High Definition Audio Controller [8086:8c20] (rev 04)
00:1c.0 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset
Family PCI Express Root Port #1 [8086:8c10] (rev d4)
00:1c.1 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset
Family PCI Express Root Port #2 [8086:8c12] (rev d4)
00:1c.2 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset
Family PCI Express Root Port #3 [8086:8c14] (rev d4)
00:1d.0 USB controller [0c03]: Intel Corporation 8 Series/C220 Series Chipset
Family USB EHCI #1 [8086:8c26] (rev 04)
00:1f.0 ISA bridge [0601]: Intel Corporation QM87 Express LPC Controller
[8086:8c4f] (rev 04)
00:1f.2 SATA controller [0106]: Intel Corporation 8 Series/C220 Series Chipset
Family 6-port SATA Controller 1 [AHCI mode] [8086:8c03] (rev 04)
00:1f.3 SMBus [0c05]: Intel Corporation 8 Series/C220 Series Chipset Family
SMBus Controller [8086:8c22] (rev 04)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK208M [GeForce GT
730M] [10de:1290] (rev a1)
03:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS5227 PCI
Express Card Reader [10ec:5227] (rev 01)
04:00.0 Network controller [0280]: Intel Corporation Wireless 7260 [8086:08b2]
(rev 6b)
2349-pb8edcn linux # acpidump > /var/log/acpidump.txt
Wrong checksum for FADT!


Thanks for your attention to my problem. I would be happy to provide any more
information you need.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398839010.43622D10.29364
Date: Wed, 30 Apr 2014 06:23:30 +0000
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
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092">bug 78092</a>
              from <span class="vcard"><a class="email" href="mailto:anton.gubarkov&#64;gmail.com" title="Anton Gubarkov &lt;anton.gubarkov&#64;gmail.com&gt;"> <span class="fn">Anton Gubarkov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=98211" name="attach_98211" title="acpidump">attachment 98211</a> <a href="attachment.cgi?id=98211&amp;action=edit" title="acpidump">[details]</a></span>
acpidump

When I applied
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=2677c8889a40d7404cc8fc9210cb59fdf95efa63">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=2677c8889a40d7404cc8fc9210cb59fdf95efa63</a>
 to  3.15-rc3, it did init.

2349-pb8edcn ~ # xrandr --listprovidersProviders: number : 2
Provider 0: id: 0x88 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
3 outputs: 6 associated providers: 0 name:Intel
Provider 1: id: 0x5f cap: 0x5, Source Output, Source Offload crtcs: 0 outputs:
0 associated providers: 0 name:nouveau
2349-pb8edcn ~ # xrandr --setprovideroffloadsink nouveau Intel

I get ~ 180 frames/sec from GT730 in glxspheres. 

acpi_osi=!Windows 2012 is the carry-over from previous kernels to make
backlight control buttons work on my Lenovo thinkpad T540p. They no longer work
on 3.15-rc3, so I removed this parameter. 

 I removed the patch from nouveau_acpi.c and re-tested optimus detection w/o
acpi_osi=!Windows 2012. It doesn't initialize due to the same reason - no
VBIOS.


2349-pb8edcn linux # lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v3/4th Gen Core
Processor DRAM Controller [8086:0c04] (rev 06)
00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v3/4th Gen Core
Processor PCI Express x16 Controller [8086:0c01] (rev 06)
00:02.0 VGA compatible controller [0300]: Intel Corporation 4th Gen Core
Processor Integrated Graphics Controller [8086:0416] (rev 06)
00:03.0 Audio device [0403]: Intel Corporation Xeon E3-1200 v3/4th Gen Core
Processor HD Audio Controller [8086:0c0c] (rev 06)
00:14.0 USB controller [0c03]: Intel Corporation 8 Series/C220 Series Chipset
Family USB xHCI [8086:8c31] (rev 04)
00:16.0 Communication controller [0780]: Intel Corporation 8 Series/C220 Series
Chipset Family MEI Controller #1 [8086:8c3a] (rev 04)
00:19.0 Ethernet controller [0200]: Intel Corporation Ethernet Connection
I217-LM [8086:153a] (rev 04)
00:1a.0 USB controller [0c03]: Intel Corporation 8 Series/C220 Series Chipset
Family USB EHCI #2 [8086:8c2d] (rev 04)
00:1b.0 Audio device [0403]: Intel Corporation 8 Series/C220 Series Chipset
High Definition Audio Controller [8086:8c20] (rev 04)
00:1c.0 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset
Family PCI Express Root Port #1 [8086:8c10] (rev d4)
00:1c.1 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset
Family PCI Express Root Port #2 [8086:8c12] (rev d4)
00:1c.2 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset
Family PCI Express Root Port #3 [8086:8c14] (rev d4)
00:1d.0 USB controller [0c03]: Intel Corporation 8 Series/C220 Series Chipset
Family USB EHCI #1 [8086:8c26] (rev 04)
00:1f.0 ISA bridge [0601]: Intel Corporation QM87 Express LPC Controller
[8086:8c4f] (rev 04)
00:1f.2 SATA controller [0106]: Intel Corporation 8 Series/C220 Series Chipset
Family 6-port SATA Controller 1 [AHCI mode] [8086:8c03] (rev 04)
00:1f.3 SMBus [0c05]: Intel Corporation 8 Series/C220 Series Chipset Family
SMBus Controller [8086:8c22] (rev 04)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK208M [GeForce GT
730M] [10de:1290] (rev a1)
03:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS5227 PCI
Express Card Reader [10ec:5227] (rev 01)
04:00.0 Network controller [0280]: Intel Corporation Wireless 7260 [8086:08b2]
(rev 6b)
2349-pb8edcn linux # acpidump &gt; /var/log/acpidump.txt
Wrong checksum for FADT!


Thanks for your attention to my problem. I would be happy to provide any more
information you need.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398839010.43622D10.29364--

--===============1988343971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1988343971==--
