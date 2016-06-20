From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90513] Odd gray and red flicker in The Talos
	Principle on GK104
Date: Mon, 20 Jun 2016 01:10:52 +0000
Message-ID: <bug-90513-8800-opbvLk9VOB@http.bugs.freedesktop.org/>
References: <bug-90513-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2076373668=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90513-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2076373668==
Content-Type: multipart/alternative; boundary="14663850510.6d7BCEa.1400";
 charset="UTF-8"


--14663850510.6d7BCEa.1400
Date: Mon, 20 Jun 2016 01:10:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D90513

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 124613
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124613&action=3Dedit
list of draws with bad results

I ran a diff (with retracediff.py) against nv50 (after fixing alpha test on
nv50, otherwise it had too many differences). The attached list of draws has
diffs when running GK208 vs GT215, most (all?) randomly-green-stuff related.
[GT215 renders everything fine.]

The trace in question is
https://people.freedesktop.org/~imirkin/traces/talos-karolherbst.trace.xz

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14663850510.6d7BCEa.1400
Date: Mon, 20 Jun 2016 01:10:51 +0000
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
   title=3D"NEW - Odd gray and red flicker in The Talos Principle on GK104"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90513#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Odd gray and red flicker in The Talos Principle on GK104"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90513">bug 90513<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124613=
" name=3D"attach_124613" title=3D"list of draws with bad results">attachmen=
t 124613</a> <a href=3D"attachment.cgi?id=3D124613&amp;action=3Dedit" title=
=3D"list of draws with bad results">[details]</a></span>
list of draws with bad results

I ran a diff (with retracediff.py) against nv50 (after fixing alpha test on
nv50, otherwise it had too many differences). The attached list of draws has
diffs when running GK208 vs GT215, most (all?) randomly-green-stuff related.
[GT215 renders everything fine.]

The trace in question is
<a href=3D"https://people.freedesktop.org/~imirkin/traces/talos-karolherbst=
.trace.xz">https://people.freedesktop.org/~imirkin/traces/talos-karolherbst=
.trace.xz</a></pre>
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

--14663850510.6d7BCEa.1400--

--===============2076373668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2076373668==--
