From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77690] New: [nv49] Hearthstone corrupted display
 screen with wine
Date: Sun, 20 Apr 2014 12:46:44 +0000
Message-ID: <bug-77690-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0149730396=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0149730396==
Content-Type: multipart/alternative; boundary="1397998004.F053cf80.27816"; charset="us-ascii"


--1397998004.F053cf80.27816
Date: Sun, 20 Apr 2014 12:46:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77690

          Priority: medium
            Bug ID: 77690
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nv49] Hearthstone corrupted display screen with wine
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: infyquest-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: 10.1
         Component: Drivers/DRI/nouveau
           Product: Mesa

I have NV49 card, nVidia Geforce 7900Go with 512MB on my laptop

When running HearthStone with wine I get corrupted screen when I click Play
Game.

The Battle.net screen runs fine.

Also when I check dmesg I have the following messages
$ dmesg |grep nou
[    0.000000] Checking if this processor honours the WP bit even in supervisor
mode...Ok.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[   14.370212] fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing
generic driver
[   14.374433] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x049800a2
[   14.374440] nouveau  [  DEVICE][0000:01:00.0] Chipset: G71 (NV49)
[   14.374456] nouveau  [  DEVICE][0000:01:00.0] Family : NV40
[   14.376861] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[   14.529322] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[   14.529334] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[   14.529785] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[   14.529804] nouveau  [   VBIOS][0000:01:00.0] version 05.71.22.16.13
[   14.530551] nouveau 0000:01:00.0: irq 46 for MSI/MSI-X
[   14.530581] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[   14.530665] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR3
[   14.530671] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
[   14.530677] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 294912 tags
[   14.559166] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 1240000uv
[   14.594974] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[   14.595009] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[   14.595027] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[   14.616766] nouveau  [     CLK][0000:01:00.0] 20: core 100 MHz shader 100
MHz memory 100 MHz
[   14.616790] nouveau  [     CLK][0000:01:00.0] 21: core 200 MHz shader 200
MHz memory 300 MHz
[   14.616800] nouveau  [     CLK][0000:01:00.0] 22: core 375 MHz shader 375
MHz memory 507 MHz
[   14.616827] nouveau  [     CLK][0000:01:00.0] --: core 200 MHz shader 200
MHz memory 351 MHz
[   14.623060] nouveau  [     DRM] VRAM: 506 MiB
[   14.623068] nouveau  [     DRM] GART: 512 MiB
[   14.623089] nouveau  [     DRM] TMDS table version 1.1
[   14.623094] nouveau W[     DRM] TMDS table script pointers not stubbed
[   14.623100] nouveau  [     DRM] DCB version 3.0
[   14.623107] nouveau  [     DRM] DCB outp 00: 03000323 00000004
[   14.623126] nouveau  [     DRM] DCB outp 01: 01011300 00000028
[   14.623132] nouveau  [     DRM] DCB outp 02: 020223f1 0040c080
[   14.623138] nouveau  [     DRM] DCB outp 03: 08035312 00000000
[   14.623154] nouveau  [     DRM] DCB outp 04: 04036312 00000000
[   14.623159] nouveau  [     DRM] DCB conn 00: 0041
[   14.623166] nouveau  [     DRM] DCB conn 01: 0100
[   14.623171] nouveau  [     DRM] DCB conn 02: 0310
[   14.623186] nouveau  [     DRM] DCB conn 03: 0311
[   14.623191] nouveau  [     DRM] DCB conn 04: 0313
[   14.623196] nouveau  [     DRM] DCB conn 05: 0254
[   14.623201] nouveau  [     DRM] DCB conn 06: 0455
[   14.625005] nouveau W[     DRM] unknown connector type 54
[   14.625324] nouveau W[     DRM] unknown connector type 55
[   14.627786] nouveau E[     DRM] Pixel clock comparison table not found
[   14.627812] nouveau  [     DRM] 0xCA1F: Parsing digital output script table
[   14.689456] nouveau  [     DRM] MM: using M2MF for buffer copies
[   14.689472] nouveau  [     DRM] Calling LVDS script 6:
[   14.689489] nouveau  [     DRM] 0xC81B: Parsing digital output script table
[   14.975580] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 2)
[   15.074686] nouveau  [     DRM] allocated 1920x1200 fb: 0x9000, bo f5a4d000
[   15.075032] fbcon: nouveaufb (fb0) is primary device
[   15.096286] nouveau  [     DRM] Calling LVDS script 2:
[   15.096291] nouveau  [     DRM] 0xC89F: Parsing digital output script table
[   15.244611] nouveau  [     DRM] Calling LVDS script 5:
[   15.244625] nouveau  [     DRM] 0xC80C: Parsing digital output script table
[   15.248171] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   15.248187] nouveau 0000:01:00.0: registered panic notifier
[   15.248200] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0
[  175.238926] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.238962] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  175.248385] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.248420] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[  175.283980] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.284015] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  175.421586] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.421622] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  175.431331] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.431362] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[  175.467132] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.467165] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  175.584243] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.584289] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  175.593366] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.593399] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[  175.629060] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.629093] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  233.248352] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.248388] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  233.261331] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.261378] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[  233.304548] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.304594] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  233.442718] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.442753] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  233.453935] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.453982] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[  233.514085] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.514134] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  233.702685] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.702720] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  233.714522] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.714572] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[  233.755169] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.755206] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1604.720371] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1604.720406] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1604.728627] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1604.728663] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[ 1604.763825] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1604.763871] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1605.125611] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1605.125658] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1605.139330] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1605.139377] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[ 1605.176399] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1605.176446] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1605.391303] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1605.391350] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1605.402239] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1605.402274] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[ 1605.437623] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1605.437658] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1684.834322] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1684.834357] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1684.844347] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1684.844381] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[ 1684.879929] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1684.879965] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1685.051287] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1685.051323] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1685.061754] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1685.061791] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[ 1685.101345] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1685.101391] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1685.268981] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1685.269028] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1685.279244] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1685.279278] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[ 1685.316905] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1685.316940] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242

