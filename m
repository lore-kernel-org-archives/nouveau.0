From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100146] New: nouveau system lockup -> fifo: read
 fault engine 15 [PCE0] client 01 [PCOPY0] reason 02 [PAGE_NOT_PRESENT] on
 channel
Date: Fri, 10 Mar 2017 10:14:37 +0000
Message-ID: <bug-100146-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1084761922=="
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


--===============1084761922==
Content-Type: multipart/alternative; boundary="14891408770.a52eC4.17462";
 charset="UTF-8"


--14891408770.a52eC4.17462
Date: Fri, 10 Mar 2017 10:14:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100146

            Bug ID: 100146
           Summary: nouveau system lockup -> fifo: read fault engine 15
                    [PCE0] client 01 [PCOPY0] reason 02 [PAGE_NOT_PRESENT]
                    on channel
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gareth-vYTEC60ixJX10XsdtD+oqA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 130153
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130153&action=3Dedit
kern.log relating to nouveau driver and system lockup

Ok, over the last few months my system has gone from "rock solid, runs fore=
ver"
to "it will crash at least once today, if not 3 or 4 times". Given I'm runn=
ing
Ubuntu 16.04 I've sort of been ignoring it hoping someone is making it bett=
er,
but it keeps getting worse, and every time it crashes I have 3-4 hours of R=
AID
sync to live with.

I'm running a NVIDIA Corporation GF108 [GeForce GT 430] (rev a1), one scree=
n ::
2560x1440 @ 60Hz.

Symptoms, screen locks up, comes back after 1-2 mins just long enough to
refresh the screen - then freezes.
(stock XUbuntu 16.04)

Linux version 4.4.0-66-generic (buildd@lgw01-28) (gcc version 5.4.0 20160609
(Ubuntu 5.4.0-6ubuntu1~16.04.4) ) #87-Ubuntu SMP Fri Mar 3 15:29:05 UTC 2017

kern.log attached

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14891408770.a52eC4.17462
Date: Fri, 10 Mar 2017 10:14:37 +0000
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
   title=3D"NEW - nouveau system lockup -&gt; fifo: read fault engine 15 [P=
CE0] client 01 [PCOPY0] reason 02 [PAGE_NOT_PRESENT] on channel"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100146">100146</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau system lockup -&gt; fifo: read fault engine 15 [PCE0]=
 client 01 [PCOPY0] reason 02 [PAGE_NOT_PRESENT] on channel
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
          <td>critical
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
          <td>gareth&#64;linux.co.uk
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130153=
" name=3D"attach_130153" title=3D"kern.log relating to nouveau driver and s=
ystem lockup">attachment 130153</a> <a href=3D"attachment.cgi?id=3D130153&a=
mp;action=3Dedit" title=3D"kern.log relating to nouveau driver and system l=
ockup">[details]</a></span>
kern.log relating to nouveau driver and system lockup

Ok, over the last few months my system has gone from &quot;rock solid, runs=
 forever&quot;
to &quot;it will crash at least once today, if not 3 or 4 times&quot;. Give=
n I'm running
Ubuntu 16.04 I've sort of been ignoring it hoping someone is making it bett=
er,
but it keeps getting worse, and every time it crashes I have 3-4 hours of R=
AID
sync to live with.

I'm running a NVIDIA Corporation GF108 [GeForce GT 430] (rev a1), one scree=
n ::
2560x1440 &#64; 60Hz.

Symptoms, screen locks up, comes back after 1-2 mins just long enough to
refresh the screen - then freezes.
(stock XUbuntu 16.04)

Linux version 4.4.0-66-generic (buildd&#64;lgw01-28) (gcc version 5.4.0 201=
60609
(Ubuntu 5.4.0-6ubuntu1~16.04.4) ) #87-Ubuntu SMP Fri Mar 3 15:29:05 UTC 2017

kern.log attached</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14891408770.a52eC4.17462--

--===============1084761922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1084761922==--
