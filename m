From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107016] New: Gpio error only from kernel higher as
 4.x (k2000m; 0x0e73b0a2; version 80.07.40.00.02)
Date: Sun, 24 Jun 2018 19:18:15 +0000
Message-ID: <bug-107016-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0600116468=="
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


--===============0600116468==
Content-Type: multipart/alternative; boundary="15298678950.1f6Ce63A.16657"
Content-Transfer-Encoding: 7bit


--15298678950.1f6Ce63A.16657
Date: Sun, 24 Jun 2018 19:18:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107016

            Bug ID: 107016
           Summary: Gpio error only from kernel higher as 4.x (k2000m;
                    0x0e73b0a2; version 80.07.40.00.02)
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tothsoft-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 140303
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D140303&action=3Dedit
dmesg message from old kernel 3.19 (when it was all ok=3D  no problem)

Dear developers,

this bug of nouveau driver is also always in kernel 4.15 (in last ubuntu).

Maybe it is connected on your changes from 2016:
https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=3Da24ded=
627e42d453546c553d609edc073f59cd57


Therefore i must wait on fix, and now i am only on old kernel 3.19 on Linux
mint 17.3, which have support to y2019. Thx

In attachment is dmesg message from old kernel 3.19 (when it was all ok=3D =
 no
problem).

From kernels 4+ i have dmesg message:
 [ 9007.285922] nouveau 0000:01:00.0: volt: couldn't set 887500uv
 [ 9007.285930] nouveau 0000:01:00.0: clk: failed to raise voltage: -22
 [ 9007.285933] nouveau 0000:01:00.0: clk: error setting pstate 1: -22
 [ 9333.740189] nouveau 0000:01:00.0: volt: couldn't set 825000uv
 [ 9333.740196] nouveau 0000:01:00.0: clk: failed to raise voltage: -22
 [ 9333.740200] nouveau 0000:01:00.0: clk: error setting pstate 0: -22




so, ..nouveau driver going only according to BIOS clocks ?

GPU clock in BIOS"405 mhz": https://www.techpowerup.com/vgabios/147121/1471=
21

GPU clock with driver "745 mhz":=20=20
https://www.techpowerup.com/gpudb/1424/quadro-k2000m

[   19.715426] nouveau 0000:01:00.0: bios: version 80.07.40.00.02
[   19.716325] nouveau 0000:01:00.0: mxm: BIOS version 3.0
[   19.719835] ACPI Warning: \_SB.PCI0.PEGP.DGFX._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160930/nsarguments-95)
[   19.720419] nouveau 0000:01:00.0: volt: Type mismatch between the voltage
table type and the GPIO table. Fallback to GPIO mode.


Here is nvidia driver message:

nvidia-smi -q

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DNVSMI LOG=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

Timestamp                           : Thu Jul 27 06:12:05 2017
Driver Version                      : 375.66

Attached GPUs                       : 1
GPU 0000:01:00.0
    Product Name                    : Quadro K2000M
    Product Brand                   : Quadro
    Display Mode                    : Enabled
    Display Active                  : Enabled
    Persistence Mode                : Disabled
    Accounting Mode                 : Disabled
    Accounting Mode Buffer Size     : 1920
    Driver Model
        Current                     : N/A
        Pending                     : N/A
    Serial Number                   : N/A
    GPU UUID                        : GPU-ff2c74f8-3fa3-b0d5-c61d-fa8141f9c=
