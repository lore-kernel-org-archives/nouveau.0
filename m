From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101335] build failure: nouveau_screen.c:105:8:
 error:=?UTF-8?Q?=20implicit=20declaration=20of=20function=20=E2=80=98nouveau=5Fdrm=5Fnew=E2=80=99?=;
Date: Mon, 12 Jun 2017 20:18:21 +0000
Message-ID: <bug-101335-8800-u4EBcc9Ggj@http.bugs.freedesktop.org/>
References: <bug-101335-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1197487727=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101335-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1197487727==
Content-Type: multipart/alternative; boundary="14972987010.69f6.1767";
 charset="UTF-8"


--14972987010.69f6.1767
Date: Mon, 12 Jun 2017 20:18:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101335

David Ronis <David.Ronis-BAnzPxqWUM23NexWsGEg3A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #5 from David Ronis <David.Ronis-BAnzPxqWUM23NexWsGEg3A@public.gmane.org> ---
Problem solved.  It turns out that an older or <span class=3D"hiddenSpellEr=
ror"
pre=3D"or ">slackware pagage of <span class=3D"hiddenSpellError" pre=3D"of =
">drm
installed its include files in /usr/include/drm nor /usr/include/libdrm,
something that wasn't fixed when calling pkg-config --cflags drm which is n=
ow
libdrm).


I manually removed any drm installed files, ran make uninstall, and
rebuilt/installed with no problems.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14972987010.69f6.1767
Date: Mon, 12 Jun 2017 20:18:21 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:David.Ron=
is&#64;McGill.CA" title=3D"David Ronis &lt;David.Ronis&#64;McGill.CA&gt;"> =
<span class=3D"fn">David Ronis</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - build failure: nouveau_screen.c:105:8: error: =
implicit declaration of function =E2=80=98nouveau_drm_new=E2=80=99;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101335">bug 10133=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - build failure: nouveau_screen.c:105:8: error: =
implicit declaration of function =E2=80=98nouveau_drm_new=E2=80=99;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101335#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - build failure: nouveau_screen.c:105:8: error: =
implicit declaration of function =E2=80=98nouveau_drm_new=E2=80=99;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101335">bug 10133=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
David.Ronis&#64;McGill.CA" title=3D"David Ronis &lt;David.Ronis&#64;McGill.=
CA&gt;"> <span class=3D"fn">David Ronis</span></a>
</span></b>
        <pre>Problem solved.  It turns out that an older or &lt;span class=
=3D&quot;hiddenSpellError&quot;
pre=3D&quot;or &quot;&gt;slackware pagage of &lt;span class=3D&quot;hiddenS=
pellError&quot; pre=3D&quot;of &quot;&gt;drm
installed its include files in /usr/include/drm nor /usr/include/libdrm,
something that wasn't fixed when calling pkg-config --cflags drm which is n=
ow
libdrm).


I manually removed any drm installed files, ran make uninstall, and
rebuilt/installed with no problems.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14972987010.69f6.1767--

--===============1197487727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1197487727==--
