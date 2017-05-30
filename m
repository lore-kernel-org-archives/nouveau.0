From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101220] xorg-server-1.19.3 crashes when trying to
 enable HDMI output
Date: Tue, 30 May 2017 14:28:21 +0000
Message-ID: <bug-101220-8800-KOi8LmvAPK@http.bugs.freedesktop.org/>
References: <bug-101220-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0655523017=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101220-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0655523017==
Content-Type: multipart/alternative; boundary="14961545012.8acAb65.2217";
 charset="UTF-8"


--14961545012.8acAb65.2217
Date: Tue, 30 May 2017 14:28:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101220

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Pacho Ramos from comment #11)
> I don't use any initrd... I could rely on CONFIG_EXTRA_FIRMWARE... but I
> thought I didn't need that as nouveau is compiled as a module and not into
> the kernel :|

OK, well if modules are loaded off the FS and not initrd, then you're good =
on
that front, assuming you really do have the updated linux-firwmare (April 4=
 or
later --
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/commit/?id=3Db14134583c2a15d4404695f72cb523daedb877ab).
Lots of people use initrd without understanding how it works.

So there are two issues here...

#1: we should probably disable reverse prime if you don't have acceleration=
 (or
figure out how to make it work without accel... should just be a very slow
memcpy away... not great, but better than a non-working screen)

#2: we should figure out what's going on with accel on your GP107 -- looks =
like
stuff is just hanging (that's the "timeout" messages you see, we're waiting=
 for
some condition to become true, and it never does).

I can help with the former, and hopefully Ben Skeggs can investigate the
latter.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14961545012.8acAb65.2217
Date: Tue, 30 May 2017 14:28:21 +0000
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
   title=3D"NEW - xorg-server-1.19.3 crashes when trying to enable HDMI out=
put"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101220#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - xorg-server-1.19.3 crashes when trying to enable HDMI out=
put"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101220">bug 10122=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Pacho Ramos from <a href=3D"show_bug.cgi?id=3D101=
220#c11">comment #11</a>)
<span class=3D"quote">&gt; I don't use any initrd... I could rely on CONFIG=
_EXTRA_FIRMWARE... but I
&gt; thought I didn't need that as nouveau is compiled as a module and not =
into
&gt; the kernel :|</span >

OK, well if modules are loaded off the FS and not initrd, then you're good =
on
that front, assuming you really do have the updated linux-firwmare (April 4=
 or
later --
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-f=
irmware.git/commit/?id=3Db14134583c2a15d4404695f72cb523daedb877ab">https://=
git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/=
?id=3Db14134583c2a15d4404695f72cb523daedb877ab</a>).
Lots of people use initrd without understanding how it works.

So there are two issues here...

#1: we should probably disable reverse prime if you don't have acceleration=
 (or
figure out how to make it work without accel... should just be a very slow
memcpy away... not great, but better than a non-working screen)

#2: we should figure out what's going on with accel on your GP107 -- looks =
like
stuff is just hanging (that's the &quot;timeout&quot; messages you see, we'=
re waiting for
some condition to become true, and it never does).

I can help with the former, and hopefully Ben Skeggs can investigate the
latter.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14961545012.8acAb65.2217--

--===============0655523017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0655523017==--
