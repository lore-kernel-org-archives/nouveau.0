From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] nouveau: NV4E acceleration corruption when
 DMA above 31-bit (2 Gig barrier)
Date: Mon, 29 Oct 2012 14:26:03 +0000
Message-ID: <bug-46557-8800-CDsFgVnWVP@http.bugs.freedesktop.org/>
References: <bug-46557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0827214350=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-46557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0827214350==
Content-Type: multipart/alternative; boundary="1351520763.4AE2D4.24182"; charset="us-ascii"


--1351520763.4AE2D4.24182
Date: Mon, 29 Oct 2012 14:26:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D46557

--- Comment #25 from Rapha=C3=ABl Droz <gibboris-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 69231
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D69231&action=3Dedit
dmesg|egrep -i 'drm|agp|fb'

I regularly encounter a similar trace as in the first attachment (attachment
57574) since I went from 1.5G RAM to 4G RAM using an NV34 [GeForce FX 5200].
(linux 3.6.0, xf86-video-nouveau 1.0.2)
It happens almost every day, by the end of the day, always during (basic)
graphical operation (eg: open a PDF viewer)

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1351520763.4AE2D4.24182
Date: Mon, 29 Oct 2012 14:26:03 +0000
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
   title=3D"NEW --- - nouveau: NV4E acceleration corruption when DMA above =
31-bit (2 Gig barrier)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D46557#c25">Commen=
t # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau: NV4E acceleration corruption when DMA above =
31-bit (2 Gig barrier)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D46557">bug 46557<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gibboris&#64;gmail.com" title=3D"Rapha=C3=ABl Droz &lt;gibboris&#64;gmail.c=
om&gt;"> <span class=3D"fn">Rapha=C3=ABl Droz</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D69231"=
 name=3D"attach_69231" title=3D"dmesg|egrep -i 'drm|agp|fb'">attachment 692=
31</a> <a href=3D"attachment.cgi?id=3D69231&amp;action=3Dedit" title=3D"dme=
sg|egrep -i 'drm|agp|fb'">[details]</a></span>
dmesg|egrep -i 'drm|agp|fb'

I regularly encounter a similar trace as in the first attachment (<span cla=
ss=3D"bz_obsolete"><a href=3D"attachment.cgi?id=3D57574" name=3D"attach_575=
74" title=3D"live dmesg before X was started">attachment
57574</a> <a href=3D"attachment.cgi?id=3D57574&amp;action=3Dedit" title=3D"=
live dmesg before X was started">[details]</a></span>) since I went from 1.=
5G RAM to 4G RAM using an NV34 [GeForce FX 5200].
(linux 3.6.0, xf86-video-nouveau 1.0.2)
It happens almost every day, by the end of the day, always during (basic)
graphical operation (eg: open a PDF viewer)</pre>
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

--1351520763.4AE2D4.24182--

--===============0827214350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0827214350==--
