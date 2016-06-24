From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96656] [regression,
	bisected] all textureGather piglits fail
Date: Fri, 24 Jun 2016 16:10:54 +0000
Message-ID: <bug-96656-8800-XbxkGovvEN@http.bugs.freedesktop.org/>
References: <bug-96656-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0886051898=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96656-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0886051898==
Content-Type: multipart/alternative; boundary="14667846531.1B67C578.15534";
 charset="UTF-8"


--14667846531.1B67C578.15534
Date: Fri, 24 Jun 2016 16:10:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96656

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The problem was pre-existing, but a combination of factors made the readpix=
els
cache expose it harder.

Fixed by:

commit b433cb51e50cab878cbaa023662bacd1f923a183
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Thu Jun 23 22:33:59 2016 -0400

    nvc0: when mapping directly, provide accurate xfer info + start

    We were ignoring the incoming box parameters, and were providing totally
    bogus stride/layer stride, and other bits, for when a non-full-surface
    map was requested.

    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
    Tested-by: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    Cc: <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14667846531.1B67C578.15534
Date: Fri, 24 Jun 2016 16:10:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [regression, bisected] all textureGather piglits fail"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96656#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [regression, bisected] all textureGather piglits fail"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96656">bug 96656<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The problem was pre-existing, but a combination of factors mad=
e the readpixels
cache expose it harder.

Fixed by:

commit b433cb51e50cab878cbaa023662bacd1f923a183
Author: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.edu">imirkin=
&#64;alum.mit.edu</a>&gt;
Date:   Thu Jun 23 22:33:59 2016 -0400

    nvc0: when mapping directly, provide accurate xfer info + start

    We were ignoring the incoming box parameters, and were providing totally
    bogus stride/layer stride, and other bits, for when a non-full-surface
    map was requested.

    Signed-off-by: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.e=
du">imirkin&#64;alum.mit.edu</a>&gt;
    Tested-by: Samuel Pitoiset &lt;<a href=3D"mailto:samuel.pitoiset&#64;gm=
ail.com">samuel.pitoiset&#64;gmail.com</a>&gt;
    Cc: &lt;<a href=3D"mailto:mesa-stable&#64;lists.freedesktop.org">mesa-s=
table&#64;lists.freedesktop.org</a>&gt;</pre>
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

--14667846531.1B67C578.15534--

--===============0886051898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0886051898==--
