From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96355] Performance: extra&costly SSBO validation
 even when SSBO aren't used
Date: Sun, 05 Jun 2016 10:18:39 +0000
Message-ID: <bug-96355-8800-CbNlVyuXNL@http.bugs.freedesktop.org/>
References: <bug-96355-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1848196305=="
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


--===============1848196305==
Content-Type: multipart/alternative; boundary="14651219191.b52D5c9.23842";
 charset="UTF-8"


--14651219191.b52D5c9.23842
Date: Sun, 5 Jun 2016 10:18:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96355

--- Comment #8 from Gediminas Jakutis <gediminas-1NU85dn7e2ownf/OCUKchA@public.gmane.org> ---
I don't know about the reporter's case, but I have ran some benchmarks and
tests with f018456901ee291181ecce74c30b19c9f6731f06 (latest revision before
those four patches) and fd6bbc2ee205ed02f66a8d8ef5b2adf4005d588c (the latest
revision, with the four patches) on my GTX 770 + FX-8320 @ 4.1GHz, focusing=
 on
CPU-bound cases.

The results are all to the better - on most games I tested I see 4-10%
performance boost. Am only going to list a pair of highlights:

=C2=B7 Age of Wonders III, my own severely CPU limited testcase: 21 fps -> =
26 fps, a
jump by a whooping 23.8% (still CPU-bound, though).
=C2=B7 Payday 2, well, this game has no [reproducable] way to benchmark it,=
 but the
gameplay used to be nightmare filled with severe rubber-banding, running ju=
st
some 18-22 fps in many situations, all while painfully CPU-bound. Now, most=
 of
rubber-banding is either gone or is a lot less noticeable. The framerate in
these aforementioned situations went up to 25-60; dipping below 30 very rar=
ely,
while mostly maintaining over 2x performance boost. Basically, these four
patches made the game *playable* on nouveau. (The game is still very painfu=
lly
CPU-bound, though.)

So, at least here, I can see clear performance benefits.
Will leave to be marked as RESOLVED by the reporter; don't want to hijack h=
is
issue.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14651219191.b52D5c9.23842
Date: Sun, 5 Jun 2016 10:18:39 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96355#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Performance: extra&amp;costly SSBO validation even when S=
SBO aren't used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96355">bug 96355<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gediminas&#64;varciai.lt" title=3D"Gediminas Jakutis &lt;gediminas&#64;varc=
iai.lt&gt;"> <span class=3D"fn">Gediminas Jakutis</span></a>
</span></b>
        <pre>I don't know about the reporter's case, but I have ran some be=
nchmarks and
tests with f018456901ee291181ecce74c30b19c9f6731f06 (latest revision before
those four patches) and fd6bbc2ee205ed02f66a8d8ef5b2adf4005d588c (the latest
revision, with the four patches) on my GTX 770 + FX-8320 &#64; 4.1GHz, focu=
sing on
CPU-bound cases.

The results are all to the better - on most games I tested I see 4-10%
performance boost. Am only going to list a pair of highlights:

=C2=B7 Age of Wonders III, my own severely CPU limited testcase: 21 fps -&g=
t; 26 fps, a
jump by a whooping 23.8% (still CPU-bound, though).
=C2=B7 Payday 2, well, this game has no [reproducable] way to benchmark it,=
 but the
gameplay used to be nightmare filled with severe rubber-banding, running ju=
st
some 18-22 fps in many situations, all while painfully CPU-bound. Now, most=
 of
rubber-banding is either gone or is a lot less noticeable. The framerate in
these aforementioned situations went up to 25-60; dipping below 30 very rar=
ely,
while mostly maintaining over 2x performance boost. Basically, these four
patches made the game *playable* on nouveau. (The game is still very painfu=
lly
CPU-bound, though.)

So, at least here, I can see clear performance benefits.
Will leave to be marked as RESOLVED by the reporter; don't want to hijack h=
is
issue.</pre>
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

--14651219191.b52D5c9.23842--

--===============1848196305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1848196305==--
