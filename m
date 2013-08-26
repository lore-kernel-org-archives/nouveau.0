From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63135] [NV96] [bisected] DisplayPort dual-head fails
 to switch to KMS
Date: Mon, 26 Aug 2013 17:23:44 +0000
Message-ID: <bug-63135-8800-MJIo2yjIvH@http.bugs.freedesktop.org/>
References: <bug-63135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1277568464=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1277568464==
Content-Type: multipart/alternative; boundary="1377537823.C5bfF641.1233"; charset="us-ascii"


--1377537823.C5bfF641.1233
Date: Mon, 26 Aug 2013 17:23:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63135

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[bisected] G69/nv50         |[NV96] [bisected]
                   |DisplayPort dual-head fails |DisplayPort dual-head fails
                   |to switch to KMS            |to switch to KMS

--- Comment #22 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
You know, this warning in your dmesg doesn't fill me with confidence:

[    0.188533] WARNING: at drivers/iommu/intel_irq_remapping.c:533
intel_irq_remapping_supported+0x35/0x78()
[    0.198212] This system BIOS has enabled interrupt remapping
[    0.198212] on a chipset that contains an erratum making that
[    0.198212] feature unstable.  To maintain system stability
[    0.198212] interrupt remapping is being disabled.  Please
[    0.198212] contact your BIOS vendor for an update

Can you see if you can disable DMAR in your bios? I'm sure it's not related,
but... who knows.

Secondly, your log appears to only have errors/warns, not info prints. Would be
good to get the full log. Is that patch still needed BTW? What happens without
it?

These I don't like:

[    9.190684] nouveau E[   PDISP][0000:03:00.0] DP:0006:0382: bios data not
found
[    9.191377] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x03854080 FAULT
at 0x614b00
[    9.192380] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000090 FAULT
at 0x61c9a8
[    9.193055] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x6df3fe24 FAULT
at 0x614200
[    9.193778] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000000 FAULT
at 0x614b00
[    9.194453] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x80000000 FAULT
at 0x610030
[    9.385564] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00100000 FAULT
at 0x61c804
[    9.385915] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000008 FAULT
at 0x61c804
[    9.386332] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x80000000 FAULT
at 0x61c804
[    9.386676] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000008 FAULT
at 0x61c804
[    9.387021] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000008 FAULT
at 0x61c830
[   11.168116] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x80000001 FAULT
at 0x61c804
[   11.168794] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000008 FAULT
at 0x61c830
[   11.169464] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x00000020 FAULT
at 0x642000
[   11.171770] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x0000003c FAULT
at 0x640000
[   11.174084] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000028 FAULT
at 0x640000
[   11.175080] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x80000001 FAULT
at 0x61d004
[   11.177067] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x0000001c FAULT
at 0x640000
[   11.178719] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x00000008 FAULT
at 0x640000
[   11.179107] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x00000014 FAULT
at 0x640000
[   13.178552] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x0000006c FAULT
at 0x642000

And they're probably the source of the problem. BTW, it's worth asking -- are
there actual DP connectors on your card, and/or are you using adapters of some
sort?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377537823.C5bfF641.1233
Date: Mon, 26 Aug 2013 17:23:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] [bisected] DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135">bug 63135</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS
           </td>
           <td>[NV96] [bisected] DisplayPort dual-head fails to switch to KMS
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] [bisected] DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] [bisected] DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135">bug 63135</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>You know, this warning in your dmesg doesn't fill me with confidence:

[    0.188533] WARNING: at drivers/iommu/intel_irq_remapping.c:533
intel_irq_remapping_supported+0x35/0x78()
[    0.198212] This system BIOS has enabled interrupt remapping
[    0.198212] on a chipset that contains an erratum making that
[    0.198212] feature unstable.  To maintain system stability
[    0.198212] interrupt remapping is being disabled.  Please
[    0.198212] contact your BIOS vendor for an update

Can you see if you can disable DMAR in your bios? I'm sure it's not related,
but... who knows.

Secondly, your log appears to only have errors/warns, not info prints. Would be
good to get the full log. Is that patch still needed BTW? What happens without
it?

These I don't like:

[    9.190684] nouveau E[   PDISP][0000:03:00.0] DP:0006:0382: bios data not
found
[    9.191377] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x03854080 FAULT
at 0x614b00
[    9.192380] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000090 FAULT
at 0x61c9a8
[    9.193055] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x6df3fe24 FAULT
at 0x614200
[    9.193778] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000000 FAULT
at 0x614b00
[    9.194453] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x80000000 FAULT
at 0x610030
[    9.385564] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00100000 FAULT
at 0x61c804
[    9.385915] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000008 FAULT
at 0x61c804
[    9.386332] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x80000000 FAULT
at 0x61c804
[    9.386676] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000008 FAULT
at 0x61c804
[    9.387021] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000008 FAULT
at 0x61c830
[   11.168116] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x80000001 FAULT
at 0x61c804
[   11.168794] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000008 FAULT
at 0x61c830
[   11.169464] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x00000020 FAULT
at 0x642000
[   11.171770] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x0000003c FAULT
at 0x640000
[   11.174084] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000028 FAULT
at 0x640000
[   11.175080] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x80000001 FAULT
at 0x61d004
[   11.177067] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x0000001c FAULT
at 0x640000
[   11.178719] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x00000008 FAULT
at 0x640000
[   11.179107] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x00000014 FAULT
at 0x640000
[   13.178552] nouveau E[    PBUS][0000:03:00.0] MMIO write of 0x0000006c FAULT
at 0x642000

And they're probably the source of the problem. BTW, it's worth asking -- are
there actual DP connectors on your card, and/or are you using adapters of some
sort?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377537823.C5bfF641.1233--

--===============1277568464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1277568464==--
