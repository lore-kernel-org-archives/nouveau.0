From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108615] [NVE7] changing resolution causes blank
 screen
Date: Sat, 21 Sep 2019 20:49:48 +0000
Message-ID: <bug-108615-8800-ABLjuP5FeA@http.bugs.freedesktop.org/>
References: <bug-108615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0040712006=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0040712006==
Content-Type: multipart/alternative; boundary="15690989880.09885D0.7726"
Content-Transfer-Encoding: 7bit


--15690989880.09885D0.7726
Date: Sat, 21 Sep 2019 20:49:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108615

--- Comment #7 from jbytecoder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I have tested the issue against linux-5.3 and it stil persists. I also
attempted to narrow down the commit that did introduce the problem.=20

Using kernel sources at https://github.com/torvalds/linux.git i detected th=
at
between tags v4.9 and v4.10  The kernel breaks @ 9439b3710df6 - this is a b=
ig
change commit that intorduces drm changes planned for linux-4.10.=20

I guess the issue has to do with "atomic modesseting" it would appear that =
for
nv50 the atomic modesseting works only for default resolution, but not for =
any
other

Can someone suggest any way to further narrow down the culprit ?
logging has no effect ( no errors appear in log )

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15690989880.09885D0.7726
Date: Sat, 21 Sep 2019 20:49:48 +0000
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
   title=3D"NEW - [NVE7] changing resolution causes blank screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108615#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] changing resolution causes blank screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108615">bug 10861=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jbytecoder&#64;gmail.com" title=3D"jbytecoder&#64;gmail.com">jbytecoder&#64=
;gmail.com</a>
</span></b>
        <pre>I have tested the issue against linux-5.3 and it stil persists=
. I also
attempted to narrow down the commit that did introduce the problem.=20

Using kernel sources at <a href=3D"https://github.com/torvalds/linux.git">h=
ttps://github.com/torvalds/linux.git</a> i detected that
between tags v4.9 and v4.10  The kernel breaks &#64; 9439b3710df6 - this is=
 a big
change commit that intorduces drm changes planned for linux-4.10.=20

I guess the issue has to do with &quot;atomic modesseting&quot; it would ap=
pear that for
nv50 the atomic modesseting works only for default resolution, but not for =
any
other

Can someone suggest any way to further narrow down the culprit ?
logging has no effect ( no errors appear in log )</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15690989880.09885D0.7726--

--===============0040712006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0040712006==--
