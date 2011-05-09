From: Uri Moszkowicz <uri-webSqJVl7FcAvxtiuMwx3w@public.gmane.org>
Subject: Dual monitor support
Date: Mon, 9 May 2011 11:48:02 -0400
Message-ID: <BANLkTimf6PUohBOWkV-msJ=J-1YwSXUqcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1675563975=="
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

--===============1675563975==
Content-Type: multipart/alternative; boundary=00248c6a8466eb1d2e04a2d9c4f5

--00248c6a8466eb1d2e04a2d9c4f5
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I have an old Dell Precision 450 with an Nvidia Quadro nvs280 (lspci:
"01:00.0 VGA compatible controller: nVidia Corporation NV18GL [Quadro NVS
280 SD] (rev a2)") and am having trouble getting dual monitor support to
work. With Ubuntu 10 using the Nouveau driver the dual monitor setup would
work but the screens would gradually become corrupted. I upgraded to Ubuntu
11 and now when I enable dual monitor support the second screen becomes
completely garbled and the OS becomes unresponsive on the first. It doesn't
seem to make a difference whether I use Gnome or xranr. I tried editing
xorg.conf directly but no luck - when I go back to the login screen there is
a mouse cursor and it moves around but the background is different (maybe
zoomed in?) and there is nothing in the foreground to interact with (no
windows). Is there any advice that you can offer which might help me work
around this problem or should I just open a bug report and wait for the fix?
Looks like I'm using version 1:0.0.16+git20110107+b795ca6e-0ubuntu7.

Thanks,
Uri

--00248c6a8466eb1d2e04a2d9c4f5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<div>I have an old Dell Precision 450 with an Nvidia Quadro nvs280 (lspc=
i: &quot;01:00.0 VGA compatible controller: nVidia Corporation NV18GL [Quad=
ro NVS 280 SD] (rev a2)&quot;) and am having trouble getting dual monitor s=
upport to work. With Ubuntu 10 using the Nouveau driver the dual monitor se=
tup would work but the screens would gradually become corrupted. I upgraded=
 to Ubuntu 11 and now when I enable dual monitor support the second screen =
becomes completely garbled and the OS becomes unresponsive on the first. It=
 doesn&#39;t seem to make a difference whether I use Gnome or xranr. I trie=
d editing xorg.conf directly but no luck - when I go back to the login scre=
en there is a mouse cursor and it moves around but the background is differ=
ent (maybe zoomed in?) and there is nothing in the foreground to interact w=
ith (no windows). Is there any advice that you can offer which might help m=
e work around this problem or should I just open a bug report and wait for =
the fix? Looks like I&#39;m using version=A01:0.0.16+git20110107+b795ca6e-0=
ubuntu7.</div>

<div><br></div><div>Thanks,</div><div>Uri</div>

--00248c6a8466eb1d2e04a2d9c4f5--

--===============1675563975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1675563975==--
