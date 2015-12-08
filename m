From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93300] New: Two Worlds 2 renders water incorrectly
Date: Tue, 08 Dec 2015 19:18:22 +0000
Message-ID: <bug-93300-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0375227804=="
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


--===============0375227804==
Content-Type: multipart/alternative; boundary="1449602302.CC1DBF1.15051"; charset="UTF-8"


--1449602302.CC1DBF1.15051
Date: Tue, 8 Dec 2015 19:18:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93300

            Bug ID: 93300
           Summary: Two Worlds 2 renders water incorrectly
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Keywords: regression
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
                CC: imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org

Created attachment 120416
  --> https://bugs.freedesktop.org/attachment.cgi?id=120416&action=edit
screenshot

In Two Worlds 2 (running in Wine 1.8-rc3) water is not rendered properly: it
looks as if textures are "split up" into several pieces, as it can be seen in
the attached screenshot.
The problem doesn't occur with the software renderer (LIBGL_ALWAYS_SOFTWARE=1).
Disabling optimizations doesn't help (NV50_PROG_OPTIMIZE=0).

According to my testing the problem was introduced by

commit abd326e81b06f58797be94bd655ee06b17a34f0c
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Fri Dec 4 15:21:11 2015 -0500

    nv50/ir: propagate indirect loads into instructions

    This way $r1 = $r0 + 4; c1[$r1] becomes c1[$r0+4].

    On SM35:

    total instructions in shared programs : 6206257 -> 6185058 (-0.34%)
    total gprs used in shared programs    : 911045 -> 910722 (-0.04%)
    total local used in shared programs   : 39072 -> 39072 (0.00%)

                    local        gpr       inst      bytes
        helped           0         417        4195        4195
          hurt           0         280           0           0


Reverting the commit on current Mesa git resolves the problem here.

Apitrace log (uncompressed 150 MB):
https://drive.google.com/open?id=0B-tTbLKBl-tOQ0xNMFJlSS00S1E
The trace replays correctly on Nvidia binary drivers 340.96.

Fedora 23 32-bit
Kernel 4.4.0-rc4
X Server 1.18.0
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NV92
OpenGL core profile version string: 3.3 (Core Profile) Mesa 11.2.0-devel
(git-f61ceeb)
OpenGL core profile shading language version string: 3.30

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1449602302.CC1DBF1.15051
Date: Tue, 8 Dec 2015 19:18:22 +0000
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
   title="NEW - Two Worlds 2 renders water incorrectly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93300">93300</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Two Worlds 2 renders water incorrectly
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Keywords</th>
          <td>regression
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
          <td>gyebro69&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>CC</th>
          <td>imirkin&#64;alum.mit.edu
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=120416" name="attach_120416" title="screenshot">attachment 120416</a> <a href="attachment.cgi?id=120416&amp;action=edit" title="screenshot">[details]</a></span>
screenshot

In Two Worlds 2 (running in Wine 1.8-rc3) water is not rendered properly: it
looks as if textures are &quot;split up&quot; into several pieces, as it can be seen in
the attached screenshot.
The problem doesn't occur with the software renderer (LIBGL_ALWAYS_SOFTWARE=1).
Disabling optimizations doesn't help (NV50_PROG_OPTIMIZE=0).

According to my testing the problem was introduced by

commit abd326e81b06f58797be94bd655ee06b17a34f0c
Author: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
Date:   Fri Dec 4 15:21:11 2015 -0500

    nv50/ir: propagate indirect loads into instructions

    This way $r1 = $r0 + 4; c1[$r1] becomes c1[$r0+4].

    On SM35:

    total instructions in shared programs : 6206257 -&gt; 6185058 (-0.34%)
    total gprs used in shared programs    : 911045 -&gt; 910722 (-0.04%)
    total local used in shared programs   : 39072 -&gt; 39072 (0.00%)

                    local        gpr       inst      bytes
        helped           0         417        4195        4195
          hurt           0         280           0           0


Reverting the commit on current Mesa git resolves the problem here.

Apitrace log (uncompressed 150 MB):
<a href="https://drive.google.com/open?id=0B-tTbLKBl-tOQ0xNMFJlSS00S1E">https://drive.google.com/open?id=0B-tTbLKBl-tOQ0xNMFJlSS00S1E</a>
The trace replays correctly on Nvidia binary drivers 340.96.

Fedora 23 32-bit
Kernel 4.4.0-rc4
X Server 1.18.0
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NV92
OpenGL core profile version string: 3.3 (Core Profile) Mesa 11.2.0-devel
(git-f61ceeb)
OpenGL core profile shading language version string: 3.30</pre>
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

--1449602302.CC1DBF1.15051--

--===============0375227804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0375227804==--
