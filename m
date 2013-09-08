From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69083] New: using DVI to VGA adapter for CRT and
 specifying supported "PreferredMode" >EDID preferred mode,
 screen output is compressed into small fraction of top scan lines
Date: Sun, 08 Sep 2013 03:50:26 +0000
Message-ID: <bug-69083-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0125305438=="
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


--===============0125305438==
Content-Type: multipart/alternative; boundary="1378612227.445CeD01.6082"; charset="us-ascii"


--1378612227.445CeD01.6082
Date: Sun, 8 Sep 2013 03:50:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69083

          Priority: medium
            Bug ID: 69083
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: using DVI to VGA adapter for CRT and specifying
                    supported "PreferredMode" >EDID preferred mode, screen
                    output is compressed into small fraction of top scan
                    lines
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org
          Hardware: All
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 85416
  --> https://bugs.freedesktop.org/attachment.cgi?id=85416&action=edit
Xorg.0.log from openSUSE 13.1 milestone 4

Initial summary:
using DVI to VGA adapter for CRT and specifying supported "PreferredMode" >EDID
preferred mode, screen output is compressed into small fraction of top scan
lines

To reproduce:
1-connect DVI-I out from NVidia PCI express card (G84 here with only dual DVI
out; DVI-I-1 connected) to CRT supporting up to 2048x1536 but with 1600x1200
preferred (NEC FE2111SB here) via PCI to VGA adapter
2-set 'Option "PreferredMode" "1920x1440"' in 'Section "Monitor"' in
/etc/X11/xorg.conf*
3-start X server

Actual results:
1-entirety of video output displays into top scan lines, approximately 4mm or
less in height
2-usable desktop only for those who can use it without seeing video output

Expected results:
1-normal display output
2-normally usable desktop
3-"normal" even if fallback to EDID preferred 1600x1200 is necessary to do so
due to gfx hardware device limitation

Notes:
1-Does not happen with pure VGA connection with any gfxchip or driver.
2-Does not happen with same 3 DVI-to-VGA adapters connected to Radeon (rv380;
S-video, VGA-0 & DVI-0 available; DVI-0 connected) DVI output.
3-Problem dates back at least to openSUSE 11.4 with
xorg-x11-driver-video-nouveau-0.0.16_20110115_b795ca6-3.1.i586 installed and
server 1.9.3.
4-Problem remains at least through server 1.14.2 and
xorg-x11-driver-video-nouveau-1.0.9-1.3 on openSUSE 13.1M4, and server 1.14.1
on Fedora 19 with xorg-x11-drv-nouveau-1.0.7-1.fc19.
5-Happens with or without specific port specified via Option in 'Section
"Device"'.
6-Happens on both 32 and 64 bit x86 installations.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378612227.445CeD01.6082
Date: Sun, 8 Sep 2013 03:50:27 +0000
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
   title="NEW --- - using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083">69083</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mrmazda&#64;earthlink.net
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>All
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
        <pre>Created <span class=""><a href="attachment.cgi?id=85416" name="attach_85416" title="Xorg.0.log from openSUSE 13.1 milestone 4">attachment 85416</a> <a href="attachment.cgi?id=85416&amp;action=edit" title="Xorg.0.log from openSUSE 13.1 milestone 4">[details]</a></span>
Xorg.0.log from openSUSE 13.1 milestone 4

Initial summary:
using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID
preferred mode, screen output is compressed into small fraction of top scan
lines

To reproduce:
1-connect DVI-I out from NVidia PCI express card (G84 here with only dual DVI
out; DVI-I-1 connected) to CRT supporting up to 2048x1536 but with 1600x1200
preferred (NEC FE2111SB here) via PCI to VGA adapter
2-set 'Option &quot;PreferredMode&quot; &quot;1920x1440&quot;' in 'Section &quot;Monitor&quot;' in
/etc/X11/xorg.conf*
3-start X server

Actual results:
1-entirety of video output displays into top scan lines, approximately 4mm or
less in height
2-usable desktop only for those who can use it without seeing video output

Expected results:
1-normal display output
2-normally usable desktop
3-&quot;normal&quot; even if fallback to EDID preferred 1600x1200 is necessary to do so
due to gfx hardware device limitation

Notes:
1-Does not happen with pure VGA connection with any gfxchip or driver.
2-Does not happen with same 3 DVI-to-VGA adapters connected to Radeon (rv380;
S-video, VGA-0 &amp; DVI-0 available; DVI-0 connected) DVI output.
3-Problem dates back at least to openSUSE 11.4 with
xorg-x11-driver-video-nouveau-0.0.16_20110115_b795ca6-3.1.i586 installed and
server 1.9.3.
4-Problem remains at least through server 1.14.2 and
xorg-x11-driver-video-nouveau-1.0.9-1.3 on openSUSE 13.1M4, and server 1.14.1
on Fedora 19 with xorg-x11-drv-nouveau-1.0.7-1.fc19.
5-Happens with or without specific port specified via Option in 'Section
&quot;Device&quot;'.
6-Happens on both 32 and 64 bit x86 installations.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378612227.445CeD01.6082--

--===============0125305438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0125305438==--
