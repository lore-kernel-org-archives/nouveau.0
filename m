From: Piotr Hosowicz <piotr-aAmyfUXO971Wk0Htik3J/w@public.gmane.org>
Subject: Re: Problems with the driver
Date: Sun, 26 Sep 2010 17:29:46 +0200
Message-ID: <4C9F66EA.3010307@example.com>
References: <4C9F54F2.1010108@example.com> <20100926151055.GA3284@joi.lan>
Reply-To: piotr-aAmyfUXO971Wk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100926151055.GA3284-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 26.09.2010 17:10, Marcin Slusarz wrote:
> On Sun, Sep 26, 2010 at 04:13:06PM +0200, Piotr Hosowicz wrote:
>> Hello,
>>
>> I can build the driver, it loads, but it does not work. Please find
>> attached my local data, sorry for the form, I made it a few days ago and
>> would have to build a new kernel which would also not work. My card is
>> 01:00.0 VGA compatible controller: nVidia Corporation G96 [GeForce 9400
>> GT] (rev a1). The things stay the same, never mind how I try.
>>
>
> You have 0.0.16 nouveau kernel module, but 0.0.15 libdrm/xf86-video-nouve=
au.
> This is probably your main problem. Upgrade libdrm and xf86-video-nouveau.

Ok, I'll try it.

> Note, you didn't uninstall NVIDIA proprietary driver (Module glx:
> endor=3D"NVIDIA Corporation" in xorg.log) which might crash X if wrong
> version of some component is installed (don't remember which one, just
> uninstall nvidia drivers)

Now I did, wish me luck.

> If you resolve these issues and still have problem, simplify your xorg.co=
nf
> to contain only:
>
> Section "Device"
> Identifier "n"
> Driver "nouveau"
> EndSection

Yes, I reduced it already.

> Almost all above is documented on wiki: http://nouveau.freedesktop.org/wi=
ki/TroubleShooting

Thanks, I read a bit and it seems that it won't be so simple.

-- =

"Bardzo fajna firma, tylko czasami nie p=B3aci. Do jej g=B3=F3wnych
zalet nale=BF=B1: ekspres ci=B6nieniowy (ale tylko na jednym z pi=EA-
ter) oraz fajne widoki z salki konferencyjnej. No i jakie=B6
p=F3=B3 roku temu odesz=B3o 90% pracownik=F3w dzia=B3u IT, ale mo=BFe nie
mieli racji ;)"
NP:  -
NB: 2.6.36-rc5-git7
