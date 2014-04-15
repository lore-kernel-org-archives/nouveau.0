From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77494] New: [NVE7] fails to load due to unknown
	opcode 0xc4
Date: Tue, 15 Apr 2014 18:21:16 +0000
Message-ID: <bug-77494-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0663254575=="
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


--===============0663254575==
Content-Type: multipart/alternative; boundary="1397586076.5a2bEF541.27272"; charset="us-ascii"


--1397586076.5a2bEF541.27272
Date: Tue, 15 Apr 2014 18:21:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77494

          Priority: medium
            Bug ID: 77494
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVE7] fails to load due to unknown opcode 0xc4
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mpredosin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Since kernel 3.13.9-100 nouveau fails to load with error -22.

Kernel: 3.13.9-100.fc19.i686.PAE #1 SMP Fri Apr 4 00:57:12 UTC 2014 i686 i686
i386 GNU/Linux
X.Org X Server 1.14.4
VGA compatible controller: NVIDIA Corporation GK107GL [Quadro K2000] (rev a1)


[    1.021125] nouveau  [  DEVICE][0000:03:00.0] BOOT0  : 0x0e73e0a2
[    1.021128] nouveau  [  DEVICE][0000:03:00.0] Chipset: GK107 (NVE7)
[    1.021129] nouveau  [  DEVICE][0000:03:00.0] Family : NVE0
[    1.022357] nouveau  [   VBIOS][0000:03:00.0] checking PRAMIN for image...
[    1.022363] nouveau  [   VBIOS][0000:03:00.0] ... signature not found
[    1.022364] nouveau  [   VBIOS][0000:03:00.0] checking PROM for image...
[    1.130818] nouveau  [   VBIOS][0000:03:00.0] ... checksum invalid
[    1.130821] nouveau  [   VBIOS][0000:03:00.0] checking ACPI for image...
[    1.130822] nouveau  [   VBIOS][0000:03:00.0] ... signature not found
[    1.130823] nouveau  [   VBIOS][0000:03:00.0] checking PCIROM for image...
[    1.130829] nouveau 0000:03:00.0: Invalid ROM contents
[    1.130935] nouveau  [   VBIOS][0000:03:00.0] ... appears to be valid
[    1.130937] nouveau  [   VBIOS][0000:03:00.0] using image from PCIROM
[    1.131003] nouveau  [   VBIOS][0000:03:00.0] BIT signature found
[    1.131005] nouveau  [   VBIOS][0000:03:00.0] version 80.07.9b.00.02
[    1.131181] nouveau E[   VBIOS][0000:03:00.0] 0x77df[ ]: unknown opcode 0xc4
[    1.131241] nouveau E[ DEVINIT][0000:03:00.0] init failed, -22
[    1.131298] nouveau E[     DRM] failed to create 0x80000080, -22
[    1.131631] nouveau: probe of 0000:03:00.0 failed with error -22

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397586076.5a2bEF541.27272
Date: Tue, 15 Apr 2014 18:21:16 +0000
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
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0xc4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77494">77494</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE7] fails to load due to unknown opcode 0xc4
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
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
          <td>mpredosin&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Since kernel 3.13.9-100 nouveau fails to load with error -22.

Kernel: 3.13.9-100.fc19.i686.PAE #1 SMP Fri Apr 4 00:57:12 UTC 2014 i686 i686
i386 GNU/Linux
X.Org X Server 1.14.4
VGA compatible controller: NVIDIA Corporation GK107GL [Quadro K2000] (rev a1)


[    1.021125] nouveau  [  DEVICE][0000:03:00.0] BOOT0  : 0x0e73e0a2
[    1.021128] nouveau  [  DEVICE][0000:03:00.0] Chipset: GK107 (NVE7)
[    1.021129] nouveau  [  DEVICE][0000:03:00.0] Family : NVE0
[    1.022357] nouveau  [   VBIOS][0000:03:00.0] checking PRAMIN for image...
[    1.022363] nouveau  [   VBIOS][0000:03:00.0] ... signature not found
[    1.022364] nouveau  [   VBIOS][0000:03:00.0] checking PROM for image...
[    1.130818] nouveau  [   VBIOS][0000:03:00.0] ... checksum invalid
[    1.130821] nouveau  [   VBIOS][0000:03:00.0] checking ACPI for image...
[    1.130822] nouveau  [   VBIOS][0000:03:00.0] ... signature not found
[    1.130823] nouveau  [   VBIOS][0000:03:00.0] checking PCIROM for image...
[    1.130829] nouveau 0000:03:00.0: Invalid ROM contents
[    1.130935] nouveau  [   VBIOS][0000:03:00.0] ... appears to be valid
[    1.130937] nouveau  [   VBIOS][0000:03:00.0] using image from PCIROM
[    1.131003] nouveau  [   VBIOS][0000:03:00.0] BIT signature found
[    1.131005] nouveau  [   VBIOS][0000:03:00.0] version 80.07.9b.00.02
[    1.131181] nouveau E[   VBIOS][0000:03:00.0] 0x77df[ ]: unknown opcode 0xc4
[    1.131241] nouveau E[ DEVINIT][0000:03:00.0] init failed, -22
[    1.131298] nouveau E[     DRM] failed to create 0x80000080, -22
[    1.131631] nouveau: probe of 0000:03:00.0 failed with error -22</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397586076.5a2bEF541.27272--

--===============0663254575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0663254575==--
