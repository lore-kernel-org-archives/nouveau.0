From: Christopher Patti <feoh-3tY7U/2Y5hI@public.gmane.org>
Subject: Re: Linux 4.19 slowdown / crash - nouveau - Ubuntu 18.10
 / Alienware 17 R5
Date: Wed, 31 Oct 2018 18:46:28 -0400
Message-ID: <1541025988.3168290.1561559536.5BB8DC51@webmail.messagingengine.com>
References: <F18C6233-6AF5-4C70-9D80-C52B8A373AE0@feoh.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0779881829=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <F18C6233-6AF5-4C70-9D80-C52B8A373AE0-3tY7U/2Y5hI@public.gmane.org>
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

This is a multi-part message in MIME format.

--===============0779881829==
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative; boundary="_----------=_154102598831682900"

This is a multi-part message in MIME format.

--_----------=_154102598831682900
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

Interestingly (at least to me) I switched to i3wm and this hasn't
happened in days. Maybe something in Gnome tickles this bug? I should
try KDE just for the halibut and see if it recurs.
-Chris


On Sat, Oct 27, 2018, at 6:41 PM, Christopher Patti wrote:
> 
> Hi all. I've reported a bug over at the Ubuntu bug tracker:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1799180> 
> Given the logs in kern.log it certainly looks like the nouveau driver
> is the culprit. The system becomes incredibly slow ultimately becoming
> unusable, and the fan screams.> 
> Full details including driver / kernel version and full kernel log
> over at the bug, but I see a bunch of:> 
> Oct 27 17:01:44 yamato kernel: [  402.710539] nouveau 0000:01:00.0:
> DRM: base-0: timeout> 
> in the kernel log as the system slows down.
> 
> I'd love to assist in solving this problem. However I'm not a driver
> developer but I know C, can build kernels and follow directions
> really well :)> 
> Also if there are any work arounds I'd love to hear them. I need to
> run the 4.19 kernel since my laptop crashes on sleep with prior
> versions.> 
> Thanks in advance and apologies if this is an inappropriate venue for
> this question.> 
> -Chris
> 
> _________________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


--_----------=_154102598831682900
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="utf-8"

<!DOCTYPE html>
<html>
<head>
<title></title>
<style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style>
</head>
<body><div>Interestingly (at least to me) I switched to i3wm and this hasn't happened in days. Maybe something in Gnome tickles this bug? I should try KDE just for the halibut and see if it recurs.<br></div>
<div><br></div>
<div>-Chris<br></div>
<div><br></div>
<div><br></div>
<div>On Sat, Oct 27, 2018, at 6:41 PM, Christopher Patti wrote:<br></div>
<blockquote type="cite"><div dir="ltr"><span></span><br></div>
<div dir="ltr"><div>Hi all. I've reported a bug over at the Ubuntu bug tracker: <a href="https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1799180">https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1799180</a><br></div>
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
</div>
<div><u>_______________________________________________</u><br></div>
<div>Nouveau mailing list<br></div>
<div><a href="mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br></div>
<div><a href="https://lists.freedesktop.org/mailman/listinfo/nouveau">https://lists.freedesktop.org/mailman/listinfo/nouveau</a><br></div>
</blockquote><div><br></div>
</body>
</html>

--_----------=_154102598831682900--


--===============0779881829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0779881829==--
