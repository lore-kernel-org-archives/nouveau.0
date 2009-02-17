From: aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Tue, 17 Feb 2009 17:47:19 +0300
Message-ID: <499ACDF7.6050202@gmail.com>
References: <49959366.2000805@gmail.com>	
	<6a89f9d50902131507h23cf0b50h62c887502d028073@mail.gmail.com>	
	<49968B05.4090701@gmail.com>	
	<6a89f9d50902140232h4b262deby85e7b437067fbc99@mail.gmail.com>	
	<21d7e9970902142118u50a56366u2efa5fe0d8aadd72@mail.gmail.com>	
	<49996AD8.2010602@gmail.com>	
	<586c2acd0902160759u535b18dfsb5554f5a2d1a3d21@mail.gmail.com>	
	<4999BC41.2060200@gmail.com> <4999CB0E.1090505@gmail.com>
	<586c2acd0902170527u509cc3c8r63ddd372aac1e545@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd0902170527u509cc3c8r63ddd372aac1e545-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Younes Manton wrote:
> You need various X dev packages installed... you are missing something
> related to randr. I install xserver-xorg-dev, x11proto-randr-dev, etc
> for example on Ubuntu and that usually solves my problems. Try finding
> randr related dev packages for Fedora.
>
>   
Found, installed. Fails different now. As I understand, it builds the 
"intel" lib only.

--------------------------

[root@localhost xf86-video-nouveau]# ./autogen.sh --prefix=/opt/gfx-test
[...]
checking pkg-config is at least version 0.9.0... yes
checking for LIBDRM_NOUVEAU... configure: error: Package requirements 
(libdrm_nouveau) were not met:

No package 'libdrm_nouveau' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables LIBDRM_NOUVEAU_CFLAGS
and LIBDRM_NOUVEAU_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

---------------------------

I'm trying to follow directions from 
http://wiki.x.org/wiki/Development/git as hard as I can but to no avail...

[root@localhost drm]# echo $PKG_CONFIG_PATH
/opt/gfx-test/lib/pkgconfig
[root@localhost drm]# echo $ACLOCAL
aclocal -I /opt/gfx-test/share/aclocal
[root@localhost drm]# ls -la /opt/gfx-test/lib/*.so
lrwxrwxrwx 1 root root 21 2009-02-17 09:42 
/opt/gfx-test/lib/libdrm_intel.so -> libdrm_intel.so.1.0.0
lrwxrwxrwx 1 root root 15 2009-02-17 09:42 /opt/gfx-test/lib/libdrm.so 
-> libdrm.so.2.4.0
lrwxrwxrwx 1 root root 22 2009-02-16 15:04 
/opt/gfx-test/lib/libpciaccess.so -> libpciaccess.so.0.10.2
lrwxrwxrwx 1 root root 21 2009-02-16 15:09 
/opt/gfx-test/lib/libpixman-1.so -> libpixman-1.so.0.15.1
