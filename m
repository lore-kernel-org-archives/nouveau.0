From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88514] New: X segfaults when using prime offloading
 to nouveau card
Date: Fri, 16 Jan 2015 22:45:44 +0000
Message-ID: <bug-88514-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1046933274=="
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


--===============1046933274==
Content-Type: multipart/alternative; boundary="1421448344.C7151.23358"; charset="UTF-8"


--1421448344.C7151.23358
Date: Fri, 16 Jan 2015 22:45:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88514

            Bug ID: 88514
           Summary: X segfaults when using prime offloading to nouveau
                    card
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: aidan-FQpVkr58hxg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 112362
  --> https://bugs.freedesktop.org/attachment.cgi?id=112362&action=edit
demsg from crash.

I am running Arch Linux, and I used to be able to use my discrete graphics card
for games using the method described below, but a while ago that stopped
working, I believe after an update of nouveau and/or the kernel.

I have:
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor
Integrated Graphics Controller (rev 06)
01:00.0 VGA compatible controller: NVIDIA Corporation GK107M [GeForce GT 750M]
(rev a1) with nouveau drivers.

Steps to reproduce:
I run xrandr --setprovideroffloadsink nouveau Intel at the startup of my
desktop (cinnamon). Then I run DRI_PRIME=1 glxinfo (or any other openGL
application that I've tried (glxgears, Civ V)), and X crashes and bring me back
to my display manager (lightdm).

Is there any other info you need, and/or did I report this issue completely
wrong?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421448344.C7151.23358
Date: Fri, 16 Jan 2015 22:45:44 +0000
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
   title="NEW - X segfaults when using prime offloading to nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88514">88514</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>X segfaults when using prime offloading to nouveau card
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
          <td>aidan&#64;jmad.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=112362" name="attach_112362" title="demsg from crash.">attachment 112362</a> <a href="attachment.cgi?id=112362&amp;action=edit" title="demsg from crash.">[details]</a></span>
demsg from crash.

I am running Arch Linux, and I used to be able to use my discrete graphics card
for games using the method described below, but a while ago that stopped
working, I believe after an update of nouveau and/or the kernel.

I have:
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor
Integrated Graphics Controller (rev 06)
01:00.0 VGA compatible controller: NVIDIA Corporation GK107M [GeForce GT 750M]
(rev a1) with nouveau drivers.

Steps to reproduce:
I run xrandr --setprovideroffloadsink nouveau Intel at the startup of my
desktop (cinnamon). Then I run DRI_PRIME=1 glxinfo (or any other openGL
application that I've tried (glxgears, Civ V)), and X crashes and bring me back
to my display manager (lightdm).

Is there any other info you need, and/or did I report this issue completely
wrong?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421448344.C7151.23358--

--===============1046933274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1046933274==--
