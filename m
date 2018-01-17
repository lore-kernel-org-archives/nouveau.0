From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104672] [NVAC] Compiz segfaults on login on Ubuntu
 17.10 with Unity 7 (kernel DRM bug?)
Date: Wed, 17 Jan 2018 21:57:27 +0000
Message-ID: <bug-104672-8800-vfVwD7D0Hk@http.bugs.freedesktop.org/>
References: <bug-104672-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0731997481=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104672-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0731997481==
Content-Type: multipart/alternative; boundary="15162262470.aeEf31EB.26391"
Content-Transfer-Encoding: 7bit


--15162262470.aeEf31EB.26391
Date: Wed, 17 Jan 2018 21:57:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104672

Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |ASSIGNED

--- Comment #5 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Turns out I had an additional issue, but I think I now see the same issue as
you do, with a segfault in nouveau_dri.so when starting sddm.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15162262470.aeEf31EB.26391
Date: Wed, 17 Jan 2018 21:57:27 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Compiz segfaults on login on Ubuntu 17.10 wit=
h Unity 7 (kernel DRM bug?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104672">bug 10467=
2</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEEDINFO
           </td>
           <td>ASSIGNED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Compiz segfaults on login on Ubuntu 17.10 wit=
h Unity 7 (kernel DRM bug?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104672#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Compiz segfaults on login on Ubuntu 17.10 wit=
h Unity 7 (kernel DRM bug?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104672">bug 10467=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Turns out I had an additional issue, but I think I now see the=
 same issue as
you do, with a segfault in nouveau_dri.so when starting sddm.</pre>
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

--15162262470.aeEf31EB.26391--

--===============0731997481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0731997481==--
