From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93630] New: [NVE6] disrupted display,
 cannot switch VT, everything else still works,
 E[   PDISP] link training failed
Date: Thu, 07 Jan 2016 14:17:10 +0000
Message-ID: <bug-93630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0684333802=="
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


--===============0684333802==
Content-Type: multipart/alternative; boundary="1452176230.FDC0F1.12960"; charset="UTF-8"


--1452176230.FDC0F1.12960
Date: Thu, 7 Jan 2016 14:17:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93630

            Bug ID: 93630
           Summary: [NVE6] disrupted display, cannot switch VT, everything
                    else still works, E[   PDISP] link training failed
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

The display randomly gets corrupted with randomly moving block artifacts. This
means the display looks like a chess board with every other block being either
completely black or semi-transparent. In the latter case I can still see the
normal desktop but it appears like being looked at trough a 50%-gray filter.
The other blocks of the "chess board" are good. If the display content changes
(e.g. mouse movement), the "arrangement of the chess board" changes.

I can still work normally, start desktop applications, click around and shut
down the PC the normal way. But VT switching does not work anymore.

The crash seems to occur more frequently, if I play videos (mplayer or Flash),
but this is not a requirement.

The crash does not occur, if I use the blob firmware
(nouveau.config="NvGrUseFw=1").

Graphic card: "ASUS GeForce GTX 660 PCI 3.0 2GB DDR5"

uname: "Linux 4.1.12-gentoo #2 SMP Wed Dec 23 19:28:09 CET 2015 x86_64 Intel(R)
Xeon(R) CPU E3-1230 v3 @ 3.30GHz GenuineIntel GNU/Linux"

Dmesg:

Jan 06 18:43:09 matthias-pc kernel: nouveau E[  
PDISP][0000:01:00.0][0x00000006] 04:0006:0f44: link training failed
Jan 06 18:43:09 matthias-pc kernel: nouveau E[  
PDISP][0000:01:00.0][0x00000006] 04:0006:0f44: link training failed
Jan 06 18:43:09 matthias-pc kernel: nouveau E[  
PDISP][0000:01:00.0][0x00000006] 04:0006:0f44: link not trained before attach
Jan 06 18:43:09 matthias-pc kernel: nouveau E[  
PDISP][0000:01:00.0][0x00000006] 04:0006:0f44: link training failed

For more information see attached files.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1452176230.FDC0F1.12960
Date: Thu, 7 Jan 2016 14:17:10 +0000
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
   title="NEW - [NVE6] disrupted display, cannot switch VT, everything else still works, E[ PDISP] link training failed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93630">93630</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE6] disrupted display, cannot switch VT, everything else still works, E[   PDISP] link training failed
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
          <td>matthias.h.nagel&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>The display randomly gets corrupted with randomly moving block artifacts. This
means the display looks like a chess board with every other block being either
completely black or semi-transparent. In the latter case I can still see the
normal desktop but it appears like being looked at trough a 50%-gray filter.
The other blocks of the &quot;chess board&quot; are good. If the display content changes
(e.g. mouse movement), the &quot;arrangement of the chess board&quot; changes.

I can still work normally, start desktop applications, click around and shut
down the PC the normal way. But VT switching does not work anymore.

The crash seems to occur more frequently, if I play videos (mplayer or Flash),
but this is not a requirement.

The crash does not occur, if I use the blob firmware
(nouveau.config=&quot;NvGrUseFw=1&quot;).

Graphic card: &quot;ASUS GeForce GTX 660 PCI 3.0 2GB DDR5&quot;

uname: &quot;Linux 4.1.12-gentoo #2 SMP Wed Dec 23 19:28:09 CET 2015 x86_64 Intel(R)
Xeon(R) CPU E3-1230 v3 &#64; 3.30GHz GenuineIntel GNU/Linux&quot;

Dmesg:

Jan 06 18:43:09 matthias-pc kernel: nouveau E[  
PDISP][0000:01:00.0][0x00000006] 04:0006:0f44: link training failed
Jan 06 18:43:09 matthias-pc kernel: nouveau E[  
PDISP][0000:01:00.0][0x00000006] 04:0006:0f44: link training failed
Jan 06 18:43:09 matthias-pc kernel: nouveau E[  
PDISP][0000:01:00.0][0x00000006] 04:0006:0f44: link not trained before attach
Jan 06 18:43:09 matthias-pc kernel: nouveau E[  
PDISP][0000:01:00.0][0x00000006] 04:0006:0f44: link training failed

For more information see attached files.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1452176230.FDC0F1.12960--

--===============0684333802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0684333802==--