703
    Minor Number                    : 0
    VBIOS Version                   : 80.07.40.00.02
    MultiGPU Board                  : No
    Board ID                        : 0x100
    GPU Part Number                 : N/A
    Inforom Version
        Image Version               : N/A
        OEM Object                  : N/A
        ECC Object                  : N/A
        Power Management Object     : N/A
    GPU Operation Mode
        Current                     : N/A
        Pending                     : N/A
    GPU Virtualization Mode
        Virtualization mode         : None
    PCI
        Bus                         : 0x01
        Device                      : 0x00
        Domain                      : 0x0000
        Device Id                   : 0x0FFB10DE
        Bus Id                      : 0000:01:00.0
        Sub System Id               : 0x176B103C
        GPU Link Info
            PCIe Generation
                Max                 : 2
                Current             : 1
            Link Width
                Max                 : 16x
                Current             : 16x
        Bridge Chip
            Type                    : N/A
            Firmware                : N/A
        Replays since reset         : 0
        Tx Throughput               : N/A
        Rx Throughput               : N/A
    Fan Speed                       : N/A
    Performance State               : P8
    Clocks Throttle Reasons
        Idle                        : Not Active
        Applications Clocks Setting : Not Active
        SW Power Cap                : Not Active
        HW Slowdown                 : Not Active
        Sync Boost                  : Not Active
        Unknown                     : Not Active
    FB Memory Usage
        Total                       : 1997 MiB
        Used                        : 190 MiB
        Free                        : 1807 MiB
    BAR1 Memory Usage
        Total                       : 256 MiB
        Used                        : 4 MiB
        Free                        : 252 MiB
    Compute Mode                    : Default
    Utilization
        Gpu                         : 4 %
        Memory                      : 12 %
        Encoder                     : 0 %
        Decoder                     : 0 %
    Encoder Stats
        Active Sessions             : 0
        Average FPS                 : 0
        Average Latency             : 0 ms
    Ecc Mode
        Current                     : N/A
        Pending                     : N/A
    ECC Errors
        Volatile
            Single Bit=20=20=20=20=20=20=20=20=20=20=20
                Device Memory       : N/A
                Register File       : N/A
                L1 Cache            : N/A
                L2 Cache            : N/A
                Texture Memory      : N/A
                Texture Shared      : N/A
                Total               : N/A
            Double Bit=20=20=20=20=20=20=20=20=20=20=20
                Device Memory       : N/A
                Register File       : N/A
                L1 Cache            : N/A
                L2 Cache            : N/A
                Texture Memory      : N/A
                Texture Shared      : N/A
                Total               : N/A
        Aggregate
            Single Bit=20=20=20=20=20=20=20=20=20=20=20
                Device Memory       : N/A
                Register File       : N/A
                L1 Cache            : N/A
                L2 Cache            : N/A
                Texture Memory      : N/A
                Texture Shared      : N/A
                Total               : N/A
            Double Bit=20=20=20=20=20=20=20=20=20=20=20
                Device Memory       : N/A
                Register File       : N/A
                L1 Cache            : N/A
                L2 Cache            : N/A
                Texture Memory      : N/A
                Texture Shared      : N/A
                Total               : N/A
    Retired Pages
        Single Bit ECC              : N/A
        Double Bit ECC              : N/A
        Pending                     : N/A
    Temperature
        GPU Current Temp            : 46 C
        GPU Shutdown Temp           : 104 C
        GPU Slowdown Temp           : 96 C
    Power Readings
        Power Management            : N/A
        Power Draw                  : N/A
        Power Limit                 : N/A
        Default Power Limit         : N/A
        Enforced Power Limit        : N/A
        Min Power Limit             : N/A
        Max Power Limit             : N/A
    Clocks
        Graphics                    : 405 MHz
        SM                          : 405 MHz
        Memory                      : 405 MHz
        Video                       : 405 MHz
    Applications Clocks
        Graphics                    : N/A
        Memory                      : N/A
    Default Applications Clocks
        Graphics                    : N/A
        Memory                      : N/A
    Max Clocks
        Graphics                    : 745 MHz
        SM                          : 745 MHz
        Memory                      : 900 MHz
        Video                       : 540 MHz
    Clock Policy
        Auto Boost                  : N/A
        Auto Boost Default          : N/A
    Processes
        Process ID                  : 1792
            Type                    : G
            Name                    : /usr/lib/xorg/Xorg
            Used GPU Memory         : 182 MiB
        Process ID                  : 2569
            Type                    : G
            Name                    : compton
            Used GPU Memory         : 6 MiB

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15298678950.1f6Ce63A.16657
Date: Sun, 24 Jun 2018 19:18:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Gpio error only from kernel higher as 4.x (k2000m; 0x0e73=
b0a2; version 80.07.40.00.02)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107016">107016</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Gpio error only from kernel higher as 4.x (k2000m; 0x0e73b0a2=
; version 80.07.40.00.02)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>tothsoft&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D140303=
" name=3D"attach_140303" title=3D"dmesg message from old kernel 3.19 (when =
it was all ok=3D  no problem)">attachment 140303</a> <a href=3D"attachment.=
cgi?id=3D140303&amp;action=3Dedit" title=3D"dmesg message from old kernel 3=
.19 (when it was all ok=3D  no problem)">[details]</a></span>
dmesg message from old kernel 3.19 (when it was all ok=3D  no problem)

