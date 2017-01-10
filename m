From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99354] New: [G71] "Assertion `bkref' failed"
 reproducible with glmark2
Date: Tue, 10 Jan 2017 22:01:48 +0000
Message-ID: <bug-99354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1068532830=="
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


--===============1068532830==
Content-Type: multipart/alternative; boundary="14840857080.6a0D.32332";
 charset="UTF-8"


--14840857080.6a0D.32332
Date: Tue, 10 Jan 2017 22:01:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99354

            Bug ID: 99354
           Summary: [G71] "Assertion `bkref' failed" reproducible with
                    glmark2
           Product: Mesa
           Version: 13.0
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: barra_cuda-KK0ffGbhmjU@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 128875
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128875&action=3Dedit
glmark2 backtrace

[G71] "Assertion `bkref' failed" reproducible with glmark2

Using glmark2 I can trigger the assertion
"glmark2: pushbuf.c:238: pushbuf_krel: Assertion `bkref' failed."
quite easily. I'm not sure if this is a duplicate of other bugs.

The fastest way to reproduce seems to be:

./glmark2 -b
buffer:columns=3D200:interleave=3Dfalse:update-dispersion=3D0.99:update-fra=
ction=3D0.5:update-method=3Dsubdata:buffer-usage=3Dstatic
--run-forever

Changing some parameters from that command line still trigger the assertion,
but usually it takes a bit more time. The command above triggers for me
after 2.5 seconds (usually less than that), while for example the following
command

./glmark2 -b
buffer:columns=3D200:interleave=3Dfalse:update-dispersion=3D0.9:update-frac=
tion=3D0.5:update-method=3Dmap
--run-forever

can trigger even a minute later.

I've used glmark2 at commit f413c5b423250b4fde8f95639ad368d5b02c5b9b.

Software versions:
xf86-video-nouveau-1.0.13
mesa-13.0.3
libdrm-2.4.74
xorg-server-1.19.0

Hardware: nVidia Quadro FX 1500

Backtrace attached.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14840857080.6a0D.32332
Date: Tue, 10 Jan 2017 22:01:48 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [G71] &quot;Assertion `bkref' failed&quot; reproducible w=
ith glmark2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99354">99354</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[G71] &quot;Assertion `bkref' failed&quot; reproducible with =
glmark2
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>13.0
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
          <td>barra_cuda&#64;gmx.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128875=
" name=3D"attach_128875" title=3D"glmark2 backtrace">attachment 128875</a> =
<a href=3D"attachment.cgi?id=3D128875&amp;action=3Dedit" title=3D"glmark2 b=
acktrace">[details]</a></span>
glmark2 backtrace

[G71] &quot;Assertion `bkref' failed&quot; reproducible with glmark2

Using glmark2 I can trigger the assertion
&quot;glmark2: pushbuf.c:238: pushbuf_krel: Assertion `bkref' failed.&quot;
quite easily. I'm not sure if this is a duplicate of other bugs.

The fastest way to reproduce seems to be:

./glmark2 -b
buffer:columns=3D200:interleave=3Dfalse:update-dispersion=3D0.99:update-fra=
ction=3D0.5:update-method=3Dsubdata:buffer-usage=3Dstatic
--run-forever

Changing some parameters from that command line still trigger the assertion,
but usually it takes a bit more time. The command above triggers for me
after 2.5 seconds (usually less than that), while for example the following
command

./glmark2 -b
buffer:columns=3D200:interleave=3Dfalse:update-dispersion=3D0.9:update-frac=
tion=3D0.5:update-method=3Dmap
--run-forever

can trigger even a minute later.

I've used glmark2 at commit f413c5b423250b4fde8f95639ad368d5b02c5b9b.

Software versions:
xf86-video-nouveau-1.0.13
mesa-13.0.3
libdrm-2.4.74
xorg-server-1.19.0

Hardware: nVidia Quadro FX 1500

Backtrace attached.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14840857080.6a0D.32332--

--===============1068532830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1068532830==--
