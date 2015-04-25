From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90180] New: Segmentation Fault with CLANG builder
Date: Sat, 25 Apr 2015 21:51:02 +0000
Message-ID: <bug-90180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1673912193=="
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


--===============1673912193==
Content-Type: multipart/alternative; boundary="1429998662.F8AeA451.20796"; charset="UTF-8"


--1429998662.F8AeA451.20796
Date: Sat, 25 Apr 2015 21:51:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90180

            Bug ID: 90180
           Summary: Segmentation Fault with CLANG builder
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mustelator-mRCrAkd8dF0@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 115331
  --> https://bugs.freedesktop.org/attachment.cgi?id=115331&action=edit
Backtrace normal and full

- Building nouveau with gcc, no problems.
- Building nouveau with clang -O0, no problems.
- Building nouveau with clang -O[1-x], the driver seems work ok, but when I
close the xorg, I warned of segmentation fault.


Versions
--------
Nouveau: x11-drivers/xf86-video-nouveau-1.0.11

gcc:    gcc (Gentoo 4.8.4 p1.4, pie-0.6.1) 4.8.4
    Copyright (C) 2013 Free Software Foundation, Inc.

clang:    clang version 3.6.0 (tags/RELEASE_360/final)
    Target: x86_64-pc-linux-gnu
    Thread model: posix

Xorg:    X.Org X Server 1.16.4
    Release Date: 2014-12-20
    X Protocol Version 11, Revision 0

Current version of pixman: 0.32.6
    Before reporting problems, check http://wiki.x.org
    to make sure that you have the latest version.


System
------
Linux xxx 3.14.37-gentoo #4 SMP Sat Apr 25 20:18:53 CEST 2015 x86_64 AMD
Phenom(tm) II X6 1090T Processor AuthenticAMD GNU/Linux

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1429998662.F8AeA451.20796
Date: Sat, 25 Apr 2015 21:51:02 +0000
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
   title="NEW - Segmentation Fault with CLANG builder"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90180">90180</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Segmentation Fault with CLANG builder
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
          <td>minor
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
          <td>mustelator&#64;yahoo.es
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115331" name="attach_115331" title="Backtrace normal and full">attachment 115331</a> <a href="attachment.cgi?id=115331&amp;action=edit" title="Backtrace normal and full">[details]</a></span>
Backtrace normal and full

- Building nouveau with gcc, no problems.
- Building nouveau with clang -O0, no problems.
- Building nouveau with clang -O[1-x], the driver seems work ok, but when I
close the xorg, I warned of segmentation fault.


Versions
--------
Nouveau: x11-drivers/xf86-video-nouveau-1.0.11

gcc:    gcc (Gentoo 4.8.4 p1.4, pie-0.6.1) 4.8.4
    Copyright (C) 2013 Free Software Foundation, Inc.

clang:    clang version 3.6.0 (tags/RELEASE_360/final)
    Target: x86_64-pc-linux-gnu
    Thread model: posix

Xorg:    X.Org X Server 1.16.4
    Release Date: 2014-12-20
    X Protocol Version 11, Revision 0

Current version of pixman: 0.32.6
    Before reporting problems, check <a href="http://wiki.x.org">http://wiki.x.org</a>
    to make sure that you have the latest version.


System
------
Linux xxx 3.14.37-gentoo #4 SMP Sat Apr 25 20:18:53 CEST 2015 x86_64 AMD
Phenom(tm) II X6 1090T Processor AuthenticAMD GNU/Linux</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1429998662.F8AeA451.20796--

--===============1673912193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1673912193==--
