From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94727] [NV30/NV40] nouveau/pushbuf.c:238:
 pushbuf_krel: Assertion `bkref` failed.
Date: Tue, 28 Feb 2017 15:58:38 +0000
Message-ID: <bug-94727-8800-4tSBs69gcC@http.bugs.freedesktop.org/>
References: <bug-94727-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1389640016=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94727-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1389640016==
Content-Type: multipart/alternative; boundary="14882975171.eBE23DDb9.30184";
 charset="UTF-8"


--14882975171.eBE23DDb9.30184
Date: Tue, 28 Feb 2017 15:58:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94727

--- Comment #16 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
Haven't heard back from the original reporter downstream, but FAF (Fedora
Analysis Framework) reports thousands (literally) of similar bugs:

https://retrace.fedoraproject.org/faf/problems/2833836/

I see the patch in comment 13 has landed and is included in mesa-13.0.4, and
Fedora has an updated mesa package for 13.0.4 and, interestingly, I don't s=
ee
any mention of 13.0.4 in the FAF report, so it could be that this patch ind=
eed
fixes the issue with glamor/Xwayland on nv30.

Thanks again for your help, Ilia!

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14882975171.eBE23DDb9.30184
Date: Tue, 28 Feb 2017 15:58:37 +0000
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
   title=3D"NEW - [NV30/NV40] nouveau/pushbuf.c:238: pushbuf_krel: Assertio=
n `bkref` failed."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94727#c16">Commen=
t # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV30/NV40] nouveau/pushbuf.c:238: pushbuf_krel: Assertio=
n `bkref` failed."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94727">bug 94727<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fourdan&#64;xfce.org" title=3D"Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;=
"> <span class=3D"fn">Olivier Fourdan</span></a>
</span></b>
        <pre>Haven't heard back from the original reporter downstream, but =
FAF (Fedora
Analysis Framework) reports thousands (literally) of similar bugs:

<a href=3D"https://retrace.fedoraproject.org/faf/problems/2833836/">https:/=
/retrace.fedoraproject.org/faf/problems/2833836/</a>

I see the patch in <a href=3D"show_bug.cgi?id=3D94727#c13">comment 13</a> h=
as landed and is included in mesa-13.0.4, and
Fedora has an updated mesa package for 13.0.4 and, interestingly, I don't s=
ee
any mention of 13.0.4 in the FAF report, so it could be that this patch ind=
eed
fixes the issue with glamor/Xwayland on nv30.

Thanks again for your help, Ilia!</pre>
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

--14882975171.eBE23DDb9.30184--

--===============1389640016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1389640016==--
