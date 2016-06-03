From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96355] Performance: extra&costly SSBO validation
 even when SSBO aren't used
Date: Fri, 03 Jun 2016 08:17:51 +0000
Message-ID: <bug-96355-8800-yL7DdwL4Ef@http.bugs.freedesktop.org/>
References: <bug-96355-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1390729179=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96355-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1390729179==
Content-Type: multipart/alternative; boundary="14649418701.7AF001b1.13018";
 charset="UTF-8"


--14649418701.7AF001b1.13018
Date: Fri, 3 Jun 2016 08:17:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96355

--- Comment #2 from Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Gregory,

Thanks for profiling Nouveau with perf, that's very nice. :-)

Well, if your application doesn't use SSBO's, nvc0_validate_buffers() should
not be called yeah. But this might happen when we switch between different
contexts. Anyway, improving the validation path is on our todolist. :)

Well, according to your backtrace, nvc0_set_shader_buffers() is called and =
will
dirty NVC0_NEW_3D_BUFFERS, which will then call nvc0_validate_buffers() at =
draw
time.

I wonder why it's called if you are sure that your application doesn't use =
any
SSBO's...

Can you extract some shaders from your application to make sure no SSBO's a=
re
used? You can use NV50_PROG_DEBUG=3D1 for example (this will dump the TGSI =
code).

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14649418701.7AF001b1.13018
Date: Fri, 3 Jun 2016 08:17:50 +0000
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
   title=3D"NEW - Performance: extra&amp;costly SSBO validation even when S=
SBO aren't used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96355#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Performance: extra&amp;costly SSBO validation even when S=
SBO aren't used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96355">bug 96355<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
samuel.pitoiset&#64;gmail.com" title=3D"Samuel Pitoiset &lt;samuel.pitoiset=
&#64;gmail.com&gt;"> <span class=3D"fn">Samuel Pitoiset</span></a>
</span></b>
        <pre>Hi Gregory,

Thanks for profiling Nouveau with perf, that's very nice. :-)

Well, if your application doesn't use SSBO's, nvc0_validate_buffers() should
not be called yeah. But this might happen when we switch between different
contexts. Anyway, improving the validation path is on our todolist. :)

Well, according to your backtrace, nvc0_set_shader_buffers() is called and =
will
dirty NVC0_NEW_3D_BUFFERS, which will then call nvc0_validate_buffers() at =
draw
time.

I wonder why it's called if you are sure that your application doesn't use =
any
SSBO's...

Can you extract some shaders from your application to make sure no SSBO's a=
re
used? You can use NV50_PROG_DEBUG=3D1 for example (this will dump the TGSI =
code).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14649418701.7AF001b1.13018--

--===============1390729179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1390729179==--
