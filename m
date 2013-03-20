From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49148] nv20_state_fb.c:50: get_rt_format: Assertion
	`0' failed.
Date: Wed, 20 Mar 2013 18:47:37 +0000
Message-ID: <bug-49148-8800-eL1QMz2wC7@http.bugs.freedesktop.org/>
References: <bug-49148-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1887269195=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49148-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1887269195==
Content-Type: multipart/alternative; boundary="1363805257.8D0ade52.15522"; charset="us-ascii"


--1363805257.8D0ade52.15522
Date: Wed, 20 Mar 2013 18:47:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D49148

--- Comment #3 from Truckman Jones <joaogojunior-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> ---
I'm getting the following error under wine 1.5.26 "nv10_state_fb.c:50:
get_rt_format: Assertion `0' failed", trying to run
"http://ufpr.dl.sourceforge.net/project/criticalmass/Critical%20Mass/1.0.0/=
CriticalMass-Windows-1.0.0.zip"
and many other 3d apps. I'm running here nouveau 1.0.2 driver on Nvidia MX =
4000
hardware (slackware linux 14.0, with required experimental libdrm) and I was
able to run "http://web.media.mit.edu/~gordonw/OpenGL/simpleGLUT.zip" with =
hw
acceleration and no problems at all, I have applied this proposed patch aga=
inst
mesa 9.0.3 and succeeded with some offset, but unfortunatelly did have no
effect on my problem... I'm wondering if there is something missing on this
patch, like enabling some more modes available on this hardware? I'm looking
for a solution and willing to help testing any experimental patches... Than=
ks
in advance to you folks at freedesktop.org!=20
Ciao
Jo=C3=A3o.http://ufpr.dl.sourceforge.net/project/criticalmass/Critical%20Ma=
ss/1.0.0/CriticalMass-Windows-1.0.0.zip

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1363805257.8D0ade52.15522
Date: Wed, 20 Mar 2013 18:47:37 +0000
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
   title=3D"NEW --- - nv20_state_fb.c:50: get_rt_format: Assertion `0' fail=
ed."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D49148#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nv20_state_fb.c:50: get_rt_format: Assertion `0' fail=
ed."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D49148">bug 49148<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
joaogojunior&#64;hotmail.com" title=3D"Truckman Jones &lt;joaogojunior&#64;=
hotmail.com&gt;"> <span class=3D"fn">Truckman Jones</span></a>
</span></b>
        <pre>I'm getting the following error under wine 1.5.26 &quot;nv10_s=
tate_fb.c:50:
get_rt_format: Assertion `0' failed&quot;, trying to run
&quot;<a href=3D"http://ufpr.dl.sourceforge.net/project/criticalmass/Critic=
al%20Mass/1.0.0/CriticalMass-Windows-1.0.0.zip">http://ufpr.dl.sourceforge.=
net/project/criticalmass/Critical%20Mass/1.0.0/CriticalMass-Windows-1.0.0.z=
ip</a>&quot;
and many other 3d apps. I'm running here nouveau 1.0.2 driver on Nvidia MX =
4000
hardware (slackware linux 14.0, with required experimental libdrm) and I was
able to run &quot;<a href=3D"http://web.media.mit.edu/~gordonw/OpenGL/simpl=
eGLUT.zip">http://web.media.mit.edu/~gordonw/OpenGL/simpleGLUT.zip</a>&quot=
; with hw
acceleration and no problems at all, I have applied this proposed patch aga=
inst
mesa 9.0.3 and succeeded with some offset, but unfortunatelly did have no
effect on my problem... I'm wondering if there is something missing on this
patch, like enabling some more modes available on this hardware? I'm looking
for a solution and willing to help testing any experimental patches... Than=
ks
in advance to you folks at freedesktop.org!=20
Ciao
Jo=C3=A3o.<a href=3D"http://ufpr.dl.sourceforge.net/project/criticalmass/Cr=
itical%20Mass/1.0.0/CriticalMass-Windows-1.0.0.zip">http://ufpr.dl.sourcefo=
rge.net/project/criticalmass/Critical%20Mass/1.0.0/CriticalMass-Windows-1.0=
.0.zip</a></pre>
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

--1363805257.8D0ade52.15522--

--===============1887269195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1887269195==--