Dear developers,

this bug of nouveau driver is also always in kernel 4.15 (in last ubuntu).

Maybe it is connected on your changes from 2016:
<a href=3D"https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?=
id=3Da24ded627e42d453546c553d609edc073f59cd57">https://cgit.freedesktop.org=
/nouveau/xf86-video-nouveau/commit/?id=3Da24ded627e42d453546c553d609edc073f=
59cd57</a>


Therefore i must wait on fix, and now i am only on old kernel 3.19 on Linux
mint 17.3, which have support to y2019. Thx

In attachment is dmesg message from old kernel 3.19 (when it was all ok=3D =
 no
problem).

From kernels 4+ i have dmesg message:
 [ 9007.285922] nouveau 0000:01:00.0: volt: couldn't set 887500uv
 [ 9007.285930] nouveau 0000:01:00.0: clk: failed to raise voltage: -22
 [ 9007.285933] nouveau 0000:01:00.0: clk: error setting pstate 1: -22
 [ 9333.740189] nouveau 0000:01:00.0: volt: couldn't set 825000uv
 [ 9333.740196] nouveau 0000:01:00.0: clk: failed to raise voltage: -22
 [ 9333.740200] nouveau 0000:01:00.0: clk: error setting pstate 0: -22




so, ..nouveau driver going only according to BIOS clocks ?

GPU clock in BIOS&quot;405 mhz&quot;: <a href=3D"https://www.techpowerup.co=
m/vgabios/147121/147121">https://www.techpowerup.com/vgabios/147121/147121<=
/a>

GPU clock with driver &quot;745 mhz&quot;:=20=20
<a href=3D"https://www.techpowerup.com/gpudb/1424/quadro-k2000m">https://ww=
w.techpowerup.com/gpudb/1424/quadro-k2000m</a>

[   19.715426] nouveau 0000:01:00.0: bios: version 80.07.40.00.02
[   19.716325] nouveau 0000:01:00.0: mxm: BIOS version 3.0
[   19.719835] ACPI Warning: \_SB.PCI0.PEGP.DGFX._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160930/nsarguments-95)
[   19.720419] nouveau 0000:01:00.0: volt: Type mismatch between the voltage
table type and the GPIO table. Fallback to GPIO mode.


Here is nvidia driver message:

nvidia-smi -q

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DNVSMI LOG=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

Timestamp                           : Thu Jul 27 06:12:05 2017
Driver Version                      : 375.66

Attached GPUs                       : 1
GPU 0000:01:00.0
    Product Name                    : Quadro K2000M
    Product Brand                   : Quadro
    Display Mode                    : Enabled
    Display Active                  : Enabled
    Persistence Mode                : Disabled
    Accounting Mode                 : Disabled
    Accounting Mode Buffer Size     : 1920
    Driver Model
        Current                     : N/A
        Pending                     : N/A
    Serial Number                   : N/A
    GPU UUID                        : GPU-ff2c74f8-3fa3-b0d5-c61d-fa8141f9c=