I am running it with wine 1.7.17, mesa 10.1.1, linux 3.14.1 (ArchLinux 32 bit)

Let me know if you need more info

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397998004.F053cf80.27816
Date: Sun, 20 Apr 2014 12:46:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv49] Hearthstone corrupted display screen with wine"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77690">77690</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nv49] Hearthstone corrupted display screen with wine
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>infyquest&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.1
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have NV49 card, nVidia Geforce 7900Go with 512MB on my laptop

When running HearthStone with wine I get corrupted screen when I click Play
Game.

The Battle.net screen runs fine.

Also when I check dmesg I have the following messages
$ dmesg |grep nou
[    0.000000] Checking if this processor honours the WP bit even in supervisor
mode...Ok.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[   14.370212] fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing
generic driver
[   14.374433] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x049800a2
[   14.374440] nouveau  [  DEVICE][0000:01:00.0] Chipset: G71 (NV49)
[   14.374456] nouveau  [  DEVICE][0000:01:00.0] Family : NV40
[   14.376861] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[   14.529322] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[   14.529334] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[   14.529785] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[   14.529804] nouveau  [   VBIOS][0000:01:00.0] version 05.71.22.16.13
[   14.530551] nouveau 0000:01:00.0: irq 46 for MSI/MSI-X
[   14.530581] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[   14.530665] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR3
[   14.530671] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
[   14.530677] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 294912 tags
[   14.559166] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 1240000uv
[   14.594974] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[   14.595009] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[   14.595027] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[   14.616766] nouveau  [     CLK][0000:01:00.0] 20: core 100 MHz shader 100
MHz memory 100 MHz
[   14.616790] nouveau  [     CLK][0000:01:00.0] 21: core 200 MHz shader 200
MHz memory 300 MHz
[   14.616800] nouveau  [     CLK][0000:01:00.0] 22: core 375 MHz shader 375
MHz memory 507 MHz
[   14.616827] nouveau  [     CLK][0000:01:00.0] --: core 200 MHz shader 200
MHz memory 351 MHz
[   14.623060] nouveau  [     DRM] VRAM: 506 MiB
[   14.623068] nouveau  [     DRM] GART: 512 MiB
[   14.623089] nouveau  [     DRM] TMDS table version 1.1
[   14.623094] nouveau W[     DRM] TMDS table script pointers not stubbed
[   14.623100] nouveau  [     DRM] DCB version 3.0
[   14.623107] nouveau  [     DRM] DCB outp 00: 03000323 00000004
[   14.623126] nouveau  [     DRM] DCB outp 01: 01011300 00000028
[   14.623132] nouveau  [     DRM] DCB outp 02: 020223f1 0040c080
[   14.623138] nouveau  [     DRM] DCB outp 03: 08035312 00000000
[   14.623154] nouveau  [     DRM] DCB outp 04: 04036312 00000000
[   14.623159] nouveau  [     DRM] DCB conn 00: 0041
[   14.623166] nouveau  [     DRM] DCB conn 01: 0100
[   14.623171] nouveau  [     DRM] DCB conn 02: 0310
[   14.623186] nouveau  [     DRM] DCB conn 03: 0311
[   14.623191] nouveau  [     DRM] DCB conn 04: 0313
[   14.623196] nouveau  [     DRM] DCB conn 05: 0254
[   14.623201] nouveau  [     DRM] DCB conn 06: 0455
[   14.625005] nouveau W[     DRM] unknown connector type 54
[   14.625324] nouveau W[     DRM] unknown connector type 55
[   14.627786] nouveau E[     DRM] Pixel clock comparison table not found
[   14.627812] nouveau  [     DRM] 0xCA1F: Parsing digital output script table
[   14.689456] nouveau  [     DRM] MM: using M2MF for buffer copies
[   14.689472] nouveau  [     DRM] Calling LVDS script 6:
[   14.689489] nouveau  [     DRM] 0xC81B: Parsing digital output script table
[   14.975580] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 2)
[   15.074686] nouveau  [     DRM] allocated 1920x1200 fb: 0x9000, bo f5a4d000
[   15.075032] fbcon: nouveaufb (fb0) is primary device
[   15.096286] nouveau  [     DRM] Calling LVDS script 2:
[   15.096291] nouveau  [     DRM] 0xC89F: Parsing digital output script table
[   15.244611] nouveau  [     DRM] Calling LVDS script 5:
[   15.244625] nouveau  [     DRM] 0xC80C: Parsing digital output script table
[   15.248171] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   15.248187] nouveau 0000:01:00.0: registered panic notifier
[   15.248200] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0
[  175.238926] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.238962] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  175.248385] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.248420] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[  175.283980] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.284015] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  175.421586] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.421622] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  175.431331] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.431362] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[  175.467132] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.467165] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  175.584243] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.584289] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  175.593366] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.593399] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[  175.629060] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  175.629093] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  233.248352] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.248388] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  233.261331] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.261378] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[  233.304548] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.304594] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  233.442718] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.442753] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  233.453935] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.453982] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[  233.514085] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.514134] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  233.702685] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.702720] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[  233.714522] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.714572] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[  233.755169] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  233.755206] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[943]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1604.720371] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1604.720406] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1604.728627] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1604.728663] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[ 1604.763825] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1604.763871] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1605.125611] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1605.125658] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1605.139330] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1605.139377] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[ 1605.176399] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1605.176446] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1605.391303] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1605.391350] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1605.402239] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1605.402274] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[ 1605.437623] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1605.437658] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
Hearthstone.exe[5728]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1684.834322] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1684.834357] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1684.844347] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1684.844381] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[ 1684.879929] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1684.879965] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1685.051287] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1685.051323] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1685.061754] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1685.061791] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[ 1685.101345] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1685.101391] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1685.268981] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1685.269028] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242
[ 1685.279244] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1685.279278] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243
[ 1685.316905] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 1685.316940] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x00165000
Hearthstone.exe[6717]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242

I am running it with wine 1.7.17, mesa 10.1.1, linux 3.14.1 (ArchLinux 32 bit)

Let me know if you need more info</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397998004.F053cf80.27816--

--===============0149730396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0149730396==--
