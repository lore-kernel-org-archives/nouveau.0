From: Douglas Kaynor <dbkaynor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Problem with nouveau
Date: Thu, 28 Apr 2011 10:44:12 -0700
Message-ID: <BANLkTik+2VCjCuz_OQLb0q05Hoia=7j9QQ@mail.gmail.com>
Reply-To: doug-Z6oFFtodYqOsTnJN9+BGXg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0056829335=="
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

--===============0056829335==
Content-Type: multipart/alternative; boundary=0050450145f6f693e904a1fe1ae9

--0050450145f6f693e904a1fe1ae9
Content-Type: text/plain; charset=ISO-8859-1

I have a issue in nv50_crtc.c. My system constantly spits out messages "No
native mode, forcing panel scaling"

The message is output to the screen and to the kernel ring buffer at a rate
of about one every 5 seconds. I commented out line 203 and rebuilt the
kernel so that the system was usable. It now flickers every 5 seconds but is
usable.

Red Hat 6.0 or Suse 11.0 with kernel 2.6.38.4
nVidia G92 (GeForce GTS 250).

If more info is needed please ask.

-- 
Douglas B Kaynor
doug-Z6oFFtodYqOsTnJN9+BGXg@public.gmane.org

--0050450145f6f693e904a1fe1ae9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"border-collapse: collapse; font-f=
amily: arial, sans-serif; font-size: 13px; ">I have a issue in nv50_crtc.c.=
 My system=A0constantly=A0spits out messages &quot;No native mode, forcing =
panel scaling&quot;<div>
<br></div><div>The message is output to the screen and to the kernel ring b=
uffer at a rate of about one every 5 seconds. I commented out line 203 and =
rebuilt the kernel so that the system was usable. It now flickers every 5 s=
econds but is usable.</div>
<div><br></div><div>Red Hat 6.0 or Suse 11.0 with=A0kernel 2.6.38.4</div><d=
iv>nVidia G92 (GeForce GTS 250).</div><div><br></div><div>If more info is n=
eeded please ask.<br clear=3D"all"></div></span><br>-- <br>Douglas B Kaynor=
<br>
<a href=3D"mailto:doug-Z6oFFtodYqOsTnJN9+BGXg@public.gmane.org">doug-Z6oFFtodYqOsTnJN9+BGXg@public.gmane.org</a><br>

--0050450145f6f693e904a1fe1ae9--

--===============0056829335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0056829335==--
