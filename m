From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111841] Setting gamma or color temperature on GK104
 causes horizontal artifacts / flickering
Date: Mon, 30 Sep 2019 01:07:06 +0000
Message-ID: <bug-111841-8800-1pXU8nNDLn@http.bugs.freedesktop.org/>
References: <bug-111841-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0010950718=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111841-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0010950718==
Content-Type: multipart/alternative; boundary="15698056261.D01f.27158"
Content-Transfer-Encoding: 7bit


--15698056261.D01f.27158
Date: Mon, 30 Sep 2019 01:07:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111841

--- Comment #3 from Brian Clinkenbeard <brianclinkenbeard-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org> -=
--
(In reply to Ilia Mirkin from comment #2)
> We've recently started to implement more advanced color management handli=
ng,
> however I think that's only bound for v5.4. I'm not sure if anything was
> really fixed in those, but it may be worth testing on latest if possible
> (e.g. drm-next).
>=20
> Can you also play with dithering mode? e.g. set it to "static 2x2"?

Setting dithering to 'static 2x2' fixes the issue. I will try testing the 5=
.4rc
soon and see if that solves the issue as well.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15698056261.D01f.27158
Date: Mon, 30 Sep 2019 01:07:06 +0000
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
   title=3D"NEW - Setting gamma or color temperature on GK104 causes horizo=
ntal artifacts / flickering"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111841#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Setting gamma or color temperature on GK104 causes horizo=
ntal artifacts / flickering"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111841">bug 11184=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
brianclinkenbeard&#64;protonmail.com" title=3D"Brian Clinkenbeard &lt;brian=
clinkenbeard&#64;protonmail.com&gt;"> <span class=3D"fn">Brian Clinkenbeard=
</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D111=
841#c2">comment #2</a>)
<span class=3D"quote">&gt; We've recently started to implement more advance=
d color management handling,
&gt; however I think that's only bound for v5.4. I'm not sure if anything w=
as
&gt; really fixed in those, but it may be worth testing on latest if possib=
le
&gt; (e.g. drm-next).
&gt;=20
&gt; Can you also play with dithering mode? e.g. set it to &quot;static 2x2=
&quot;?</span >

Setting dithering to 'static 2x2' fixes the issue. I will try testing the 5=
.4rc
soon and see if that solves the issue as well.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15698056261.D01f.27158--

--===============0010950718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0010950718==--
