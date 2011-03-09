From: Donald Jenkins <dj.jankins-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Problem setting refresh rate on 8400GS
Date: Wed, 9 Mar 2011 12:38:55 +0700
Message-ID: <AANLkTinVNbeYDo_g=4EYVt0BJ=4Cf6SJ02dPmUvw860w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1608744069=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

--===============1608744069==
Content-Type: multipart/alternative; boundary=0016e6dee7290e74ca049e062515

--0016e6dee7290e74ca049e062515
Content-Type: text/plain; charset=ISO-8859-1

Hello.
Having serious problems with all nvidia boards plugged on my PC, now on
8400GS.
Xorg with 2D-only nouveau driver sets invalid preferred refresh rate 60hz on
SAMTRON 73v, when 75hz needed.
output of xrandr:

Screen 0: minimum 320 x 200, current 1280 x 1024, maximum 8192 x 8192
DVI-I-1 disconnected (normal left inverted right x axis y axis)
VGA-1 connected 1280x1024+0+0 (normal left inverted right x axis y axis)
338mm x 270mm
   1280x1024      60.0*+   75.0
   1152x864       75.0
   1024x768       75.1     70.1     60.0
   832x624        74.6
   800x600        72.2     75.0     60.3     56.2
   640x480        72.8     75.0     66.7     60.0
   720x400        70.1

I can *manually* set correct refresh rate using xrandr -r 75 command (for
example, in .xinitrc), but Xorg configuration don't recognize it at all.
Some full screen software games reset refresh rate back to 60hz.
How I can "hardcode" it in xorg.conf? I really stuck at this point.
Thanks.

--0016e6dee7290e74ca049e062515
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello.<br>Having serious problems with all nvidia boards plugged on my PC, =
now on 8400GS.<br>Xorg with 2D-only nouveau driver sets invalid preferred r=
efresh rate 60hz on SAMTRON 73v, when 75hz needed.<br>output of xrandr:<br>
<br>Screen 0: minimum 320 x 200, current 1280 x 1024, maximum 8192 x 8192<b=
r>DVI-I-1 disconnected (normal left inverted right x axis y axis)<br>VGA-1 =
connected 1280x1024+0+0 (normal left inverted right x axis y axis) 338mm x =
270mm<br>
=A0=A0 1280x1024=A0=A0=A0=A0=A0 60.0*+=A0=A0 75.0=A0 <br>=A0=A0 1152x864=A0=
=A0=A0=A0=A0=A0 75.0=A0 <br>=A0=A0 1024x768=A0=A0=A0=A0=A0=A0 75.1=A0=A0=A0=
=A0 70.1=A0=A0=A0=A0 60.0=A0 <br>=A0=A0 832x624=A0=A0=A0=A0=A0=A0=A0 74.6=
=A0 <br>=A0=A0 800x600=A0=A0=A0=A0=A0=A0=A0 72.2=A0=A0=A0=A0 75.0=A0=A0=A0=
=A0 60.3=A0=A0=A0=A0 56.2=A0 <br>=A0=A0 640x480=A0=A0=A0=A0=A0=A0=A0 72.8=
=A0=A0=A0=A0 75.0=A0=A0=A0=A0 66.7=A0=A0=A0=A0 60.0=A0 <br>
=A0=A0 720x400=A0=A0=A0=A0=A0=A0=A0 70.1<br><br>I can *manually* set correc=
t refresh rate using xrandr -r 75 command (for example, in .xinitrc), but X=
org configuration don&#39;t recognize it at all. Some full screen software =
games reset refresh rate back to 60hz.<br>
How I can &quot;hardcode&quot; it in xorg.conf? I really stuck at this poin=
t.<br>Thanks.<br>

--0016e6dee7290e74ca049e062515--

--===============1608744069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1608744069==--
