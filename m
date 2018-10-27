From: Christopher Patti <feoh-3tY7U/2Y5hI@public.gmane.org>
Subject: Linux 4.19 slowdown / crash - nouveau - Ubuntu 18.10 /
 Alienware 17 R5
Date: Sat, 27 Oct 2018 18:41:12 -0400
Message-ID: <F18C6233-6AF5-4C70-9D80-C52B8A373AE0@feoh.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2057447758=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2057447758==
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
	boundary=Apple-Mail-C47746ED-D2CF-46D4-AEF9-A1A8D4E77D24


--Apple-Mail-C47746ED-D2CF-46D4-AEF9-A1A8D4E77D24
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi all. I've reported a bug over at the Ubuntu bug tracker: https://bugs.lau=
nchpad.net/ubuntu/+source/linux/+bug/1799180

Given the logs in kern.log it certainly looks like the nouveau driver is the=
 culprit. The system becomes incredibly slow ultimately becoming unusable, a=
nd the fan screams.

Full details including driver / kernel version and full kernel log over at t=
he bug, but I see a bunch of:

Oct 27 17:01:44 yamato kernel: [  402.710539] nouveau 0000:01:00.0: DRM: bas=
e-0: timeout

in the kernel log as the system slows down.

I'd love to assist in solving this problem. However I'm not a driver develop=
er but I know C, can build kernels and follow directions really well :)

Also if there are any work arounds I'd love to hear them. I need to run the 4=
.19 kernel since my laptop crashes on sleep with prior versions.

Thanks in advance and apologies if this is an inappropriate venue for this q=
uestion.

-Chris


--Apple-Mail-C47746ED-D2CF-46D4-AEF9-A1A8D4E77D24
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head><meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body dir="auto"><div dir="ltr"><span></span></div><div dir="ltr">


<title></title>
<style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style>

<div>Hi all. I've reported a bug over at the Ubuntu bug tracker: <a href="https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1799180">https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1799180</a><br></div>
<div><br></div>
<div>Given the logs in kern.log it certainly looks like the nouveau driver is the culprit. The system becomes incredibly slow ultimately becoming unusable, and the fan screams.<br></div>
<div><br></div>
<div>Full details including driver / kernel version and full kernel log over at the bug, but I see a bunch of:<br></div>
<div><br></div>
<div>Oct 27 17:01:44 yamato kernel: [&nbsp; 402.710539] nouveau 0000:01:00.0: DRM: base-0: timeout<br></div>
<div><br></div>
<div>in the kernel log as the system slows down.<br></div>
<div><br></div>
<div>I'd love to assist in solving this problem. However I'm not a driver developer but I know C, can build kernels and follow directions really well :)<br></div>
<div><br></div>
<div>Also if there are any work arounds I'd love to hear them. I need to run the 4.19 kernel since my laptop crashes on sleep with prior versions.<br></div>
<div><br></div>
<div>Thanks in advance and apologies if this is an inappropriate venue for this question.<br></div>
<div><br></div>
<div>-Chris<br></div>
<div><br></div>


</div></body></html>
--Apple-Mail-C47746ED-D2CF-46D4-AEF9-A1A8D4E77D24--

--===============2057447758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2057447758==--
