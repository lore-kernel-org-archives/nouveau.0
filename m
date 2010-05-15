From: Grant <emailgrant-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: VDPAU & 8400GS support?
Date: Sat, 15 May 2010 09:34:03 -0700
Message-ID: <AANLkTilwEr2piGFFRt6z8a8mnqMP01gwjmXV0b_u8ZqG@mail.gmail.com>
References: <AANLkTiliVTt8Kmno2lEr_t-Uc0WxNdYbTk3Ws4a3-5JQ@mail.gmail.com>
	<AANLkTik5gLzFPKd37aae6vZA8xk8UY9Jf4F64tK8Xvfc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTik5gLzFPKd37aae6vZA8xk8UY9Jf4F64tK8Xvfc-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

>> I've been using the proprietary Nvidia driver and I just found out
>> about Nouveau. =A0Does it support VDPAU or are there plans to implement
>> it? =A0Does it support the 8400GS card?
>>
>
> VDPAU is not supported.
>
> From what I've seen on IRC, it seems like a big mess, with each card
> family having (several?) different video decode engine.
> The only work I know about is an initial support for mpeg2 decode
> engine on nv40 :
> http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=3Dnvfx-vpe&id=3D5=
38d6ef8aac1cd861f6336e24e79a315fe58aba0
> And afaik, the other engines are mostly unknown (no RE and no code).
>
> Some of these details could be wrong, in that case hopefully someone
> can correct me :)
>
> About 8400GS, I suppose it's supported as well as any nv50 card, so
> look at the nv50 column to see what to expect :
> http://nouveau.freedesktop.org/wiki/FeatureMatrix
>
>
> Below the main IRC discussion I read about video engines.
>
[SNIP]
> 23:04 < calim> mwk: yes; and my CPU says it doesn't need all this
[SNIP]

Has anyone been able to reliably decode 1080p in software?  It always
ends up getting choppy and out of sync for me unless I use VDPAU.

- Grant
