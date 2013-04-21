From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63790] New: Nouveau fb boots laptop screen a GIANT
	BARCODE
Date: Sun, 21 Apr 2013 23:11:03 +0000
Message-ID: <bug-63790-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1530668220=="
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


--===============1530668220==
Content-Type: multipart/alternative; boundary="1366585864.aa8D1.22603"; charset="us-ascii"


--1366585864.aa8D1.22603
Date: Sun, 21 Apr 2013 23:11:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63790

          Priority: medium
            Bug ID: 63790
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau fb boots laptop screen a GIANT BARCODE
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: aka.bugle-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 78316
  --> https://bugs.freedesktop.org/attachment.cgi?id=78316&action=edit
section of kernel log

New install on tablet PC with NV11m
Xorg not installed yet... Can't get past getting the nouveau kms kernel to boot
a working framebuffer console. The internal screen switches by KMS to the
framebuffer (LVDS-1)and slowly displays about 20 vertical white lines (like a
giant bar code.)
 VGA-1 output (external monitor) is fine and at kernel set resolution. 
 kernel command...


title Gentoo Linux Nouveau-KMS kernel 3.7.10 
root (hd0,0) 
kernel /boot/bugle-nouveau-3.7.10-gentoo root=/dev/sda3 net.ifnames=0
nouveau.modeset=1 video=LVDS-1:1024x768 M -32 @60 nouveau.nofbaccel=1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1366585864.aa8D1.22603
Date: Sun, 21 Apr 2013 23:11:04 +0000
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
   title="NEW --- - Nouveau fb boots laptop screen a GIANT BARCODE"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63790">63790</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau fb boots laptop screen a GIANT BARCODE
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
          <td>aka.bugle&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=78316" name="attach_78316" title="section of kernel log">attachment 78316</a> <a href="attachment.cgi?id=78316&amp;action=edit" title="section of kernel log">[details]</a></span>
section of kernel log

New install on tablet PC with NV11m
Xorg not installed yet... Can't get past getting the nouveau kms kernel to boot
a working framebuffer console. The internal screen switches by KMS to the
framebuffer (LVDS-1)and slowly displays about 20 vertical white lines (like a
giant bar code.)
 VGA-1 output (external monitor) is fine and at kernel set resolution. 
 kernel command...


title Gentoo Linux Nouveau-KMS kernel 3.7.10 
root (hd0,0) 
kernel /boot/bugle-nouveau-3.7.10-gentoo root=/dev/sda3 net.ifnames=0
nouveau.modeset=1 video=LVDS-1:1024x768 M -32 &#64;60 nouveau.nofbaccel=1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1366585864.aa8D1.22603--

--===============1530668220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1530668220==--
