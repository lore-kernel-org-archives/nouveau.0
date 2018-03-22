From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105626] [GT218] BUG: unable to handle kernel NULL
 pointer dereference at 0000000000000040
Date: Thu, 22 Mar 2018 15:07:45 +0000
Message-ID: <bug-105626-8800-YtPcK4tSmg@http.bugs.freedesktop.org/>
References: <bug-105626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0961004961=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0961004961==
Content-Type: multipart/alternative; boundary="15217312650.9cD76af.753"
Content-Transfer-Encoding: 7bit


--15217312650.9cD76af.753
Date: Thu, 22 Mar 2018 15:07:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105626

Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|BUG: unable to handle       |[GT218] BUG: unable to
                   |kernel NULL pointer         |handle kernel NULL pointer
                   |dereference at              |dereference at
                   |0000000000000040            |0000000000000040

--- Comment #5 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
I=E2=80=99ll try to reproduce on my Tesla cards during the weekend (if I ma=
nage to
solve some other issues first).
Are you using X or Wayland?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15217312650.9cD76af.753
Date: Thu, 22 Mar 2018 15:07:45 +0000
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
          bz_status_NEW "
   title=3D"NEW - [GT218] BUG: unable to handle kernel NULL pointer derefer=
ence at 0000000000000040"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105626">bug 10562=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Summary</td>
           <td>BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000040
           </td>
           <td>[GT218] BUG: unable to handle kernel NULL pointer dereferenc=
e at 0000000000000040
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GT218] BUG: unable to handle kernel NULL pointer derefer=
ence at 0000000000000040"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105626#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GT218] BUG: unable to handle kernel NULL pointer derefer=
ence at 0000000000000040"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105626">bug 10562=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>I=E2=80=99ll try to reproduce on my Tesla cards during the wee=
kend (if I manage to
solve some other issues first).
Are you using X or Wayland?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15217312650.9cD76af.753--

--===============0961004961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0961004961==--
