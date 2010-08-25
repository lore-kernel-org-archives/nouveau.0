From: Dragos Delcea <dragos.delcea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: shouldn't nouveau.ko depend on fbcon.ko?
Date: Wed, 25 Aug 2010 16:26:40 +0300
Message-ID: <AANLkTinqnf3qpSBhb6g7EtxVO3d+_BbcYfxXZJC9Ht9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0219889971=="
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

--===============0219889971==
Content-Type: multipart/alternative; boundary=0016364d1df3fb9a92048ea5d410

--0016364d1df3fb9a92048ea5d410
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I noticed that loading nouveau doesn't load fbcon automatically; and without
fbcon, when loading nouveau the console turns blank. I spent a few good
hours until I was able to figure out that I had to manually modprobe fbcon
to get the console back after loading nouveau.
This is happening on a vanilla 2.6.35.3; shouldn't there be dependencies in
place between modules?

Note that I haven't got to the xorg part just yet, I'm currently installing
gentoo.

thanks,
Dragos

PS please include me in the reply as I'm not subscribed.

--0016364d1df3fb9a92048ea5d410
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>I noticed that loading nouveau doesn&#39;t load fbco=
n automatically; and without fbcon, when loading nouveau the console turns =
blank. I spent a few good hours until I was able to figure out that I had t=
o manually modprobe fbcon to get the console back after loading nouveau.</d=
iv>
<div>This is happening on a vanilla 2.6.35.3; shouldn&#39;t there be depend=
encies in place between modules?</div><div><br></div><div>Note that I haven=
&#39;t got to the xorg part just yet, I&#39;m currently installing gentoo.<=
/div>
<div><br></div><div>thanks,</div><div>Dragos</div><div><br></div><div>PS pl=
ease include me in the reply as I&#39;m not subscribed.</div>

--0016364d1df3fb9a92048ea5d410--

--===============0219889971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0219889971==--
