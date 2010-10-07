From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: OT: compilation
Date: Thu, 7 Oct 2010 22:50:09 +0200
Message-ID: <AANLkTi=HO9rxCTOXdhagYm7WB-pF73C8_eipMCrYeGOG@mail.gmail.com>
References: <4CAE2A1B.1000105@pfu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CAE2A1B.1000105-t9zbU3WrWHI@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Grzesiek_S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

2010/10/7 Grzesiek S=F3jka <pld-t9zbU3WrWHI@public.gmane.org>:
> I have two problems with the kernel compilation.
>
> 1. I have a small rootfs. It is too small to put all the modules there
> without gzipping it first. So installing it requires lots of sweating. Th=
at
> is why I was wondering if there is a (more/less easy) way to make the "ma=
ke
> modules_install" command gzip the modules "on the fly".
>

No idea if you can do that but here are some possible alternatives :
1) increase the size of your rootfs
2) remove modules you don't need and change from modules to builtin
for features or drivers that you don't need to unload/reload
3) a quick googling showed me this patch :
http://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg271865.html
However it seems to install first then compress so if that's the case,
you will need to adapt it to your need
4) set INSTALL_MOD_PATH to a prefix , compress modules , then move to
/lib/modules/


LOCALVERSION_AUTO is found in :
make menuconfig
General Setup
Automatically append version information to the version string
