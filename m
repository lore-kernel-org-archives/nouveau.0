From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91523] [NVE7] driver cannot initialize gpu(failed to
 parse ramcfg data)
Date: Wed, 22 Nov 2017 22:57:12 +0000
Message-ID: <bug-91523-8800-h3dkFUqbqy@http.bugs.freedesktop.org/>
References: <bug-91523-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0567443236=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91523-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0567443236==
Content-Type: multipart/alternative; boundary="15113914321.8026db7.21953";
 charset="UTF-8"


--15113914321.8026db7.21953
Date: Wed, 22 Nov 2017 22:57:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91523

--- Comment #6 from FeepingCreature <default_357-line-LWAfsSFWpa4@public.gmane.org> ---
Looking at envytools' nvbios decode, given ramcfg=3D1, the first entry of t=
he
timing mapping table (0x718f) has a value of 0xf at index 1, offset 0. This=
 is
taken as index into the timing table (0x733c); however, the timing table on=
ly
defines 12 entries, and only six of them are nonzero.

If I simply skip entry 0, reclocking works fine. Maybe that's what 0x0f
indicates?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15113914321.8026db7.21953
Date: Wed, 22 Nov 2017 22:57:12 +0000
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
   title=3D"NEW - [NVE7] driver cannot initialize gpu(failed to parse ramcf=
g data)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91523#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] driver cannot initialize gpu(failed to parse ramcf=
g data)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91523">bug 91523<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
default_357-line&#64;yahoo.de" title=3D"FeepingCreature &lt;default_357-lin=
e&#64;yahoo.de&gt;"> <span class=3D"fn">FeepingCreature</span></a>
</span></b>
        <pre>Looking at envytools' nvbios decode, given ramcfg=3D1, the fir=
st entry of the
timing mapping table (0x718f) has a value of 0xf at index 1, offset 0. This=
 is
taken as index into the timing table (0x733c); however, the timing table on=
ly
defines 12 entries, and only six of them are nonzero.

If I simply skip entry 0, reclocking works fine. Maybe that's what 0x0f
indicates?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15113914321.8026db7.21953--

--===============0567443236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0567443236==--
