From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96355] Performance: extra&costly SSBO validation
 even when SSBO aren't used
Date: Mon, 06 Jun 2016 09:17:44 +0000
Message-ID: <bug-96355-8800-EWMm2eVmWX@http.bugs.freedesktop.org/>
References: <bug-96355-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0031609795=="
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


--===============0031609795==
Content-Type: multipart/alternative; boundary="14652046640.282B0eBa.24069";
 charset="UTF-8"


--14652046640.282B0eBa.24069
Date: Mon, 6 Jun 2016 09:17:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96355

--- Comment #13 from Karol Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> ---
(In reply to Gediminas Jakutis from comment #8)
> I don't know about the reporter's case, but I have ran some benchmarks and
> tests with f018456901ee291181ecce74c30b19c9f6731f06 (latest revision befo=
re
> those four patches) and fd6bbc2ee205ed02f66a8d8ef5b2adf4005d588c (the lat=
est
> revision, with the four patches) on my GTX 770 + FX-8320 @ 4.1GHz, focusi=
ng
> on CPU-bound cases.
>=20
> The results are all to the better - on most games I tested I see 4-10%
> performance boost. Am only going to list a pair of highlights:
>=20
> =C2=B7 Age of Wonders III, my own severely CPU limited testcase: 21 fps -=
> 26
> fps, a jump by a whooping 23.8% (still CPU-bound, though).
> =C2=B7 Payday 2, well, this game has no [reproducable] way to benchmark i=
t, but
> the gameplay used to be nightmare filled with severe rubber-banding, runn=
ing
> just some 18-22 fps in many situations, all while painfully CPU-bound. No=
w,
> most of rubber-banding is either gone or is a lot less noticeable. The
> framerate in these aforementioned situations went up to 25-60; dipping be=
low
> 30 very rarely, while mostly maintaining over 2x performance boost.
> Basically, these four patches made the game *playable* on nouveau. (The g=
ame
> is still very painfully CPU-bound, though.)
>=20
> So, at least here, I can see clear performance benefits.
> Will leave to be marked as RESOLVED by the reporter; don't want to hijack
> his issue.

I saw the same thing with PAYDAY 2, but I couldn't restore the low perf so I
guess they just reworked their engine while they added the SMAA and SSAO th=
ing,
so I doubt those patches had anything to do with that :/

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14652046640.282B0eBa.24069
Date: Mon, 6 Jun 2016 09:17:44 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Performance: extra&amp;costly SSBO validation =
even when SSBO aren't used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96355#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Performance: extra&amp;costly SSBO validation =
even when SSBO aren't used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96355">bug 96355<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;karolherbst.de" title=3D"Karol Herbst &lt;freedesktop&#64;k=
arolherbst.de&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Gediminas Jakutis from <a href=3D"show_bug.cgi?id=
=3D96355#c8">comment #8</a>)
<span class=3D"quote">&gt; I don't know about the reporter's case, but I ha=
ve ran some benchmarks and
&gt; tests with f018456901ee291181ecce74c30b19c9f6731f06 (latest revision b=
efore
&gt; those four patches) and fd6bbc2ee205ed02f66a8d8ef5b2adf4005d588c (the =
latest
&gt; revision, with the four patches) on my GTX 770 + FX-8320 &#64; 4.1GHz,=
 focusing
&gt; on CPU-bound cases.
&gt;=20
&gt; The results are all to the better - on most games I tested I see 4-10%
&gt; performance boost. Am only going to list a pair of highlights:
&gt;=20
&gt; =C2=B7 Age of Wonders III, my own severely CPU limited testcase: 21 fp=
s -&gt; 26
&gt; fps, a jump by a whooping 23.8% (still CPU-bound, though).
&gt; =C2=B7 Payday 2, well, this game has no [reproducable] way to benchmar=
k it, but
&gt; the gameplay used to be nightmare filled with severe rubber-banding, r=
unning
&gt; just some 18-22 fps in many situations, all while painfully CPU-bound.=
 Now,
&gt; most of rubber-banding is either gone or is a lot less noticeable. The
&gt; framerate in these aforementioned situations went up to 25-60; dipping=
 below
&gt; 30 very rarely, while mostly maintaining over 2x performance boost.
&gt; Basically, these four patches made the game *playable* on nouveau. (Th=
e game
&gt; is still very painfully CPU-bound, though.)
&gt;=20
&gt; So, at least here, I can see clear performance benefits.
&gt; Will leave to be marked as RESOLVED by the reporter; don't want to hij=
ack
&gt; his issue.</span >

I saw the same thing with PAYDAY 2, but I couldn't restore the low perf so I
guess they just reworked their engine while they added the SMAA and SSAO th=
ing,
so I doubt those patches had anything to do with that :/</pre>
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

--14652046640.282B0eBa.24069--

--===============0031609795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0031609795==--
