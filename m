From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99858] [NVAC] disp: ERROR 4 [INVALID_VALUE] 84 []
 chid 0 mthd 0828 data 000099bb
Date: Sun, 19 Feb 2017 16:54:29 +0000
Message-ID: <bug-99858-8800-mzmQ2YgvMg@http.bugs.freedesktop.org/>
References: <bug-99858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0648790812=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0648790812==
Content-Type: multipart/alternative; boundary="14875232682.4eCB5.23616";
 charset="UTF-8"


--14875232682.4eCB5.23616
Date: Sun, 19 Feb 2017 16:54:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99858

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|disp: ERROR 4               |[NVAC] disp: ERROR 4
                   |[INVALID_VALUE] 84 [] chid  |[INVALID_VALUE] 84 [] chid
                   |0 mthd 0828 data 000099bb   |0 mthd 0828 data 000099bb

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There was a bad workaround that went into kernel 4.8 or so (for NVAC) which=
 was
reverted in kernel 4.10, which had the effect of breaking HDMI. Commit
7dfee6827780d4228148263545af936d0cae8930 which was first included in 4.10-r=
c7.
It appears that you were running 4.10-rc6 - can you try a later RC?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14875232682.4eCB5.23616
Date: Sun, 19 Feb 2017 16:54:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:imirkin&#=
64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <s=
pan class=3D"fn">Ilia Mirkin</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] disp: ERROR 4 [INVALID_VALUE] 84 [] chid 0 mthd 08=
28 data 000099bb"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99858">bug 99858<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Summary</td>
           <td>disp: ERROR 4 [INVALID_VALUE] 84 [] chid 0 mthd 0828 data 00=
0099bb
           </td>
           <td>[NVAC] disp: ERROR 4 [INVALID_VALUE] 84 [] chid 0 mthd 0828 =
data 000099bb
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] disp: ERROR 4 [INVALID_VALUE] 84 [] chid 0 mthd 08=
28 data 000099bb"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99858#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] disp: ERROR 4 [INVALID_VALUE] 84 [] chid 0 mthd 08=
28 data 000099bb"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99858">bug 99858<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There was a bad workaround that went into kernel 4.8 or so (fo=
r NVAC) which was
reverted in kernel 4.10, which had the effect of breaking HDMI. Commit
7dfee6827780d4228148263545af936d0cae8930 which was first included in 4.10-r=
c7.
It appears that you were running 4.10-rc6 - can you try a later RC?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14875232682.4eCB5.23616--

--===============0648790812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0648790812==--
