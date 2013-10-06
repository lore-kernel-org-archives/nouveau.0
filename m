From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70208] New: Nouveau driver doesn't find vbios for
 Geforce GT 750M on Asus N750JV laptop
Date: Sun, 06 Oct 2013 18:42:06 +0000
Message-ID: <bug-70208-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2088991016=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============2088991016==
Content-Type: multipart/alternative; boundary="1381084926.2cB8cF11.26333"; charset="us-ascii"


--1381084926.2cB8cF11.26333
Date: Sun, 6 Oct 2013 18:42:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70208

          Priority: medium
            Bug ID: 70208
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau driver doesn't find vbios for Geforce GT 750M
                    on Asus N750JV laptop
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: 4712.joey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

When modprobing the nouveau module I get the following dmesg output: (driver
not able to find the vbios)

[ 1001.055090] MXM: GUID detected in BIOS
[ 1001.055508] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e7240a2
[ 1001.055511] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[ 1001.055512] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[ 1001.057047] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[ 1001.057056] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 1001.057057] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[ 1001.057109] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 1001.057109] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[ 1001.057110] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 1001.057111] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[ 1001.057164] nouveau 0000:01:00.0: Invalid ROM contents
[ 1001.057188] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 1001.057189] nouveau  [   VBIOS][0000:01:00.0] checking PLATFORM for image...
[ 1001.057190] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 1001.057191] nouveau E[   VBIOS][0000:01:00.0] unable to locate usable image
[ 1001.057210] nouveau E[  DEVICE][0000:01:00.0] failed to create 0x10000001,
-22
[ 1001.057229] nouveau E[     DRM] failed to create 0x80000080, -22
[ 1001.057388] nouveau: probe of 0000:01:00.0 failed with error -22

The nvidia GPU will then not be detected by X.

The nvidia blob driver is working on the same machine.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381084926.2cB8cF11.26333
Date: Sun, 6 Oct 2013 18:42:06 +0000
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
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208">70208</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop
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
          <td>4712.joey&#64;gmail.com
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
        <pre>When modprobing the nouveau module I get the following dmesg output: (driver
not able to find the vbios)

[ 1001.055090] MXM: GUID detected in BIOS
[ 1001.055508] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e7240a2
[ 1001.055511] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[ 1001.055512] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[ 1001.057047] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[ 1001.057056] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 1001.057057] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[ 1001.057109] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 1001.057109] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[ 1001.057110] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 1001.057111] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[ 1001.057164] nouveau 0000:01:00.0: Invalid ROM contents
[ 1001.057188] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 1001.057189] nouveau  [   VBIOS][0000:01:00.0] checking PLATFORM for image...
[ 1001.057190] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 1001.057191] nouveau E[   VBIOS][0000:01:00.0] unable to locate usable image
[ 1001.057210] nouveau E[  DEVICE][0000:01:00.0] failed to create 0x10000001,
-22
[ 1001.057229] nouveau E[     DRM] failed to create 0x80000080, -22
[ 1001.057388] nouveau: probe of 0000:01:00.0 failed with error -22

The nvidia GPU will then not be detected by X.

The nvidia blob driver is working on the same machine.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381084926.2cB8cF11.26333--

--===============2088991016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2088991016==--
