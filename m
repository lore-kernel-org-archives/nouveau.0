From: fbs 777 <fbs777-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: disable EDID for arcade monitor?
Date: Sun, 25 Mar 2012 15:54:20 -0300
Message-ID: <CAPET_G_qFDahfUmoK5hhiNvZBcnRntP_r0s4-pmHjE72h6J-yQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0180040012=="
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

--===============0180040012==
Content-Type: multipart/alternative; boundary=20cf303b429f170ed104bc15c9b9

--20cf303b429f170ed104bc15c9b9
Content-Type: text/plain; charset=ISO-8859-1

I cant make the nouveau work with an arcade monitor, problably because the
EDID.
I can make modeline work fine to reduce the horizontal to 15khz, tested in
a normal pc monitor (with ugly visual because the 15khz in horizontal).
But when i try in the arcade monitor, dont show any image after xorg start.

In official nvidia driver has an option NOEDID to force the driver to
ignore information from monitor, so no matter what type of monitor is, only
matter what is in the modeline.

But in nouveau driver i cant find how to disable the EDID...

Using the ubuntu 11.10

--20cf303b429f170ed104bc15c9b9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I cant make the nouveau work with an arcade monitor, problably because the =
EDID.=A0<div>I can make modeline work fine to reduce the horizontal to 15kh=
z, tested in a normal pc monitor (with ugly visual because the 15khz in hor=
izontal).</div>
<div>But when i try in the arcade monitor, dont show any image after xorg s=
tart.</div><div><br></div><div>In official nvidia driver has an option NOED=
ID to force the driver to ignore information from monitor, so no matter wha=
t type of monitor is, only matter what is in the modeline.</div>
<div><br></div><div>But in nouveau driver i cant find how to disable the ED=
ID...</div><div><br></div><div>Using the ubuntu 11.10</div>

--20cf303b429f170ed104bc15c9b9--

--===============0180040012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0180040012==--
