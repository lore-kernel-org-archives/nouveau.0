From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91232] Torchlight 1&2 (in Wine): glitchy models when
 hardware skinning enabled
Date: Sat, 10 Oct 2015 05:58:55 +0000
Message-ID: <bug-91232-8800-RpO5jtDeaq@http.bugs.freedesktop.org/>
References: <bug-91232-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1125148537=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91232-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1125148537==
Content-Type: multipart/alternative; boundary="1444456735.Ed0E551.1513"; charset="UTF-8"


--1444456735.Ed0E551.1513
Date: Sat, 10 Oct 2015 05:58:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D91232

B=C3=A9la Gyebr=C3=B3szki <gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED
                 CC|                            |gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #12 from B=C3=A9la Gyebr=C3=B3szki <gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Fixed in Wine git by the following series of commits:

http://source.winehq.org/git/wine.git/commit/97ee9451edae82154b289cb57b46ef=
13aedd58b8
http://source.winehq.org/git/wine.git/commit/09eda02b6896f5fe4ca7db5e1c13cb=
c67f8118e8
http://source.winehq.org/git/wine.git/commit/08b21528ed51d7ece92ea67fe0afe1=
d2a998c989
http://source.winehq.org/git/wine.git/commit/f511787423f468a679837761ef4ea8=
41ba7a3fda
http://source.winehq.org/git/wine.git/commit/93db8e97da2690c62a5d4586d62146=
32a98df344

wine-1.7.52-190-gd548639
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NV92
OpenGL core profile version string: 3.3 (Core Profile) Mesa 11.1.0-devel

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444456735.Ed0E551.1513
Date: Sat, 10 Oct 2015 05:58:55 +0000
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
          bz_status_CLOSED  bz_closed"
   title=3D"CLOSED NOTOURBUG - Torchlight 1&amp;2 (in Wine): glitchy models=
 when hardware skinning enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91232">bug 91232<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>CLOSED
           </td>
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
          bz_status_CLOSED  bz_closed"
   title=3D"CLOSED NOTOURBUG - Torchlight 1&amp;2 (in Wine): glitchy models=
 when hardware skinning enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91232#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_CLOSED  bz_closed"
   title=3D"CLOSED NOTOURBUG - Torchlight 1&amp;2 (in Wine): glitchy models=
 when hardware skinning enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91232">bug 91232<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gyebro69&#64;gmail.com" title=3D"B=C3=A9la Gyebr=C3=B3szki &lt;gyebro69&#64=
;gmail.com&gt;"> <span class=3D"fn">B=C3=A9la Gyebr=C3=B3szki</span></a>
</span></b>
        <pre>Fixed in Wine git by the following series of commits:

<a href=3D"http://source.winehq.org/git/wine.git/commit/97ee9451edae82154b2=
89cb57b46ef13aedd58b8">http://source.winehq.org/git/wine.git/commit/97ee945=
1edae82154b289cb57b46ef13aedd58b8</a>
<a href=3D"http://source.winehq.org/git/wine.git/commit/09eda02b6896f5fe4ca=
7db5e1c13cbc67f8118e8">http://source.winehq.org/git/wine.git/commit/09eda02=
b6896f5fe4ca7db5e1c13cbc67f8118e8</a>
<a href=3D"http://source.winehq.org/git/wine.git/commit/08b21528ed51d7ece92=
ea67fe0afe1d2a998c989">http://source.winehq.org/git/wine.git/commit/08b2152=
8ed51d7ece92ea67fe0afe1d2a998c989</a>
<a href=3D"http://source.winehq.org/git/wine.git/commit/f511787423f468a6798=
37761ef4ea841ba7a3fda">http://source.winehq.org/git/wine.git/commit/f511787=
423f468a679837761ef4ea841ba7a3fda</a>
<a href=3D"http://source.winehq.org/git/wine.git/commit/93db8e97da2690c62a5=
d4586d6214632a98df344">http://source.winehq.org/git/wine.git/commit/93db8e9=
7da2690c62a5d4586d6214632a98df344</a>

wine-1.7.52-190-gd548639
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NV92
OpenGL core profile version string: 3.3 (Core Profile) Mesa 11.1.0-devel</p=
re>
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

--1444456735.Ed0E551.1513--

--===============1125148537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1125148537==--
