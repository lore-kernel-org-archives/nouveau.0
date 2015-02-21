From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89273] New: [NVA8] nouveau screen corruption and X
 lockup when reclocking
Date: Sat, 21 Feb 2015 22:31:30 +0000
Message-ID: <bug-89273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1381339958=="
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


--===============1381339958==
Content-Type: multipart/alternative; boundary="1424557890.4A1e3D1.24156"; charset="UTF-8"


--1424557890.4A1e3D1.24156
Date: Sat, 21 Feb 2015 22:31:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89273

            Bug ID: 89273
           Summary: [NVA8] nouveau screen corruption and X lockup when
                    reclocking
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: maxim.stargazer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 113734
  --> https://bugs.freedesktop.org/attachment.cgi?id=113734&action=edit
Thinkpad T410, Quadro NVS 3100M (256M GDDR3) vbios dump

Kernel: 3.19.1
Hardware: Thinkpad T410, Quadro NVS 3100M (256M GDDR3) [similar hw but
different VRAM compared to bug 88415]
Problem: reclocking between pstates 3 and 7 is flawless, but reclocking to
pstate f causes problems.
Possible scenarios:

1. X server is not running, trying to reclock from the fb. 
   echo f > pstate
  Image gets corrupted (vertical flickering lines), but there is no lockup and
after
   echo 7 > pstate
everything gets back to normal. After that system works just fine.
Dmesg attached (with nouveau.debug=debug)

2. X server is running. 
   echo f > pstate
   Screen gets corrupted in similar fashion, but system locks up and after few
second stops to respond even to SysRq.
I managed to get dmesg for this scenario too.

I also mmiotraced functioning reclocking with the nvidia blob. Trace is quite
large (120MB). Should I truncate it somehow to upload, or just provide as is?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424557890.4A1e3D1.24156
Date: Sat, 21 Feb 2015 22:31:30 +0000
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
   title="NEW - [NVA8] nouveau screen corruption and X lockup when reclocking"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89273">89273</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVA8] nouveau screen corruption and X lockup when reclocking
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
          <td>maxim.stargazer&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=113734" name="attach_113734" title="Thinkpad T410, Quadro NVS 3100M (256M GDDR3) vbios dump">attachment 113734</a> <a href="attachment.cgi?id=113734&amp;action=edit" title="Thinkpad T410, Quadro NVS 3100M (256M GDDR3) vbios dump">[details]</a></span>
Thinkpad T410, Quadro NVS 3100M (256M GDDR3) vbios dump

Kernel: 3.19.1
Hardware: Thinkpad T410, Quadro NVS 3100M (256M GDDR3) [similar hw but
different VRAM compared to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA8] nouveau GPU lockup when reclocking"
   href="show_bug.cgi?id=88415">bug 88415</a>]
Problem: reclocking between pstates 3 and 7 is flawless, but reclocking to
pstate f causes problems.
Possible scenarios:

1. X server is not running, trying to reclock from the fb. 
   echo f &gt; pstate
  Image gets corrupted (vertical flickering lines), but there is no lockup and
after
   echo 7 &gt; pstate
everything gets back to normal. After that system works just fine.
Dmesg attached (with nouveau.debug=debug)

2. X server is running. 
   echo f &gt; pstate
   Screen gets corrupted in similar fashion, but system locks up and after few
second stops to respond even to SysRq.
I managed to get dmesg for this scenario too.

I also mmiotraced functioning reclocking with the nvidia blob. Trace is quite
large (120MB). Should I truncate it somehow to upload, or just provide as is?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424557890.4A1e3D1.24156--

--===============1381339958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1381339958==--
