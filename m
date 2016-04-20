From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95044] New: [NVA0] [Reclocking] GPU doesn't relax
	memory clocks
Date: Wed, 20 Apr 2016 21:41:00 +0000
Message-ID: <bug-95044-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0293535321=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0293535321==
Content-Type: multipart/alternative; boundary="14611884600.4cdD.8661";
 charset="UTF-8"


--14611884600.4cdD.8661
Date: Wed, 20 Apr 2016 21:41:00 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95044

            Bug ID: 95044
           Summary: [NVA0] [Reclocking] GPU doesn't relax memory clocks
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: debianlinuxero1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 123101
  --> https://bugs.freedesktop.org/attachment.cgi?id=123101&action=edit
Kernel_log

The card doesn't relax memory clocks on step down reclock transitions.

For example, if I try [code]echo 07 > pstate[/code] from a 0f state, I see this
:

[code]
03: core 300 MHz shader 600 MHz memory 100 MHz
07: core 400 MHz shader 800 MHz memory 300 MHz AC DC *
0f: core 576 MHz shader 1242 MHz memory 999 MHz
AC: core 399 MHz shader 799 MHz memory 999 MHz
[/code]

The problem happens in the 3 step down possible transitions :

0f -> 07, 07 -> 03 and 0f -> 03.

The memory clock always stands as high as the major's state I set up.



The system is :

Phenom II X4 905e, 4 GB DDR3 @ 1333, nVidia GeForce GTX 260, 790FX chipset.

Debian GNU/Linux stretch (Testing) x64

Kernel 4.4.0-1, libdrm-nouveau2 2.4.67-1.


The attachment file shows a kernel dmesg after switching from state 0f to 07.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14611884600.4cdD.8661
Date: Wed, 20 Apr 2016 21:41:00 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA0] [Reclocking] GPU doesn't relax memory clocks"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95044">95044</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVA0] [Reclocking] GPU doesn't relax memory clocks
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
          <td>debianlinuxero1&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=123101" name="attach_123101" title="Kernel_log">attachment 123101</a> <a href="attachment.cgi?id=123101&amp;action=edit" title="Kernel_log">[details]</a></span>
Kernel_log

The card doesn't relax memory clocks on step down reclock transitions.

For example, if I try [code]echo 07 &gt; pstate[/code] from a 0f state, I see this
:

[code]
03: core 300 MHz shader 600 MHz memory 100 MHz
07: core 400 MHz shader 800 MHz memory 300 MHz AC DC *
0f: core 576 MHz shader 1242 MHz memory 999 MHz
AC: core 399 MHz shader 799 MHz memory 999 MHz
[/code]

The problem happens in the 3 step down possible transitions :

0f -&gt; 07, 07 -&gt; 03 and 0f -&gt; 03.

The memory clock always stands as high as the major's state I set up.



The system is :

Phenom II X4 905e, 4 GB DDR3 &#64; 1333, nVidia GeForce GTX 260, 790FX chipset.

Debian GNU/Linux stretch (Testing) x64

Kernel 4.4.0-1, libdrm-nouveau2 2.4.67-1.


The attachment file shows a kernel dmesg after switching from state 0f to 07.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14611884600.4cdD.8661--

--===============0293535321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0293535321==--
