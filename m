From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104784] Unable to do reclocking manually
Date: Thu, 25 Jan 2018 09:39:01 +0000
Message-ID: <bug-104784-8800-CShXWEPUsy@http.bugs.freedesktop.org/>
References: <bug-104784-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0583559868=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104784-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0583559868==
Content-Type: multipart/alternative; boundary="15168731410.8Be47BB.17013"
Content-Transfer-Encoding: 7bit


--15168731410.8Be47BB.17013
Date: Thu, 25 Jan 2018 09:39:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104784

--- Comment #1 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Hello,

> AC: core 0 MHz memory 0 MHz

means your GPU is actually suspended: since you have an Optimus configurati=
on,
the NVIDIA GPU will suspend automatically if it hasn=E2=80=99t received any=
 work to do
in a short while. Try for example to run `DRI_PRIME=3D1 glxgears`, keep it
running and reissue the cat command: you should not see actual clocks for on
the AC line.
Have a look at https://nouveau.freedesktop.org/wiki/Optimus/ to learn how to
configure Prime.

As for the system hang when trying to reclock a suspended GPU, patches have
been sent to the Nouveau mailing list, but haven=E2=80=99t been merged yet.=
 You can
find them here:
https://github.com/karolherbst/nouveau/commits/clk_cleanup_for_real

> And when i launch a game (Tyranny), it does not work.

What is not working? If you didn=E2=80=99t specify anything, the game shoul=
d run on the
=E2=80=9Cprimary=E2=80=9D GPU by default, which quite often tends to be the=
 Intel GPU.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15168731410.8Be47BB.17013
Date: Thu, 25 Jan 2018 09:39:01 +0000
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
   title=3D"NEW - Unable to do reclocking manually"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104784#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unable to do reclocking manually"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104784">bug 10478=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Hello,

<span class=3D"quote">&gt; AC: core 0 MHz memory 0 MHz</span >

means your GPU is actually suspended: since you have an Optimus configurati=
on,
the NVIDIA GPU will suspend automatically if it hasn=E2=80=99t received any=
 work to do
in a short while. Try for example to run `DRI_PRIME=3D1 glxgears`, keep it
running and reissue the cat command: you should not see actual clocks for on
the AC line.
Have a look at <a href=3D"https://nouveau.freedesktop.org/wiki/Optimus/">ht=
tps://nouveau.freedesktop.org/wiki/Optimus/</a> to learn how to
configure Prime.

As for the system hang when trying to reclock a suspended GPU, patches have
been sent to the Nouveau mailing list, but haven=E2=80=99t been merged yet.=
 You can
find them here:
<a href=3D"https://github.com/karolherbst/nouveau/commits/clk_cleanup_for_r=
eal">https://github.com/karolherbst/nouveau/commits/clk_cleanup_for_real</a>

<span class=3D"quote">&gt; And when i launch a game (Tyranny), it does not =
work.</span >

What is not working? If you didn=E2=80=99t specify anything, the game shoul=
d run on the
=E2=80=9Cprimary=E2=80=9D GPU by default, which quite often tends to be the=
 Intel GPU.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15168731410.8Be47BB.17013--

--===============0583559868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0583559868==--
