From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87715] New: Changing resolution away from 1680x1050
 results in scattered display
Date: Thu, 25 Dec 2014 18:06:13 +0000
Message-ID: <bug-87715-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1482758453=="
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


--===============1482758453==
Content-Type: multipart/alternative; boundary="1419530773.4b20f8c0.18792"; charset="UTF-8"


--1419530773.4b20f8c0.18792
Date: Thu, 25 Dec 2014 18:06:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87715

            Bug ID: 87715
           Summary: Changing resolution away from 1680x1050 results in
                    scattered display
           Product: Mesa
           Version: 10.4
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bruno-bdMChIhFSYk@public.gmane.org

Created attachment 111332
  --> https://bugs.freedesktop.org/attachment.cgi?id=111332&action=edit
dmesg output just after attempt to switch to 800x600 and recovery

When I boot up and login I end up with the desktop in 1680x1050 resolution. I
can do scaling to get other effective resolutions, but if I actually try to
switch the used resolution to any of the other availble ones (e.g. 1280x1024,
800x600) I end up with parts of the output scattered all over the screen in
medium sized blocks. Usually the screen will switch back to 1680x1050 and work
OK when I don't confirm I want to stay in the new resolution, but sometimes
things end up messed up when it switches back and I ned to shutdown to recover.
I am using x86_64 Fedora 21 with various kernels. I have seen this issue with
the normal 3.17 kernels, 3.18 rawhide nodebug kernels and the mainline 3.19
kernel (the latter fixes another Nouveau problem I had).
Currently mesa is at 10.4, though I think it was at 10.3 when I first switched
this machine over to linux and I still had the same issue.
The reason I care about this is that I want to play some games in wine that use
800x600 and the workaround of using xrandr scaling before and after slows
things down and is ugly.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419530773.4b20f8c0.18792
Date: Thu, 25 Dec 2014 18:06:13 +0000
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
   title="NEW - Changing resolution away from 1680x1050 results in scattered display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87715">87715</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Changing resolution away from 1680x1050 results in scattered display
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.4
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
          <td>bruno&#64;wolff.to
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=111332" name="attach_111332" title="dmesg output just after attempt to switch to 800x600 and recovery">attachment 111332</a> <a href="attachment.cgi?id=111332&amp;action=edit" title="dmesg output just after attempt to switch to 800x600 and recovery">[details]</a></span>
dmesg output just after attempt to switch to 800x600 and recovery

When I boot up and login I end up with the desktop in 1680x1050 resolution. I
can do scaling to get other effective resolutions, but if I actually try to
switch the used resolution to any of the other availble ones (e.g. 1280x1024,
800x600) I end up with parts of the output scattered all over the screen in
medium sized blocks. Usually the screen will switch back to 1680x1050 and work
OK when I don't confirm I want to stay in the new resolution, but sometimes
things end up messed up when it switches back and I ned to shutdown to recover.
I am using x86_64 Fedora 21 with various kernels. I have seen this issue with
the normal 3.17 kernels, 3.18 rawhide nodebug kernels and the mainline 3.19
kernel (the latter fixes another Nouveau problem I had).
Currently mesa is at 10.4, though I think it was at 10.3 when I first switched
this machine over to linux and I still had the same issue.
The reason I care about this is that I want to play some games in wine that use
800x600 and the workaround of using xrandr scaling before and after slows
things down and is ugly.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419530773.4b20f8c0.18792--

--===============1482758453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1482758453==--
