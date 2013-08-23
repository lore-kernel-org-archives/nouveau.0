From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68402] Some elements are only rendered in top-left
	area
Date: Fri, 23 Aug 2013 00:16:42 +0000
Message-ID: <bug-68402-8800-cPmc9FiJVE@http.bugs.freedesktop.org/>
References: <bug-68402-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1917550301=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68402-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1917550301==
Content-Type: multipart/alternative; boundary="1377217002.05dCf61.8213"; charset="us-ascii"


--1377217002.05dCf61.8213
Date: Fri, 23 Aug 2013 00:16:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D68402

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
You're a star J=C3=A1n

Just had a word with our main dev and he suggested that
viewport transformation is optional, whereas viewport clip rectangle must be
set before and after 3d_blit().

With that said, here is what can be done to double-check/fix this - note a
quick piglit [1] test before and after each one, plus testing of other game=
s/gl
apps is essential.

* nuke the viewport clip rectangle (despite all odds)
* change the viewport clip rectangle - traceback and use the original values
(the ones saved at the begingin on 3d_blit() and restored at the end)
* nuke the viewport transformation
* add the conditional NV50_TIC_5_LAST_LEVEL__MASK on tic[5] in
nvc0_create_texture_view (compare vs nv50_create_texture_view)

I'm hoping that one of the last two will do the job, although chances are t=
hat
it may be one of the first two. Either way a piglit and further testing will
prove which solution is the most appropriate.

Feel free to give it a shot yourself, as it will take a some time until I g=
et
to it(apart from the lack of HW).

Note: depending on your luck(and other unknown to me factors) piglit may lo=
ckup
X and your system. Normally a s2r cycle is sufficient to get it back into
shape, otherwise a reboot is needed.

Cheers,
Emil

[1] http://cgit.freedesktop.org/piglit/

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1377217002.05dCf61.8213
Date: Fri, 23 Aug 2013 00:16:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Some elements are only rendered in top-left area"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D68402#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Some elements are only rendered in top-left area"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D68402">bug 68402<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
emil.l.velikov&#64;gmail.com" title=3D"Emil Velikov &lt;emil.l.velikov&#64;=
gmail.com&gt;"> <span class=3D"fn">Emil Velikov</span></a>
</span></b>
        <pre>You're a star J=C3=A1n

Just had a word with our main dev and he suggested that
viewport transformation is optional, whereas viewport clip rectangle must be
set before and after 3d_blit().

With that said, here is what can be done to double-check/fix this - note a
quick piglit [1] test before and after each one, plus testing of other game=
s/gl
apps is essential.

* nuke the viewport clip rectangle (despite all odds)
* change the viewport clip rectangle - traceback and use the original values
(the ones saved at the begingin on 3d_blit() and restored at the end)
* nuke the viewport transformation
* add the conditional NV50_TIC_5_LAST_LEVEL__MASK on tic[5] in
nvc0_create_texture_view (compare vs nv50_create_texture_view)

I'm hoping that one of the last two will do the job, although chances are t=
hat
it may be one of the first two. Either way a piglit and further testing will
prove which solution is the most appropriate.

Feel free to give it a shot yourself, as it will take a some time until I g=
et
to it(apart from the lack of HW).

Note: depending on your luck(and other unknown to me factors) piglit may lo=
ckup
X and your system. Normally a s2r cycle is sufficient to get it back into
shape, otherwise a reboot is needed.

Cheers,
Emil

[1] <a href=3D"http://cgit.freedesktop.org/piglit/">http://cgit.freedesktop=
.org/piglit/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377217002.05dCf61.8213--

--===============1917550301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1917550301==--
