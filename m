From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100659] [nouveau] Certain errors on initializing GTX
	1060 6GB
Date: Wed, 12 Apr 2017 09:27:34 +0000
Message-ID: <bug-100659-8800-6aYncS1MmY@http.bugs.freedesktop.org/>
References: <bug-100659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2023165345=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100659-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2023165345==
Content-Type: multipart/alternative; boundary="14919892530.42cCdc7.19219";
 charset="UTF-8"


--14919892530.42cCdc7.19219
Date: Wed, 12 Apr 2017 09:27:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100659

Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #2 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
> nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
This should be safe to ignore.

> nouveau 0000:01:00.0: DRM: failed to create kernel channel, -22
For acceleration support, you need at least Linux 4.12 as well as a recent =
(at
least from 1st March 2017) version of linux-firmware
(https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.gi=
t/).

Feel free to reopen if you are still experiencing the last issue after
updating.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14919892530.42cCdc7.19219
Date: Wed, 12 Apr 2017 09:27:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:pierre.mo=
rrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"=
> <span class=3D"fn">Pierre Moreau</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - [nouveau] Certain errors on initializing GTX=
 1060 6GB"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100659">bug 10065=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>INVALID
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - [nouveau] Certain errors on initializing GTX=
 1060 6GB"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100659#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - [nouveau] Certain errors on initializing GTX=
 1060 6GB"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100659">bug 10065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; nouveau 0000:01:00.0: DRM: Pointer =
to flat panel table invalid</span >
This should be safe to ignore.

<span class=3D"quote">&gt; nouveau 0000:01:00.0: DRM: failed to create kern=
el channel, -22</span >
For acceleration support, you need at least Linux 4.12 as well as a recent =
(at
least from 1st March 2017) version of linux-firmware
(<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-=
firmware.git/">https://git.kernel.org/pub/scm/linux/kernel/git/firmware/lin=
ux-firmware.git/</a>).

Feel free to reopen if you are still experiencing the last issue after
updating.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14919892530.42cCdc7.19219--

--===============2023165345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2023165345==--
