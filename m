From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92556] New: System hangs at visiting WebGL site
Date: Tue, 20 Oct 2015 15:24:59 +0000
Message-ID: <bug-92556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1767378630=="
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


--===============1767378630==
Content-Type: multipart/alternative; boundary="1445354699.0dD5aDC0.23569"; charset="UTF-8"


--1445354699.0dD5aDC0.23569
Date: Tue, 20 Oct 2015 15:24:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92556

            Bug ID: 92556
           Summary: System hangs at visiting WebGL site
           Product: Mesa
           Version: 11.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mrs.sub-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 119007
  --> https://bugs.freedesktop.org/attachment.cgi?id=119007&action=edit
Two files: 'kmsg' and 'Xorg.0.log.old'

When I visit any WebGL site, after it's done loading everything on screen
freezes except mouse cursor. Keyboard not responding too, so only hard reset
helps :)

Kernel messages and Xorg log are in attachment.

I have already posted a topic at
https://bbs.archlinux.org/viewtopic.php?id=203765 There are some other kernel
messages.

--

$ pacman -Qi mesa libdrm xf86-video-nouveau xorg-server firefox | egrep
"Name|Version" 

    Name           : mesa
    Version        : 11.0.3-1

    Name           : libdrm
    Version        : 2.4.65-1

    Name           : xf86-video-nouveau
    Version        : 1.0.11-3

    Name           : xorg-server
    Version        : 1.17.2-4

    Name           : firefox
    Version        : 41.0.2-1

--

Maybe it somewhat related to https://bugs.freedesktop.org/show_bug.cgi?id=89985

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445354699.0dD5aDC0.23569
Date: Tue, 20 Oct 2015 15:24:59 +0000
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
   title="NEW - System hangs at visiting WebGL site"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92556">92556</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>System hangs at visiting WebGL site
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.0
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
          <td>mrs.sub&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=119007" name="attach_119007" title="Two files: 'kmsg' and 'Xorg.0.log.old'">attachment 119007</a> <a href="attachment.cgi?id=119007&amp;action=edit" title="Two files: 'kmsg' and 'Xorg.0.log.old'">[details]</a></span>
Two files: 'kmsg' and 'Xorg.0.log.old'

When I visit any WebGL site, after it's done loading everything on screen
freezes except mouse cursor. Keyboard not responding too, so only hard reset
helps :)

Kernel messages and Xorg log are in attachment.

I have already posted a topic at
<a href="https://bbs.archlinux.org/viewtopic.php?id=203765">https://bbs.archlinux.org/viewtopic.php?id=203765</a> There are some other kernel
messages.

--

$ pacman -Qi mesa libdrm xf86-video-nouveau xorg-server firefox | egrep
&quot;Name|Version&quot; 

    Name           : mesa
    Version        : 11.0.3-1

    Name           : libdrm
    Version        : 2.4.65-1

    Name           : xf86-video-nouveau
    Version        : 1.0.11-3

    Name           : xorg-server
    Version        : 1.17.2-4

    Name           : firefox
    Version        : 41.0.2-1

--

Maybe it somewhat related to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - system video hangs on video switch to fullscreen"
   href="show_bug.cgi?id=89985">https://bugs.freedesktop.org/show_bug.cgi?id=89985</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445354699.0dD5aDC0.23569--

--===============1767378630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1767378630==--
