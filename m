From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104652] None of the video outputs are usable for GTX
 1060 - jerky video every few seconds
Date: Wed, 17 Jan 2018 08:23:33 +0000
Message-ID: <bug-104652-8800-TfYmlr4W6d@http.bugs.freedesktop.org/>
References: <bug-104652-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1262005345=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104652-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1262005345==
Content-Type: multipart/alternative; boundary="15161774130.Ff8cD8.9222"
Content-Transfer-Encoding: 7bit


--15161774130.Ff8cD8.9222
Date: Wed, 17 Jan 2018 08:23:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104652

--- Comment #4 from Artem S. Tashkinov <t.artem-VInPYn6yXxRWk0Htik3J/w@public.gmane.org> ---
Created attachment 136801
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136801&action=3Dedit
Xorg.0.log

I'm now attaching Xorg.0.log so that you could check yourself.

(In reply to Ilia Mirkin from comment #2)
> Are you using xf86-video-nouveau or modesetting? If the latter, please try
> to use xf86-vidoe-nouveau.
>=20
> Frames showing out of order is a frequent issue when copying the contents=
 of
> the frame takes too long (and so the "old" frame being displayed actually
> ends up with "new" contents written over it). I have a hard time imagining
> that this would happen with -vo xv and xf86-video-nouveau, but who knows.

# cat /etc/X11/xorg.conf.d/01-nouveau.conf=20
Section "Device"
        Identifier      "Videocard0"
        Driver          "nouveau"
        VendorName      "NVIDIA"
        BoardName       "NVIDIA Corporation GP106 [GeForce GTX 1060 6GB] (r=
ev
a1)"
EndSection


(In reply to Ilia Mirkin from comment #3)
> (In reply to Ilia Mirkin from comment #2)
> > Are you using xf86-video-nouveau or modesetting? If the latter, please =
try
> > to use xf86-vidoe-nouveau.
> >=20
> > Frames showing out of order is a frequent issue when copying the conten=
ts of
> > the frame takes too long (and so the "old" frame being displayed actual=
ly
> > ends up with "new" contents written over it). I have a hard time imagin=
ing
> > that this would happen with -vo xv and xf86-video-nouveau, but who know=
s.
>=20
> Oh, another way this comes up is if your CPU is too slow to decode the vi=
deo
> -- the display thread thinks it has a "good" buffer, but it actually shows
> an old frame. There's no video decoding acceleration in nouveau since the
> GM10x family, so you're doing this all with CPU.

My CPU is more than capable - under NVIDIA binary drivers no such issue exi=
sts.
Average CPU load for this video is less than 20%.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15161774130.Ff8cD8.9222
Date: Wed, 17 Jan 2018 08:23:33 +0000
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
   title=3D"NEW - None of the video outputs are usable for GTX 1060 - jerky=
 video every few seconds"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104652#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - None of the video outputs are usable for GTX 1060 - jerky=
 video every few seconds"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104652">bug 10465=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t.artem&#64;mailcity.com" title=3D"Artem S. Tashkinov &lt;t.artem&#64;mailc=
ity.com&gt;"> <span class=3D"fn">Artem S. Tashkinov</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136801=
" name=3D"attach_136801" title=3D"Xorg.0.log">attachment 136801</a> <a href=
=3D"attachment.cgi?id=3D136801&amp;action=3Dedit" title=3D"Xorg.0.log">[det=
ails]</a></span>
Xorg.0.log

I'm now attaching Xorg.0.log so that you could check yourself.

(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D104652#c2">comme=
nt #2</a>)
<span class=3D"quote">&gt; Are you using xf86-video-nouveau or modesetting?=
 If the latter, please try
&gt; to use xf86-vidoe-nouveau.
&gt;=20
&gt; Frames showing out of order is a frequent issue when copying the conte=
nts of
&gt; the frame takes too long (and so the &quot;old&quot; frame being displ=
ayed actually
&gt; ends up with &quot;new&quot; contents written over it). I have a hard =
time imagining
&gt; that this would happen with -vo xv and xf86-video-nouveau, but who kno=
ws.</span >

# cat /etc/X11/xorg.conf.d/01-nouveau.conf=20
Section &quot;Device&quot;
        Identifier      &quot;Videocard0&quot;
        Driver          &quot;nouveau&quot;
        VendorName      &quot;NVIDIA&quot;
        BoardName       &quot;NVIDIA Corporation GP106 [GeForce GTX 1060 6G=
B] (rev
a1)&quot;
EndSection


(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D104652#c3">comme=
nt #3</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D104652#c2">comment #2</a>)
&gt; &gt; Are you using xf86-video-nouveau or modesetting? If the latter, p=
lease try
&gt; &gt; to use xf86-vidoe-nouveau.
&gt; &gt;=20
&gt; &gt; Frames showing out of order is a frequent issue when copying the =
contents of
&gt; &gt; the frame takes too long (and so the &quot;old&quot; frame being =
displayed actually
&gt; &gt; ends up with &quot;new&quot; contents written over it). I have a =
hard time imagining
&gt; &gt; that this would happen with -vo xv and xf86-video-nouveau, but wh=
o knows.
&gt;=20
&gt; Oh, another way this comes up is if your CPU is too slow to decode the=
 video
&gt; -- the display thread thinks it has a &quot;good&quot; buffer, but it =
actually shows
&gt; an old frame. There's no video decoding acceleration in nouveau since =
the
&gt; GM10x family, so you're doing this all with CPU.</span >

My CPU is more than capable - under NVIDIA binary drivers no such issue exi=
sts.
Average CPU load for this video is less than 20%.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15161774130.Ff8cD8.9222--

--===============1262005345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1262005345==--
