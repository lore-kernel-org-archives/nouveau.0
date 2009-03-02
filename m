From: aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Mon, 02 Mar 2009 17:45:40 +0300
Message-ID: <49ABF114.1030504@gmail.com>
References: <49959366.2000805@gmail.com>	
	<6a89f9d50902131507h23cf0b50h62c887502d028073@mail.gmail.com>	
	<49968B05.4090701@gmail.com>	
	<6a89f9d50902140232h4b262deby85e7b437067fbc99@mail.gmail.com>	
	<21d7e9970902142118u50a56366u2efa5fe0d8aadd72@mail.gmail.com>	
	<49996AD8.2010602@gmail.com>
	<586c2acd0902160759u535b18dfsb5554f5a2d1a3d21@mail.gmail.com>
	<499AFA48.3070007@gmail.com> <49A3CD5A.1050905@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0770413442=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <49A3CD5A.1050905-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

This is a multi-part message in MIME format.
--===============0770413442==
Content-Type: multipart/alternative;
 boundary="------------020809000701050905060607"

This is a multi-part message in MIME format.
--------------020809000701050905060607
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Another try. Reconfigured DRM and xf86-video-nouveau modules with 
"./autogen.sh CFLAGS=-m64", recompiled, copied, run:

(II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so
dlopen: /usr/lib/xorg/modules/drivers//nouveau_drv.so: wrong ELF class: 
ELFCLASS64
(EE) Failed to load /usr/lib/xorg/modules/drivers//nouveau_drv.so
(II) UnloadModule: "nouveau"
(EE) Failed to load module "nouveau" (loader failed, 7)
(EE) No drivers available.


The question is - has anybody ever compiled AND run X.org + modules as 
64bit binaries for PPC64?


aik wrote:
> Have made a next try.
> The nouveau_drv.so compiles for PPC32 while I need PPC64. Is it able 
> to be compiled for PPC64?
> The autogen.sh output is below. When I've been trying to rebuild the 
> kernel, sizeof(void*) was 8, but for nouveau_drv.so it is 4 bytes As 
> my PCI BARs are behind 4GB, it is the problem.
>
> Any clues?
>
> [...]
>
>
> aik wrote:
>> So, with the help of the community, I've got all the binaries 
>> compiled and ready-to-run. But it crashes in the very beginning. So 
>> the question is - what does nouveau expect from the system BIOS to 
>> get started (if it does)? I'm asking because I know for sure that the 
>> BIOS I have does support video very limited and I'm not sure that the 
>> support implemented at the moment is enough to get X.org up.
>>
>> Also, I've heard an opinion that X.org cannot work with the cards 
>> mapped behind 4GB range. My server maps all the PCI devices there 
>> (see the lspci output). Can anybody comment on that?
>>
>>
>



--------------020809000701050905060607
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
<div class="moz-text-flowed"
 style="font-family: -moz-fixed; font-size: 13px;" lang="x-western">Another
try. Reconfigured DRM and xf86-video-nouveau modules with "./autogen.sh
CFLAGS=-m64", recompiled, copied, run:
<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so
<br>
dlopen: /usr/lib/xorg/modules/drivers//nouveau_drv.so: wrong ELF class:
ELFCLASS64
<br>
(EE) Failed to load /usr/lib/xorg/modules/drivers//nouveau_drv.so
<br>
(II) UnloadModule: "nouveau"
<br>
(EE) Failed to load module "nouveau" (loader failed, 7)
<br>
(EE) No drivers available.
<br>
<br>
<br>
The question is - has anybody ever compiled AND run X.org + modules as
64bit binaries for PPC64?
<br>
<br>
<br>
aik wrote:
<br>
<blockquote type="cite">Have made a next try.
  <br>
The nouveau_drv.so compiles for PPC32 while I need PPC64. Is it able to
be compiled for PPC64?
  <br>
The autogen.sh output is below. When I've been trying to rebuild the
kernel, sizeof(void*) was 8, but for nouveau_drv.so it is 4 bytes As my
PCI BARs are behind 4GB, it is the problem.
  <br>
  <br>
Any clues?
  <br>
  <br>
[...]
  <br>
  <br>
  <br>
aik wrote:
  <br>
  <blockquote type="cite">So, with the help of the community, I've got
all the binaries compiled and ready-to-run. But it crashes in the very
beginning. So the question is - what does nouveau expect from the
system BIOS to get started (if it does)? I'm asking because I know for
sure that the BIOS I have does support video very limited and I'm not
sure that the support implemented at the moment is enough to get X.org
up.
    <br>
    <br>
Also, I've heard an opinion that X.org cannot work with the cards
mapped behind 4GB range. My server maps all the PCI devices there (see
the lspci output). Can anybody comment on that?
    <br>
    <br>
    <br>
  </blockquote>
  <br>
</blockquote>
<br>
<br>
</div>
</body>
</html>

--------------020809000701050905060607--

--===============0770413442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0770413442==--
