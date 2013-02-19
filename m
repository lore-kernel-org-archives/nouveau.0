From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Tue, 19 Feb 2013 10:22:29 +0000
Message-ID: <bug-59168-8800-kLC4LiYIRt@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2019704175=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2019704175==
Content-Type: multipart/alternative; boundary="1361269349.D6344.19439"; charset="us-ascii"


--1361269349.D6344.19439
Date: Tue, 19 Feb 2013 10:22:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D59168

--- Comment #10 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Michael Weirauch,

I noticed your whitty comment on bug #50121 and thought that I should repor=
t my
debug findings on issue's like these. I have a comparable bug with my 7300GT
(NV4B) at bug #23223. The card suspends fine, but resume's with a lot of
garbage.

- Altough both cards are not the same, in fact the differences are probably
huge.
- Altough I'm not a developer or expert in any of this.
I'm just sharing my knowledge here so you could hopefully aid the developer=
s on
doing their magic.

First:
- Martin Slusarz mentions in bug #23223 comment 18 a script limiter. Maybe =
you
can try. I report my results at comment 19 in that same bug. Please note th=
ere
is an off by one error mentioned in comment 20 you should take into account=
 if
you start to use it. But it works fine.

This method probably helps you, as "nouveau.config=3DDEVINIT=3DNvForcePost=
=3D1" also
gave garbage in your case. Which means that these scripts are doing somethi=
ng
wrong or unexpected/unknown.

Do this with the latest git kernel plus the latest nouveau tree.

Second:
- Comment 8 in this bug mentioned that switching to the proprietary driver
fixed his issue. This is not bad news per s=C3=A9. As this could give hope =
of
gaining more intel by doing an mmiotrace of a working state:

http://nouveau.freedesktop.org/wiki/MmioTrace

Also check bug #23223 on my findings while doing this. It's best to not use=
 X
or Wayland, but only to enable udev. You have to use mmiotrace across a
suspend/resume cycle. I think without using X is the best way to do it. Try=
 to
compress the resulting file with 'xz --best'. I did that, and was able to
upload it to the bug itself.

Do this with the latest git kernel plus the latest nouveau tree.

Third and final:
- I made a VBIOS dump to aid in debugging, which was also requested by Marc=
in
Slusarz.

https://bugs.freedesktop.org/show_bug.cgi?id=3D23223#c14

You have to use a v3.6(.9) kernel to use the mechanism I used since that pi=
ece
of infrastructure was not ported to later kernel versions during the big re=
work
in v3.7. Also I'm not sure, but it is said you can also retrieve a VBIOS fr=
om
an MMIOTRACE. But alas, I'm not sure so it might be a good idea to seperate=
ly
post it.

Above procedures should keep you occupied on a nice rainy sunday afternoon.=
 If
you are going to do this, please mention that you do this on IRC. Maybe som=
eone
might get interested in this as more information has become available.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1361269349.D6344.19439
Date: Tue, 19 Feb 2013 10:22:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/=
corruption/noise on resume"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59168#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/=
corruption/noise on resume"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59168">bug 59168<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ronald645&#64;gmail.com" title=3D"Ronald &lt;ronald645&#64;gmail.com&gt;"> =
<span class=3D"fn">Ronald</span></a>
</span></b>
        <pre>Michael Weirauch,

I noticed your whitty comment on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [Regression] Since kernel v3.5 several cards f=
ail to resume, introduced by: 'convert to exec engine, and improve channel =
sync'"
   href=3D"show_bug.cgi?id=3D50121">bug #50121</a> and thought that I shoul=
d report my
debug findings on issue's like these. I have a comparable bug with my 7300GT
(NV4B) at <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV4B] nVidia Geforce 7300 fails to properly resume"
   href=3D"show_bug.cgi?id=3D23223">bug #23223</a>. The card suspends fine,=
 but resume's with a lot of
garbage.

- Altough both cards are not the same, in fact the differences are probably
huge.
- Altough I'm not a developer or expert in any of this.
I'm just sharing my knowledge here so you could hopefully aid the developer=
s on
doing their magic.

First:
- Martin Slusarz mentions in <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV4B] nVidia Geforce 7300 fails to properly resume"
   href=3D"show_bug.cgi?id=3D23223#c18">bug #23223 comment 18</a> a script =
limiter. Maybe you
can try. I report my results at <a href=3D"show_bug.cgi?id=3D59168#c19">com=
ment 19</a> in that same bug. Please note there
is an off by one error mentioned in <a href=3D"show_bug.cgi?id=3D59168#c20"=
>comment 20</a> you should take into account if
you start to use it. But it works fine.

This method probably helps you, as &quot;nouveau.config=3DDEVINIT=3DNvForce=
Post=3D1&quot; also
gave garbage in your case. Which means that these scripts are doing somethi=
ng
wrong or unexpected/unknown.

Do this with the latest git kernel plus the latest nouveau tree.

Second:
- <a href=3D"show_bug.cgi?id=3D59168#c8">Comment 8</a> in this bug mentione=
d that switching to the proprietary driver
fixed his issue. This is not bad news per s=C3=A9. As this could give hope =
of
gaining more intel by doing an mmiotrace of a working state:

<a href=3D"http://nouveau.freedesktop.org/wiki/MmioTrace">http://nouveau.fr=
eedesktop.org/wiki/MmioTrace</a>

Also check <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV4B] nVidia Geforce 7300 fails to properly resume"
   href=3D"show_bug.cgi?id=3D23223">bug #23223</a> on my findings while doi=
ng this. It's best to not use X
or Wayland, but only to enable udev. You have to use mmiotrace across a
suspend/resume cycle. I think without using X is the best way to do it. Try=
 to
compress the resulting file with 'xz --best'. I did that, and was able to
upload it to the bug itself.

Do this with the latest git kernel plus the latest nouveau tree.

Third and final:
- I made a VBIOS dump to aid in debugging, which was also requested by Marc=
in
Slusarz.

<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV4B] nVidia Geforce 7300 fails to properly resume"
   href=3D"show_bug.cgi?id=3D23223#c14">https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D23223#c14</a>

You have to use a v3.6(.9) kernel to use the mechanism I used since that pi=
ece
of infrastructure was not ported to later kernel versions during the big re=
work
in v3.7. Also I'm not sure, but it is said you can also retrieve a VBIOS fr=
om
an MMIOTRACE. But alas, I'm not sure so it might be a good idea to seperate=
ly
post it.

Above procedures should keep you occupied on a nice rainy sunday afternoon.=
 If
you are going to do this, please mention that you do this on IRC. Maybe som=
eone
might get interested in this as more information has become available.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361269349.D6344.19439--

--===============2019704175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2019704175==--
