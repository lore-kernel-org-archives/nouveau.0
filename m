From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98677] [NVAC] iMac9,
 1 effective backlight brightness range changes after S3
Date: Fri, 11 Nov 2016 22:40:01 +0000
Message-ID: <bug-98677-8800-dNxBR1Bngi@http.bugs.freedesktop.org/>
References: <bug-98677-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1021796160=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98677-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1021796160==
Content-Type: multipart/alternative; boundary="14789040010.417e.23570";
 charset="UTF-8"


--14789040010.417e.23570
Date: Fri, 11 Nov 2016 22:40:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98677

--- Comment #9 from Jeffery Miller <jefferym-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I tried a few more brightness tests with the nvidia binary blob. There's a
similar mmiotrace already attached.

I've observed that the nvidia driver sets the values of=20
I observed that the nvidia driver sets both 0x0061c080 and 0x0061c084 on ea=
ch
brightness change.
It always sets 0x0061c080 to 0x17 and 61c084 with the following
percent values:

% setting    |  0x0061c084 poke
---
21              0x800000d8
22              0x800000e2
30              0x80000134
50              0x80000201
70              0x800002ce
78              0x80000320
100             0x80000401

I noticed that if I change value to 21% (d8) or below the screen is dark/bl=
ack.
It then stays dark at levels such as 30%, 50%, and such that worked previou=
sly.
If I set it to 78% or 100% the screen will appear again. Once it reappears =
the
50%, 30% values work as they did previously.

I patched the nouveau backlight code to always set the PWM_DIV to 0x17. The
nouveau driver then behaved the same for the various percent values mention=
ed
above. It also had the off at low requiring a high % to have it show again.

I reverted to my original patch which would always set the DIV to 0x1 on ea=
ch
change. This makes it consistent with the fresh boot value. This has the si=
de
effect that after a post (and a resume from suspend) the value is always the
same.
The visible range is wider for the 0x1 case. The screen doesn't turn fully =
dark
until around 14%. Additionally it would return to the previous value without
having to jump all the way up to a high value. It could go from the 14% off
case back to 50% and the screen had the same brightness. I am observing the
brightness with my eye.
The percent to DUTY value being set to 0x61c084 is similar in each driver.
Nouveau sets 0x401 for 100%, 0x200 for 50%.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14789040010.417e.23570
Date: Fri, 11 Nov 2016 22:40:01 +0000
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
   title=3D"NEW - [NVAC] iMac9,1 effective backlight brightness range chang=
es after S3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98677#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] iMac9,1 effective backlight brightness range chang=
es after S3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98677">bug 98677<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jefferym&#64;gmail.com" title=3D"Jeffery Miller &lt;jefferym&#64;gmail.com&=
gt;"> <span class=3D"fn">Jeffery Miller</span></a>
</span></b>
        <pre>I tried a few more brightness tests with the nvidia binary blo=
b. There's a
similar mmiotrace already attached.

I've observed that the nvidia driver sets the values of=20
I observed that the nvidia driver sets both 0x0061c080 and 0x0061c084 on ea=
ch
brightness change.
It always sets 0x0061c080 to 0x17 and 61c084 with the following
percent values:

% setting    |  0x0061c084 poke
---
21              0x800000d8
22              0x800000e2
30              0x80000134
50              0x80000201
70              0x800002ce
78              0x80000320
100             0x80000401

I noticed that if I change value to 21% (d8) or below the screen is dark/bl=
ack.
It then stays dark at levels such as 30%, 50%, and such that worked previou=
sly.
If I set it to 78% or 100% the screen will appear again. Once it reappears =
the
50%, 30% values work as they did previously.

I patched the nouveau backlight code to always set the PWM_DIV to 0x17. The
nouveau driver then behaved the same for the various percent values mention=
ed
above. It also had the off at low requiring a high % to have it show again.

I reverted to my original patch which would always set the DIV to 0x1 on ea=
ch
change. This makes it consistent with the fresh boot value. This has the si=
de
effect that after a post (and a resume from suspend) the value is always the
same.
The visible range is wider for the 0x1 case. The screen doesn't turn fully =
dark
until around 14%. Additionally it would return to the previous value without
having to jump all the way up to a high value. It could go from the 14% off
case back to 50% and the screen had the same brightness. I am observing the
brightness with my eye.
The percent to DUTY value being set to 0x61c084 is similar in each driver.
Nouveau sets 0x401 for 100%, 0x200 for 50%.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14789040010.417e.23570--

--===============1021796160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1021796160==--
