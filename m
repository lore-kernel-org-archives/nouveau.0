From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89842] New: Nvidia nouveau drivers hangs all gnome
 when open the new legacy tray in 3.16.0
Date: Tue, 31 Mar 2015 14:39:35 +0000
Message-ID: <bug-89842-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1982496269=="
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


--===============1982496269==
Content-Type: multipart/alternative; boundary="1427812775.15a2bc21.1712"; charset="UTF-8"


--1427812775.15a2bc21.1712
Date: Tue, 31 Mar 2015 14:39:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89842

            Bug ID: 89842
           Summary: Nvidia nouveau drivers hangs all gnome when open the
                    new legacy tray in 3.16.0
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ogarcia-8IrfgXQ0pwfYtjvyW6yDsg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 114766
  --> https://bugs.freedesktop.org/attachment.cgi?id=114766&action=edit
Nouveau with Gnome 3.16.0 crash log

Using nouveau drivers, when plays with the new legacy tray in Gnome 3.16.0
(open it, close, and reopen again) the entire system hangs and must to restart
Gnome Shell & GDM.

Card: GeForce GTS 250

Versions:
Kernel 3.19.3-1-ARCH
xf86-video-nouveau 1.0.11-3
mesa 10.5.2-1

I attach journal log.

Note: I open related bug in GNOME
https://bugzilla.gnome.org/show_bug.cgi?id=747115 They advised me that open bug
here too.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427812775.15a2bc21.1712
Date: Tue, 31 Mar 2015 14:39:35 +0000
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
   title="NEW - Nvidia nouveau drivers hangs all gnome when open the new legacy tray in 3.16.0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89842">89842</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nvidia nouveau drivers hangs all gnome when open the new legacy tray in 3.16.0
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
          <td>critical
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
          <td>ogarcia&#64;moire.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=114766" name="attach_114766" title="Nouveau with Gnome 3.16.0 crash log">attachment 114766</a> <a href="attachment.cgi?id=114766&amp;action=edit" title="Nouveau with Gnome 3.16.0 crash log">[details]</a></span>
Nouveau with Gnome 3.16.0 crash log

Using nouveau drivers, when plays with the new legacy tray in Gnome 3.16.0
(open it, close, and reopen again) the entire system hangs and must to restart
Gnome Shell &amp; GDM.

Card: GeForce GTS 250

Versions:
Kernel 3.19.3-1-ARCH
xf86-video-nouveau 1.0.11-3
mesa 10.5.2-1

I attach journal log.

Note: I open related bug in GNOME
<a href="https://bugzilla.gnome.org/show_bug.cgi?id=747115">https://bugzilla.gnome.org/show_bug.cgi?id=747115</a> They advised me that open bug
here too.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427812775.15a2bc21.1712--

--===============1982496269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1982496269==--
