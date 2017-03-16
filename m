From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100228] New: [NV137] unknown chipset (137000a1)
Date: Thu, 16 Mar 2017 11:38:35 +0000
Message-ID: <bug-100228-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1819514542=="
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


--===============1819514542==
Content-Type: multipart/alternative; boundary="14896643150.F98A21C2.11714";
 charset="UTF-8"


--14896643150.F98A21C2.11714
Date: Thu, 16 Mar 2017 11:38:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

            Bug ID: 100228
           Summary: [NV137] unknown chipset (137000a1)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: fake.ae-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 130256
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130256&action=3Dedit
kernel logs

Hi

i've recently bought a new laptop HP Omen 15-ax201nc.
It comes with nvidia 1050 ti video card which is supposedly should be suppo=
rted
by nouveau driver. But during boot i get "unknown chipset (137000a1)"
X server is loading regardless, but it has limited features (i think, like =
no
gnome animations is what i see at first place).

Mesa-dri-nouveau version is 11.2.2-166.1
xf86-video-nouveau version is 1.0.14-30.1=20
I use opensuse Leap 42.2

uname -a
Linux 78qwHJ4D 4.4.49-16-default #1 SMP Sun Feb 19 17:40:35 UTC 2017 (70e99=
54)
x86_64 x86_64 x86_64 GNU/Linux

dmesg logs are attached

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14896643150.F98A21C2.11714
Date: Thu, 16 Mar 2017 11:38:35 +0000
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
   title=3D"NEW - [NV137] unknown chipset (137000a1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">100228</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV137] unknown chipset (137000a1)
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
          <td>fake.ae&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130256=
" name=3D"attach_130256" title=3D"kernel logs">attachment 130256</a> <a hre=
f=3D"attachment.cgi?id=3D130256&amp;action=3Dedit" title=3D"kernel logs">[d=
etails]</a></span>
kernel logs

Hi

i've recently bought a new laptop HP Omen 15-ax201nc.
It comes with nvidia 1050 ti video card which is supposedly should be suppo=
rted
by nouveau driver. But during boot i get &quot;unknown chipset (137000a1)&q=
uot;
X server is loading regardless, but it has limited features (i think, like =
no
gnome animations is what i see at first place).

Mesa-dri-nouveau version is 11.2.2-166.1
xf86-video-nouveau version is 1.0.14-30.1=20
I use opensuse Leap 42.2

uname -a
Linux 78qwHJ4D 4.4.49-16-default #1 SMP Sun Feb 19 17:40:35 UTC 2017 (70e99=
54)
x86_64 x86_64 x86_64 GNU/Linux

dmesg logs are attached</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14896643150.F98A21C2.11714--

--===============1819514542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1819514542==--
