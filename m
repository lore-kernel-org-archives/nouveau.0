From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38074] [NV96] Dual head doesn't work for some
 combination of monitors (second screen still off)
Date: Tue, 27 Aug 2013 17:58:41 +0000
Message-ID: <bug-38074-8800-PlzmEmV8DY@http.bugs.freedesktop.org/>
References: <bug-38074-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0897816620=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38074-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0897816620==
Content-Type: multipart/alternative; boundary="1377626321.5F3eC2.30913"; charset="us-ascii"


--1377626321.5F3eC2.30913
Date: Tue, 27 Aug 2013 17:58:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D38074

--- Comment #21 from Jarom=C3=ADr C=C3=A1p=C3=ADk <jcapik-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> ---
(In reply to comment #20)
> Please attach a fresh dmesg. Also, is the problem the same as before --
> using a 1280x1024 resolution on the second head works? What happens if you
> use 1920x1080? Does it just go into "sleep" mode or what?

Hi Ilia.

It's a bit frustrating to still collect logs when nobody tried to look at t=
he
issue yet. The previous set of logs was pretty detailed and I also found
differences in the register values. Unfortunately, the same debug parameters
don't work with the latest kernel and I need new parameters in order to pro=
vide
you with useful data.

Maybe you had no time to read all the comments. We found, that it has nothi=
ng
to do with the resolution. The problem lies in the digital part of the DVI-=
I-2
output. Whilst the analog pins of the DVI-I-2 output work like expected, the
digital pins are off (black screen and blinking LED on the second monitor).
That means I can use the second display only when it is connected with an
analog cable via DVI->DSUB adapter inserted in the DVI-I-2 port.

Anyway, I'll attach my current dmesg output with no additional debug
information shortly (collected while having the second display connected via
the DVI->DSUB adapter).

Please, let me know about the next steps. It would be nice if someone could
finally find some time to look at the register differences (attached to this
report).

Thanks in advance.

Regards,
Jaromir.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1377626321.5F3eC2.30913
Date: Tue, 27 Aug 2013 17:58:41 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED --- - [NV96] Dual head doesn't work for some combinati=
on of monitors (second screen still off)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D38074#c21">Commen=
t # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED --- - [NV96] Dual head doesn't work for some combinati=
on of monitors (second screen still off)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D38074">bug 38074<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jcapik&#64;redhat.com" title=3D"Jarom=C3=ADr C=C3=A1p=C3=ADk &lt;jcapik&#64=
;redhat.com&gt;"> <span class=3D"fn">Jarom=C3=ADr C=C3=A1p=C3=ADk</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D38074#c20">comment #=
20</a>)
<span class=3D"quote">&gt; Please attach a fresh dmesg. Also, is the proble=
m the same as before --
&gt; using a 1280x1024 resolution on the second head works? What happens if=
 you
&gt; use 1920x1080? Does it just go into &quot;sleep&quot; mode or what?</s=
pan >

Hi Ilia.

It's a bit frustrating to still collect logs when nobody tried to look at t=
he
issue yet. The previous set of logs was pretty detailed and I also found
differences in the register values. Unfortunately, the same debug parameters
don't work with the latest kernel and I need new parameters in order to pro=
vide
you with useful data.

Maybe you had no time to read all the comments. We found, that it has nothi=
ng
to do with the resolution. The problem lies in the digital part of the DVI-=
I-2
output. Whilst the analog pins of the DVI-I-2 output work like expected, the
digital pins are off (black screen and blinking LED on the second monitor).
That means I can use the second display only when it is connected with an
analog cable via DVI-&gt;DSUB adapter inserted in the DVI-I-2 port.

Anyway, I'll attach my current dmesg output with no additional debug
information shortly (collected while having the second display connected via
the DVI-&gt;DSUB adapter).

Please, let me know about the next steps. It would be nice if someone could
finally find some time to look at the register differences (attached to this
report).

Thanks in advance.

Regards,
Jaromir.</pre>
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

--1377626321.5F3eC2.30913--

--===============0897816620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0897816620==--
