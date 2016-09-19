From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97620] [REGRESSION] KMS having issues after kernel
 upgrade (4.5.1-1 to 4.6.4-1)
Date: Mon, 19 Sep 2016 05:34:29 +0000
Message-ID: <bug-97620-8800-79urOrvtCf@http.bugs.freedesktop.org/>
References: <bug-97620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2110862927=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2110862927==
Content-Type: multipart/alternative; boundary="14742632691.6fB3abE.20579";
 charset="UTF-8"


--14742632691.6fB3abE.20579
Date: Mon, 19 Sep 2016 05:34:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97620

--- Comment #27 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looking at our VBIOS repo, we have a bunch (but not all) of GF104's that are
missing the 0x2240c write as well as one GK107. Every other (GF100+) GPU se=
ts
0x2240c. I guess it's not as reliable as we'd hoped.

This is how I checked:

for i in nv[cdef]?/*/*.rom nv1??/*/*.rom; do echo $i; nvbios $i |& grep
0x02240c; done

And looked for files without a 'NV_REG   R[0x02240c] &=3D 0xfffffffd |=3D
0x00000002' command.

Although that in itself shouldn't be a major issue - rerunning the VBIOS
shouldn't cause issues...

Looking at a mmiotrace that came with one of those GF104 VBIOSes that are
missing a 0x2240c write, it doesn't seem like the VBIOS gets executed there=
, or
at least not that script. It's late and I could have messed up though.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14742632691.6fB3abE.20579
Date: Mon, 19 Sep 2016 05:34:29 +0000
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
   title=3D"NEW - [REGRESSION] KMS having issues after kernel upgrade (4.5.=
1-1 to 4.6.4-1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620#c27">Commen=
t # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION] KMS having issues after kernel upgrade (4.5.=
1-1 to 4.6.4-1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620">bug 97620<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looking at our VBIOS repo, we have a bunch (but not all) of GF=
104's that are
missing the 0x2240c write as well as one GK107. Every other (GF100+) GPU se=
ts
0x2240c. I guess it's not as reliable as we'd hoped.

This is how I checked:

for i in nv[cdef]?/*/*.rom nv1??/*/*.rom; do echo $i; nvbios $i |&amp; grep
0x02240c; done

And looked for files without a 'NV_REG   R[0x02240c] &amp;=3D 0xfffffffd |=
=3D
0x00000002' command.

Although that in itself shouldn't be a major issue - rerunning the VBIOS
shouldn't cause issues...

Looking at a mmiotrace that came with one of those GF104 VBIOSes that are
missing a 0x2240c write, it doesn't seem like the VBIOS gets executed there=
, or
at least not that script. It's late and I could have messed up though.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14742632691.6fB3abE.20579--

--===============2110862927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2110862927==--
