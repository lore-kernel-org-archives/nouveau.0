From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Sat, 14 May 2016 20:02:06 +0000
Message-ID: <bug-59069-8800-Af8naAIOuz@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0947251121=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0947251121==
Content-Type: multipart/alternative; boundary="14632561263.EAA4.11987";
 charset="UTF-8"


--14632561263.EAA4.11987
Date: Sat, 14 May 2016 20:02:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D59069

--- Comment #37 from Jeff Hodd <jghodd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This is still an issue with linux 4.5.4 as well.

I'm using a GeForce 7150m and am getting the same error:

May 14 14:16:00 bslxhp64 kernel: nouveau 0000:00:12.0: plasmashell[8397]: f=
ail
ttm_validate
May 14 14:16:00 bslxhp64 kernel: nouveau 0000:00:12.0: plasmashell[8397]:
validating bo list
May 14 14:16:00 bslxhp64 kernel: nouveau 0000:00:12.0: plasmashell[8397]:
validate: -12
May 14 14:16:00 bslxhp64 kernel: nouveau 0000:00:12.0: plasmashell[8397]: f=
ail
ttm_validate
May 14 14:16:00 bslxhp64 kernel: nouveau 0000:00:12.0: plasmashell[8397]:
validating bo list
May 14 14:16:00 bslxhp64 kernel: nouveau 0000:00:12.0: plasmashell[8397]:
validate: -12

As a side note, I've been seeing these errors since updating from plasma4 to
plasma5 (a couple of months now), and thus far have been uncertain whether =
or
not this is a driver issue or a plasma issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14632561263.EAA4.11987
Date: Sat, 14 May 2016 20:02:06 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau E[ DRM] fail ttm_validate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59069#c37">Commen=
t # 37</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau E[ DRM] fail ttm_validate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59069">bug 59069<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jghodd&#64;gmail.com" title=3D"Jeff Hodd &lt;jghodd&#64;gmail.com&gt;"> <sp=
an class=3D"fn">Jeff Hodd</span></a>
</span></b>
        <pre>This is still an issue with linux 4.5.4 as well.

I'm using a GeForce 7150m and am getting the same error:

May 14 14:16:00 bslxhp64 kernel: nouveau 0000:00:12.0: plasmashell[8397]: f=
ail
ttm_validate
May 14 14:16:00 bslxhp64 kernel: nouveau 0000:00:12.0: plasmashell[8397]:
validating bo list
May 14 14:16:00 bslxhp64 kernel: nouveau 0000:00:12.0: plasmashell[8397]:
validate: -12
May 14 14:16:00 bslxhp64 kernel: nouveau 0000:00:12.0: plasmashell[8397]: f=
ail
ttm_validate
May 14 14:16:00 bslxhp64 kernel: nouveau 0000:00:12.0: plasmashell[8397]:
validating bo list
May 14 14:16:00 bslxhp64 kernel: nouveau 0000:00:12.0: plasmashell[8397]:
validate: -12

As a side note, I've been seeing these errors since updating from plasma4 to
plasma5 (a couple of months now), and thus far have been uncertain whether =
or
not this is a driver issue or a plasma issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14632561263.EAA4.11987--

--===============0947251121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0947251121==--
