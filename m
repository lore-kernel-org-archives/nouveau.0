From: Luiz Angelo Daros de Luca <luizluca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Strange behavior on kde4
Date: Wed, 15 Apr 2009 14:27:00 -0300
Message-ID: <8b96e3d20904151027s5fbe1f5do117e7a61114daec3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0747240241=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0747240241==
Content-Type: multipart/alternative; boundary=000e0cd6ad7e35e36d04679b4210

--000e0cd6ad7e35e36d04679b4210
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

I filled a bug in kde (4.2.2) for some drawing problems. However, as it
occurs also with virtualbox, I think this might be related to nouveau.
I use updated nouveau git + drm git without 3d. Alfter some time, plasma and
virtualbox, independently, stops to draw some parts randomly. For example,
when I pass the mouse over icons, they disapear and reapear.
If I kill plasma or vbox and open it again, it works for some time before
the same problem reocurs. This happens also with other kde aplications like
kterminal.

For plasma I got this error:


QPainter::end: Painter not active, aborted
QPainter::begin: Paint device returned engine == 0, type: 3
QPainter::setCompositionMode: Painter not active


I also reported this in:
https://bugs.kde.org/show_bug.cgi?id=189059

Does anyone has a clue where is the problem?

---
    Luiz Angelo Daros de Luca, Me.
           luizluca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--000e0cd6ad7e35e36d04679b4210
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<br><br>I filled a bug in kde (4.2.2) for some drawing problems. Howe=
ver, as it occurs also with virtualbox, I think this might be related to no=
uveau.<br>I use updated nouveau git + drm git without 3d. Alfter some time,=
 plasma and virtualbox, independently, stops to draw some parts randomly. F=
or example, when I pass the mouse over icons, they disapear and reapear.<br=
>

If I kill plasma or vbox and open it again, it works for some time before t=
he same problem reocurs. This happens also with other kde aplications like =
kterminal. <br><br>For plasma I got this error:<br><pre class=3D"bz_comment=
_text" id=3D"comment_text_0">

QPainter::end: Painter not active, aborted                                 =
     <br>QPainter::begin: Paint device returned engine =3D=3D 0, type: 3   =
                  <br>QPainter::setCompositionMode: Painter not active    <=
br>

</pre><br>I also reported this in: <br><a href=3D"https://bugs.kde.org/show=
_bug.cgi?id=3D189059">https://bugs.kde.org/show_bug.cgi?id=3D189059</a><br>=
<br>Does anyone has a clue where is the problem?<br><br clear=3D"all">---<b=
r> =A0 =A0 Luiz Angelo Daros de Luca, Me.<br>

 =A0 =A0 =A0 =A0 =A0 =A0<a href=3D"mailto:luizluca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">luizluca@gmai=
l.com</a><br>

--000e0cd6ad7e35e36d04679b4210--

--===============0747240241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0747240241==--
