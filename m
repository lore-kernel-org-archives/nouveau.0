From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110797] New: No video if nomodeset is not set with
 GTX 460
Date: Thu, 30 May 2019 14:32:48 +0000
Message-ID: <bug-110797-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0542355916=="
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


--===============0542355916==
Content-Type: multipart/alternative; boundary="15592267680.aADF2bfC6.20372"
Content-Transfer-Encoding: 7bit


--15592267680.aADF2bfC6.20372
Date: Thu, 30 May 2019 14:32:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110797

            Bug ID: 110797
           Summary: No video if nomodeset is not set with GTX 460
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: newbytee-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Greetings!

I have a PC (Dell XPS 8100) with an i7 870 and a GTX 460. No parts have been
changed from its factory state aside from CMOS battery. I attempted to inst=
all
Fedora 30 on it very recently, and what I soon noticed was that unless I ad=
ded
the nomodeset kernel parameter the monitor would say "No signal" soon after
boot. With nomodeset enabled it boots as normal and everything works, except
the things that usually do not work when nomodeset is set.

Note that this occurs both with nouveau and NVIDIA's proprietary driver,
however the GPU works in Windows 10 so I do not believe that this is a hard=
ware
fault. I have also made sure to verify that I am using the latest BIOS
available for the motherboard.

Regards, Newbyte.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15592267680.aADF2bfC6.20372
Date: Thu, 30 May 2019 14:32:48 +0000
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
   title=3D"NEW - No video if nomodeset is not set with GTX 460"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110797">110797</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>No video if nomodeset is not set with GTX 460
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
          <td>newbytee&#64;protonmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Greetings!

I have a PC (Dell XPS 8100) with an i7 870 and a GTX 460. No parts have been
changed from its factory state aside from CMOS battery. I attempted to inst=
all
Fedora 30 on it very recently, and what I soon noticed was that unless I ad=
ded
the nomodeset kernel parameter the monitor would say &quot;No signal&quot; =
soon after
boot. With nomodeset enabled it boots as normal and everything works, except
the things that usually do not work when nomodeset is set.

Note that this occurs both with nouveau and NVIDIA's proprietary driver,
however the GPU works in Windows 10 so I do not believe that this is a hard=
ware
fault. I have also made sure to verify that I am using the latest BIOS
available for the motherboard.

Regards, Newbyte.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15592267680.aADF2bfC6.20372--

--===============0542355916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0542355916==--
