From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91171] Space Rangers 2 (in Wine) shows only black
	screen
Date: Fri, 23 Oct 2015 07:41:28 +0000
Message-ID: <bug-91171-8800-i884JKKMfk@http.bugs.freedesktop.org/>
References: <bug-91171-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1845993369=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91171-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1845993369==
Content-Type: multipart/alternative; boundary="1445586088.10D182.17286"; charset="UTF-8"


--1445586088.10D182.17286
Date: Fri, 23 Oct 2015 07:41:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D91171

B=C3=A9la Gyebr=C3=B3szki <gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #7 from B=C3=A9la Gyebr=C3=B3szki <gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #6)
> Some frontbuffer-related fixes went into mesa 11.0.3. Can you check if the
> issue persists?

The black screen issue is still present, tested with mesa git and wine 1.7.=
53..

OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NV92
OpenGL core profile version string: 3.3 (Core Profile) Mesa 11.1.0-devel
(git-3994ef5)
OpenGL core profile shading language version string: 3.30

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445586088.10D182.17286
Date: Fri, 23 Oct 2015 07:41:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:gyebro69&=
#64;gmail.com" title=3D"B=C3=A9la Gyebr=C3=B3szki &lt;gyebro69&#64;gmail.co=
m&gt;"> <span class=3D"fn">B=C3=A9la Gyebr=C3=B3szki</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Space Rangers 2 (in Wine) shows only black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91171">bug 91171<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>gyebro69&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Space Rangers 2 (in Wine) shows only black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91171#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Space Rangers 2 (in Wine) shows only black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91171">bug 91171<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gyebro69&#64;gmail.com" title=3D"B=C3=A9la Gyebr=C3=B3szki &lt;gyebro69&#64=
;gmail.com&gt;"> <span class=3D"fn">B=C3=A9la Gyebr=C3=B3szki</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D911=
71#c6">comment #6</a>)
<span class=3D"quote">&gt; Some frontbuffer-related fixes went into mesa 11=
.0.3. Can you check if the
&gt; issue persists?</span >

The black screen issue is still present, tested with mesa git and wine 1.7.=
53..

OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NV92
OpenGL core profile version string: 3.3 (Core Profile) Mesa 11.1.0-devel
(git-3994ef5)
OpenGL core profile shading language version string: 3.30</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445586088.10D182.17286--

--===============1845993369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1845993369==--
