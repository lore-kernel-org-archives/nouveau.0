From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Fri, 04 Jan 2013 10:17:46 +0000
Message-ID: <bug-50121-8800-CjXF6ODrld@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0378938380=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0378938380==
Content-Type: multipart/alternative; boundary="1357294666.8edB64.8911"; charset="us-ascii"


--1357294666.8edB64.8911
Date: Fri, 4 Jan 2013 10:17:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D50121

--- Comment #45 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #30)
> @Rapha=C3=ABl Droz: What kernel version are you using? And maybe the kern=
el
> version from Mr-4 might be useful as well. Just to confirm.
Apologies for this late reply, but since I first started experiencing these
problems, and with no end in sight, I just got a bit fed up with it and was
forced to downgrade my kernel - I am sticking with 3.3.x as it seems very
stable as far as the nouveau suspend/resume problems go: I am getting an
occasional "blip" (resume failure) about once every 15-20 suspend/resume
cycles, which to me is as good and as manageable as it could be expected, g=
iven
what I experienced with kernels 3.4, 3.5 and 3.6.

I am currently waiting for 3.7 to become mainstream for my distro (I am usi=
ng
Fedora) so that I could give it a go, but I don't hold my breath to be hone=
st.

Just FYI: the problems I have experienced with kernels 3.4 - 3.6 have been =
the
same as explained by a few others on here - every second suspend/resume cyc=
le
is a complete and utter failure, without exception. It's like a clockwork.

I haven't applied the patch in Comment#37, but will do as soon as 3.7 becom=
es
"mainstream" in my distro and will post the results on here.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1357294666.8edB64.8911
Date: Fri, 4 Jan 2013 10:17:46 +0000
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
   title=3D"NEW --- - [Regression] Since kernel v3.5 several cards fail to =
resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D50121#c45">Commen=
t # 45</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [Regression] Since kernel v3.5 several cards fail to =
resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D50121">bug 50121<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mr.dash.four&#64;googlemail.com" title=3D"Mr-4 &lt;mr.dash.four&#64;googlem=
ail.com&gt;"> <span class=3D"fn">Mr-4</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D50121#c30">comment #=
30</a>)
<span class=3D"quote">&gt; &#64;Rapha=C3=ABl Droz: What kernel version are =
you using? And maybe the kernel
&gt; version from Mr-4 might be useful as well. Just to confirm.</span >
Apologies for this late reply, but since I first started experiencing these
problems, and with no end in sight, I just got a bit fed up with it and was
forced to downgrade my kernel - I am sticking with 3.3.x as it seems very
stable as far as the nouveau suspend/resume problems go: I am getting an
occasional &quot;blip&quot; (resume failure) about once every 15-20 suspend=
/resume
cycles, which to me is as good and as manageable as it could be expected, g=
iven
what I experienced with kernels 3.4, 3.5 and 3.6.

I am currently waiting for 3.7 to become mainstream for my distro (I am usi=
ng
Fedora) so that I could give it a go, but I don't hold my breath to be hone=
st.

Just FYI: the problems I have experienced with kernels 3.4 - 3.6 have been =
the
same as explained by a few others on here - every second suspend/resume cyc=
le
is a complete and utter failure, without exception. It's like a clockwork.

I haven't applied the patch in <a href=3D"show_bug.cgi?id=3D50121#c37">Comm=
ent#37</a>, but will do as soon as 3.7 becomes
&quot;mainstream&quot; in my distro and will post the results on here.</pre>
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

--1357294666.8edB64.8911--

--===============0378938380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0378938380==--
