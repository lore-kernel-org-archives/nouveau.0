From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88463] New: Black screen on "Unlocking the disk"
	screen
Date: Thu, 15 Jan 2015 14:52:51 +0000
Message-ID: <bug-88463-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1276014228=="
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


--===============1276014228==
Content-Type: multipart/alternative; boundary="1421333571.6cCA81.17411"; charset="UTF-8"


--1421333571.6cCA81.17411
Date: Thu, 15 Jan 2015 14:52:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88463

            Bug ID: 88463
           Summary: Black screen on "Unlocking the disk" screen
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: c3787909-mUGfDteaTM8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hardware: Dell Vostro 1500 (Core 2 Duo T7250, GeForce 8400 GS 128 MB and 8600
GT 256 MB, I upgraded GPU and both are affected).

Software: Ubuntu 14.04 x64 and 14.10 x64 with Nouveau driver. Whole HDD is
encrypted using native Ubuntu feature (with LVM), which was selected and
configured during standard OS installation process.

Problem description: When I turn PC on I can see BIOS info, after that I see
purple screen for couple of seconds, then black screen (there should be
"Unlocking the disk" screen). But when I type in the password and press Enter
PC starts. It starts with black screen until Ubuntu login screen appears. From
Ubuntu login screen I log in as usual and everything is ok.

P.S. After I turn off PC while black screen (where should be "Unlocking the
disk" screen) with long press of power button - when I turn it on again GRUB
starts and "Unlocking the disk" screen appears (no black screen and everything
is good).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421333571.6cCA81.17411
Date: Thu, 15 Jan 2015 14:52:51 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Black screen on &quot;Unlocking the disk&quot; screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88463">88463</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Black screen on &quot;Unlocking the disk&quot; screen
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>c3787909&#64;trbvm.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hardware: Dell Vostro 1500 (Core 2 Duo T7250, GeForce 8400 GS 128 MB and 8600
GT 256 MB, I upgraded GPU and both are affected).

Software: Ubuntu 14.04 x64 and 14.10 x64 with Nouveau driver. Whole HDD is
encrypted using native Ubuntu feature (with LVM), which was selected and
configured during standard OS installation process.

Problem description: When I turn PC on I can see BIOS info, after that I see
purple screen for couple of seconds, then black screen (there should be
&quot;Unlocking the disk&quot; screen). But when I type in the password and press Enter
PC starts. It starts with black screen until Ubuntu login screen appears. From
Ubuntu login screen I log in as usual and everything is ok.

P.S. After I turn off PC while black screen (where should be &quot;Unlocking the
disk&quot; screen) with long press of power button - when I turn it on again GRUB
starts and &quot;Unlocking the disk&quot; screen appears (no black screen and everything
is good).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421333571.6cCA81.17411--

--===============1276014228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1276014228==--