703
    Minor Number                    : 0
    VBIOS Version                   : 80.07.40.00.02
    MultiGPU Board                  : No
    Board ID                        : 0x100
    GPU Part Number                 : N/A
    Inforom Version
        Image Version               : N/A
        OEM Object                  : N/A
        ECC Object                  : N/A
        Power Management Object     : N/A
    GPU Operation Mode
        Current                     : N/A
        Pending                     : N/A
    GPU Virtualization Mode
        Virtualization mode         : None
    PCI
        Bus                         : 0x01
        Device                      : 0x00
        Domain                      : 0x0000
        Device Id                   : 0x0FFB10DE
        Bus Id                      : 0000:01:00.0
        Sub System Id               : 0x176B103C
        GPU Link Info
            PCIe Generation
                Max                 : 2
                Current             : 1
            Link Width
                Max                 : 16x
                Current             : 16x
        Bridge Chip
            Type                    : N/A
            Firmware                : N/A
        Replays since reset         : 0
        Tx Throughput               : N/A
        Rx Throughput               : N/A
    Fan Speed                       : N/A
    Performance State               : P8
    Clocks Throttle Reasons
        Idle                        : Not Active
        Applications Clocks Setting : Not Active
        SW Power Cap                : Not Active
        HW Slowdown                 : Not Active
        Sync Boost                  : Not Active
        Unknown                     : Not Active
    FB Memory Usage
        Total                       : 1997 MiB
        Used                        : 190 MiB
        Free                        : 1807 MiB
    BAR1 Memory Usage
        Total                       : 256 MiB
        Used                        : 4 MiB
        Free                        : 252 MiB
    Compute Mode                    : Default
    Utilization
        Gpu                         : 4 %
        Memory                      : 12 %
        Encoder                     : 0 %
        Decoder                     : 0 %
    Encoder Stats
        Active Sessions             : 0
        Average FPS                 : 0
        Average Latency             : 0 ms
    Ecc Mode
        Current                     : N/A
        Pending                     : N/A
    ECC Errors
        Volatile
            Single Bit=20=20=20=20=20=20=20=20=20=20=20
                Device Memory       : N/A
                Register File       : N/A
                L1 Cache            : N/A
                L2 Cache            : N/A
                Texture Memory      : N/A
                Texture Shared      : N/A
                Total               : N/A
            Double Bit=20=20=20=20=20=20=20=20=20=20=20
                Device Memory       : N/A
                Register File       : N/A
                L1 Cache            : N/A
                L2 Cache            : N/A
                Texture Memory      : N/A
                Texture Shared      : N/A
                Total               : N/A
        Aggregate
            Single Bit=20=20=20=20=20=20=20=20=20=20=20
                Device Memory       : N/A
                Register File       : N/A
                L1 Cache            : N/A
                L2 Cache            : N/A
                Texture Memory      : N/A
                Texture Shared      : N/A
                Total               : N/A
            Double Bit=20=20=20=20=20=20=20=20=20=20=20
                Device Memory       : N/A
                Register File       : N/A
                L1 Cache            : N/A
                L2 Cache            : N/A
                Texture Memory      : N/A
                Texture Shared      : N/A
                Total               : N/A
    Retired Pages
        Single Bit ECC              : N/A
        Double Bit ECC              : N/A
        Pending                     : N/A
    Temperature
        GPU Current Temp            : 46 C
        GPU Shutdown Temp           : 104 C
        GPU Slowdown Temp           : 96 C
    Power Readings
        Power Management            : N/A
        Power Draw                  : N/A
        Power Limit                 : N/A
        Default Power Limit         : N/A
        Enforced Power Limit        : N/A
        Min Power Limit             : N/A
        Max Power Limit             : N/A
    Clocks
        Graphics                    : 405 MHz
        SM                          : 405 MHz
        Memory                      : 405 MHz
        Video                       : 405 MHz
    Applications Clocks
        Graphics                    : N/A
        Memory                      : N/A
    Default Applications Clocks
        Graphics                    : N/A
        Memory                      : N/A
    Max Clocks
        Graphics                    : 745 MHz
        SM                          : 745 MHz
        Memory                      : 900 MHz
        Video                       : 540 MHz
    Clock Policy
        Auto Boost                  : N/A
        Auto Boost Default          : N/A
    Processes
        Process ID                  : 1792
            Type                    : G
            Name                    : /usr/lib/xorg/Xorg
            Used GPU Memory         : 182 MiB
        Process ID                  : 2569
            Type                    : G
            Name                    : compton
            Used GPU Memory         : 6 MiB</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15298678950.1f6Ce63A.16657--

--===============0600116468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0600116468==--
