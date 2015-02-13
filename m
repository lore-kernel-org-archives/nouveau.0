From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89113] New: NVA8 constantly flickers when clocked to
 lowest pstate
Date: Fri, 13 Feb 2015 00:38:59 +0000
Message-ID: <bug-89113-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0580136705=="
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


--===============0580136705==
Content-Type: multipart/alternative; boundary="1423787939.b431BdC1.7786"; charset="UTF-8"


--1423787939.b431BdC1.7786
Date: Fri, 13 Feb 2015 00:38:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89113

            Bug ID: 89113
           Summary: NVA8 constantly flickers when clocked to lowest pstate
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: charleszhang77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 113426
  --> https://bugs.freedesktop.org/attachment.cgi?id=113426&action=edit
VBIOS

with stock nouveau from kernel 3.19.0-1.fc22.x86_64

this nva8 came with a thinkpad t410

my pstate file looks like this: 
03: core 135 MHz shader 270 MHz memory 135 MHz
07: core 405 MHz shader 810 MHz memory 405 MHz
0f: core 606 MHz shader 1468 MHz memory 790 MHz
AC: core 405 MHz shader 810 MHz memory 405 MHz

when clocking to 07 or 0f everything works.
however, when clocking to pstate=03 i get constant flickering (maybe <5-10 hz),
although the clocks do change, and nothing crashes. (i can change clocks back
to 07 or 0f with no more flickering)

vbios attached

mmiodump where i fumbled around with powermizer while the blob reclocked
(no second monitor attached):
https://www.dropbox.com/s/jjh6hpcix1swc7r/mmiotrace.log?dl=0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423787939.b431BdC1.7786
Date: Fri, 13 Feb 2015 00:38:59 +0000
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
   title="NEW - NVA8 constantly flickers when clocked to lowest pstate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89113">89113</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NVA8 constantly flickers when clocked to lowest pstate
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
          <td>charleszhang77&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=113426" name="attach_113426" title="VBIOS">attachment 113426</a> <a href="attachment.cgi?id=113426&amp;action=edit" title="VBIOS">[details]</a></span>
VBIOS

with stock nouveau from kernel 3.19.0-1.fc22.x86_64

this nva8 came with a thinkpad t410

my pstate file looks like this: 
03: core 135 MHz shader 270 MHz memory 135 MHz
07: core 405 MHz shader 810 MHz memory 405 MHz
0f: core 606 MHz shader 1468 MHz memory 790 MHz
AC: core 405 MHz shader 810 MHz memory 405 MHz

when clocking to 07 or 0f everything works.
however, when clocking to pstate=03 i get constant flickering (maybe &lt;5-10 hz),
although the clocks do change, and nothing crashes. (i can change clocks back
to 07 or 0f with no more flickering)

vbios attached

mmiodump where i fumbled around with powermizer while the blob reclocked
(no second monitor attached):
<a href="https://www.dropbox.com/s/jjh6hpcix1swc7r/mmiotrace.log?dl=0">https://www.dropbox.com/s/jjh6hpcix1swc7r/mmiotrace.log?dl=0</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423787939.b431BdC1.7786--

--===============0580136705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0580136705==--
