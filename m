From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111463] New: [NV49] MMIO write FAULT at 00c200
Date: Thu, 22 Aug 2019 09:29:35 +0000
Message-ID: <bug-111463-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1907561302=="
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


--===============1907561302==
Content-Type: multipart/alternative; boundary="15664661751.aaFC7075.30451"
Content-Transfer-Encoding: 7bit


--15664661751.aaFC7075.30451
Date: Thu, 22 Aug 2019 09:29:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111463

            Bug ID: 111463
           Summary: [NV49] MMIO write FAULT at 00c200
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: not set
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: morpheus2051-S0/GAf8tV78@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 145128
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145128&action=3Dedit
dmesg with write fault

Hello,

on my HP NW9440 Laptop with the following GPU:
01:00.0 VGA compatible controller: NVIDIA Corporation G71GLM [Quadro FX 150=
0M]
(rev a1)
I am getting MMIO write faults always at the same address. I think these wr=
ite
faults lock up my machine sometimes. I use plasma desktop environment. To
trigger the MMIO write faults I have to just use the machine. I have not fo=
und
a pattern to provoke a hard lockup.=20

Known good kernel version: none
Known bad kernel versions: 4.19, 5.0, 5.1, 5.2

Relevant software versions:

media-libs/mesa 19.0.8
sys-kernel/gentoo-sources 5.2.9
x11-base/xorg-server 1.20.5
x11-libs/libdrm 2.4.97
x11-drivers/xf86-video-nouveau 1.0.16
kde-plasma 5.15.5
kde-frameworks 5.60.0
qt 5.12.3

Distribution is gentoo.

Greetings

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15664661751.aaFC7075.30451
Date: Thu, 22 Aug 2019 09:29:35 +0000
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
   title=3D"NEW - [NV49] MMIO write FAULT at 00c200"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111463">111463</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV49] MMIO write FAULT at 00c200
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
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
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
          <td>morpheus2051&#64;web.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145128=
" name=3D"attach_145128" title=3D"dmesg with write fault">attachment 145128=
</a> <a href=3D"attachment.cgi?id=3D145128&amp;action=3Dedit" title=3D"dmes=
g with write fault">[details]</a></span>
dmesg with write fault

Hello,

on my HP NW9440 Laptop with the following GPU:
01:00.0 VGA compatible controller: NVIDIA Corporation G71GLM [Quadro FX 150=
0M]
(rev a1)
I am getting MMIO write faults always at the same address. I think these wr=
ite
faults lock up my machine sometimes. I use plasma desktop environment. To
trigger the MMIO write faults I have to just use the machine. I have not fo=
und
a pattern to provoke a hard lockup.=20

Known good kernel version: none
Known bad kernel versions: 4.19, 5.0, 5.1, 5.2

Relevant software versions:

media-libs/mesa 19.0.8
sys-kernel/gentoo-sources 5.2.9
x11-base/xorg-server 1.20.5
x11-libs/libdrm 2.4.97
x11-drivers/xf86-video-nouveau 1.0.16
kde-plasma 5.15.5
kde-frameworks 5.60.0
qt 5.12.3

Distribution is gentoo.

Greetings</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15664661751.aaFC7075.30451--

--===============1907561302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1907561302==--
