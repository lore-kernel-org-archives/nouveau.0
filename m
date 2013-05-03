From: Kai Wohlfahrt <kai.scorpio-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Hang on resume - PGRAPH TLB flush idle timeout fail
Date: Fri, 3 May 2013 12:03:10 +0100
Message-ID: <CAHYprEbkm9K11b75vpGd46VLLRVcyadeGVUQorc--ao7WfT_mA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0224067898=="
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

--===============0224067898==
Content-Type: multipart/alternative; boundary=001a11c2bcf0ec526804dbce4ba7

--001a11c2bcf0ec526804dbce4ba7
Content-Type: text/plain; charset=UTF-8

Hi all,

I have what I think is a nouveau-related bug, but don't have all the
information they as for on the support page, so thought I'd ask for help
here first. My computer will hang after resuming from hibernate/suspend,
sometimes showing a normal lock screen and other times just a white screen.

I have some extracts from /var/log/messages, but no kernel logs since I
cannot get anything working for dmesg (i.e. no VT switching works):
http://pastebin.com/uX2zGLae
http://pastebin.com/Pc2N9P6N

Some system info:
kernel: Linux version 3.7.10-gentoo (root@kai-laptop) (gcc version 4.6.3
(Gentoo 4.6.3 p1.11, pie-0.5.2) ) #2 SMP Thu Mar 21 18:47:39 GMT 2013
Xorg: X.Org X Server 1.13.4

Please let me know what I can do to get some further useful information so
I can file a proper bug report.

Thanks,
Kai

--001a11c2bcf0ec526804dbce4ba7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">Hi all,</span><div style=3D"font-family:arial,sans-serif;font-size:13px">=
<br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">I have=
 what I think is a nouveau-related bug, but don&#39;t have all the informat=
ion they as for on the support page, so thought I&#39;d ask for help here f=
irst. My computer will hang after resuming from hibernate/suspend, sometime=
s showing a normal lock screen and other times just a white screen.</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">I have some extracts f=
rom /var/log/messages, but no kernel logs since I cannot get anything worki=
ng for dmesg (i.e. no VT switching works):</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><a href=3D"http:=
//pastebin.com/uX2zGLae" target=3D"_blank">http://pastebin.com/uX2zGLae</a>=
<br></div><div style=3D"font-family:arial,sans-serif;font-size:13px"><a hre=
f=3D"http://pastebin.com/Pc2N9P6N" target=3D"_blank">http://pastebin.com/Pc=
2N9P6N</a><br>
</div><div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div>=
<div style=3D"font-family:arial,sans-serif;font-size:13px">Some system info=
:</div><div style=3D"font-family:arial,sans-serif;font-size:13px">kernel: L=
inux version 3.7.10-gentoo (root@kai-laptop) (gcc version 4.6.3 (Gentoo 4.6=
.3 p1.11, pie-0.5.2) ) #2 SMP Thu Mar 21 18:47:39 GMT 2013</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px">Xorg: X.Org X Se=
rver 1.13.4<br></div><div style=3D"font-family:arial,sans-serif;font-size:1=
3px"><br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">P=
lease let me know what I can do to get some further useful information so I=
 can file a proper bug report.</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">Thanks,</div><div styl=
e=3D"font-family:arial,sans-serif;font-size:13px">Kai</div></div>

--001a11c2bcf0ec526804dbce4ba7--

--===============0224067898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0224067898==--
