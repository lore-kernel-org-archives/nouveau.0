From: Grant <emailgrant-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau won't load with GeForce 6150SE nForce 430
	(NV40)
Date: Mon, 28 Feb 2011 16:20:59 -0800
Message-ID: <AANLkTikXmJ5HqM+uvtY31RFZ=E2D4xaWr7dwnjKwhxVn@mail.gmail.com>
References: <AANLkTim9QZxKmNwux38ggsp1Y22vzHCja1gV-F2QhsOZ@mail.gmail.com>
	<AANLkTik+NDg8JZoY+oM1mhCyevev3GmLKdnxtwE39yeR@mail.gmail.com>
	<AANLkTikBEFZWJ372gha1mmnMeXk2+nOP+CKvC_891bYX@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTikBEFZWJ372gha1mmnMeXk2+nOP+CKvC_891bYX-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

>>> I can't seem to get nouveau to load with my onboard GeForce 6150SE
>>> nForce 430 which I believe is an NV40 chip. =A0I enabled DRM and
>>> DRM_NOUVEAU in the kernel but lspci -v doesn't show any kernel driver
>>> in use and Xorg fails to load the module. =A0It does work with the
>>> nvidia driver. =A0I'm using Gentoo.
>>>
>>> Should nouveau work with my card? =A0If so, any idea what I did wrong?
>>>
>>
>> Please attach a =A0full dmesg.
>
> I switched everything over to nvidia, then back to nouveau, and lspci
> -v does show the nouveau kernel module in use but X doesn't start
> properly. =A0The workstation is remote to me and the report I received
> upon starting X was that the screen image was "scrambled" and
> completely unrecognizable. =A0I've attached a full dmesg and Xorg.0.log.
>
> - Grant

Any idea on this?  Do you need more info?

- Grant
