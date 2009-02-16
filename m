From: aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Mon, 16 Feb 2009 23:22:38 +0300
Message-ID: <4999CB0E.1090505@gmail.com>
References: <49959366.2000805@gmail.com>	
	<6a89f9d50902131507h23cf0b50h62c887502d028073@mail.gmail.com>	
	<49968B05.4090701@gmail.com>	
	<6a89f9d50902140232h4b262deby85e7b437067fbc99@mail.gmail.com>	
	<21d7e9970902142118u50a56366u2efa5fe0d8aadd72@mail.gmail.com>	
	<49996AD8.2010602@gmail.com>
	<586c2acd0902160759u535b18dfsb5554f5a2d1a3d21@mail.gmail.com>
	<4999BC41.2060200@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0151017986=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4999BC41.2060200-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============0151017986==
Content-Type: multipart/alternative;
 boundary="------------070207080901020905020800"

This is a multi-part message in MIME format.
--------------070207080901020905020800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

aik wrote:
> Younes Manton wrote:
>> On Mon, Feb 16, 2009 at 8:32 AM, aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>   
>>> Then, I made a try to move the card to domain #0. Having the BIOS source
>>> code, it was easy.
>>> But it keeps failing with the same error -
>>> (EE) NOUVEAU(0): wrong DRM version
>>> (EE) NOUVEAU(0): 1365:
>>>
>>> What does it mean?
>>> I'm also a little confused by a try loading something called "int10h"
>>> which does not exist in any form on my server.
>>>
>>>
>>> Linux Fedora 10, DRI/DRM has been taken from GIT less than week ago.
>>>     
>>
>> It means your DRM kernel module and X driver don't match. That is
>> strange, since it should fail to compile first I think. Somehow you
>> had the right DRM module at compile time but not at runtime? Try
>> getting the latest for both and recompiling.
>>
>>         /* temporary lock step versioning */
>> #if NOUVEAU_DRM_HEADER_PATCHLEVEL != 12
>> #error nouveau_drm.h does not match expected patchlevel, update libdrm.
>> #endif
>>         if (pNv->pKernelDRMVersion->version_patchlevel !=
>>                         NOUVEAU_DRM_HEADER_PATCHLEVEL) {
>>                 xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
>>                         "wrong DRM version\n");
>>                 return FALSE;
>>         }
>>
>>   
> I knew that I'm missing something essential :-) I forgot about xf86 
> driver... It does not compile:
>
> git clone git://anongit.freedesktop.org/git/nouveau/xf86-video-nouveau
> cd xf86-video-nouveau
> ./autogen.sh
> [...]
> checking whether gcc accepts -g... (cached) yes
> checking for gcc option to accept ISO C89... (cached) none needed
> checking dependency style of gcc... (cached) gcc3
> ./configure: line 20777: syntax error near unexpected token `RANDR,'
> ./configure: line 20777: `XORG_DRIVER_CHECK_EXT(RANDR, randrproto)'
>
>
I read 
http://nouveau.freedesktop.org/wiki/FAQ#head-6f41727cc579ed3d7f42d67328466e2acbda9fc4
But I don't have any aclocal in the system with XORG_DRIVER_CHECK_EXT.
All the "Common examples" from http://wiki.x.org/wiki/Development/git 
are also installed.

[root@localhost aclocal]# pwd
/opt/gfx-test/share/aclocal
[root@localhost aclocal]# ls -la
total 36
drwxr-xr-x 2 root root  4096 2009-02-16 14:58 .
drwxr-xr-x 3 root root  4096 2009-02-16 14:49 ..
-rw-r--r-- 1 root root 17793 2009-02-16 14:51 xorg-macros.m4
-rw-r--r-- 1 root root  5188 2009-02-16 14:58 xtrans.m4
[root@localhost aclocal]# grep XORG_DRIVER_CHECK_EXT *
[root@localhost aclocal]#

[root@localhost xf86-video-nouveau]# ./autogen.sh --prefix=/opt/gfx-test
autoreconf: Entering directory `.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal -I /opt/gfx-test/share/aclocal
autoreconf: configure.ac: tracing
[...]
checking whether gcc accepts -g... (cached) yes
checking for gcc option to accept ISO C89... (cached) none needed
checking dependency style of gcc... (cached) gcc3
./configure: line 20777: syntax error near unexpected token `RANDR,'
./configure: line 20777: `XORG_DRIVER_CHECK_EXT(RANDR, randrproto)'


--------------070207080901020905020800
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
aik wrote:
<blockquote cite="mid:4999BC41.2060200-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" type="cite">
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
Younes Manton wrote:
  <blockquote
 cite="mid:586c2acd0902160759u535b18dfsb5554f5a2d1a3d21-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org"
 type="cite">
    <pre wrap="">On Mon, Feb 16, 2009 at 8:32 AM, aik <a
 moz-do-not-send="true" class="moz-txt-link-rfc2396E"
 href="mailto:aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">&lt;aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org&gt;</a> wrote:
  </pre>
    <blockquote type="cite">
      <pre wrap="">Then, I made a try to move the card to domain #0. Having the BIOS source
code, it was easy.
But it keeps failing with the same error -
(EE) NOUVEAU(0): wrong DRM version
(EE) NOUVEAU(0): 1365:

What does it mean?
I'm also a little confused by a try loading something called "int10h"
which does not exist in any form on my server.


Linux Fedora 10, DRI/DRM has been taken from GIT less than week ago.
    </pre>
    </blockquote>
    <pre wrap=""><!---->
It means your DRM kernel module and X driver don't match. That is
strange, since it should fail to compile first I think. Somehow you
had the right DRM module at compile time but not at runtime? Try
getting the latest for both and recompiling.

        /* temporary lock step versioning */
#if NOUVEAU_DRM_HEADER_PATCHLEVEL != 12
#error nouveau_drm.h does not match expected patchlevel, update libdrm.
#endif
        if (pNv-&gt;pKernelDRMVersion-&gt;version_patchlevel !=
                        NOUVEAU_DRM_HEADER_PATCHLEVEL) {
                xf86DrvMsg(pScrn-&gt;scrnIndex, X_ERROR,
                        "wrong DRM version\n");
                return FALSE;
        }

  </pre>
  </blockquote>
I knew that I'm missing something essential :-) I forgot about xf86
driver... It does not compile:<br>
  <br>
git clone git://anongit.freedesktop.org/git/nouveau/xf86-video-nouveau<br>
cd xf86-video-nouveau<br>
./autogen.sh<br>
[...]<br>
checking whether gcc accepts -g... (cached) yes<br>
checking for gcc option to accept ISO C89... (cached) none needed<br>
checking dependency style of gcc... (cached) gcc3<br>
./configure: line 20777: syntax error near unexpected token `RANDR,'<br>
./configure: line 20777: `XORG_DRIVER_CHECK_EXT(RANDR, randrproto)'<br>
  <br>
  <br>
</blockquote>
I read
<a class="moz-txt-link-freetext" href="http://nouveau.freedesktop.org/wiki/FAQ#head-6f41727cc579ed3d7f42d67328466e2acbda9fc4">http://nouveau.freedesktop.org/wiki/FAQ#head-6f41727cc579ed3d7f42d67328466e2acbda9fc4</a><br>
But I don't have any aclocal in the system with XORG_DRIVER_CHECK_EXT.<br>
All the "Common examples" from <a class="moz-txt-link-freetext" href="http://wiki.x.org/wiki/Development/git">http://wiki.x.org/wiki/Development/git</a>
are also installed.<br>
<br>
[root@localhost aclocal]# pwd<br>
/opt/gfx-test/share/aclocal<br>
[root@localhost aclocal]# ls -la<br>
total 36<br>
drwxr-xr-x 2 root root&nbsp; 4096 2009-02-16 14:58 .<br>
drwxr-xr-x 3 root root&nbsp; 4096 2009-02-16 14:49 ..<br>
-rw-r--r-- 1 root root 17793 2009-02-16 14:51 xorg-macros.m4<br>
-rw-r--r-- 1 root root&nbsp; 5188 2009-02-16 14:58 xtrans.m4<br>
[root@localhost aclocal]# grep XORG_DRIVER_CHECK_EXT *<br>
[root@localhost aclocal]# <br>
<br>
[root@localhost xf86-video-nouveau]# ./autogen.sh --prefix=/opt/gfx-test<br>
autoreconf: Entering directory `.'<br>
autoreconf: configure.ac: not using Gettext<br>
autoreconf: running: aclocal -I /opt/gfx-test/share/aclocal <br>
autoreconf: configure.ac: tracing<br>
[...]<br>
checking whether gcc accepts -g... (cached) yes<br>
checking for gcc option to accept ISO C89... (cached) none needed<br>
checking dependency style of gcc... (cached) gcc3<br>
./configure: line 20777: syntax error near unexpected token `RANDR,'<br>
./configure: line 20777: `XORG_DRIVER_CHECK_EXT(RANDR, randrproto)'<br>
<br>
</body>
</html>

--------------070207080901020905020800--

--===============0151017986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0151017986==--
