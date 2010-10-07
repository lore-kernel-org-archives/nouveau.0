From: =?ISO-8859-2?Q?Grzesiek_S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Thu, 07 Oct 2010 20:47:18 +0200
Message-ID: <4CAE15B6.6080507@pfu.pl>
References: <4C9E0167.8000507@pfu.pl>	<20100928004117.0a0ae0ca@daedalus.pq.iki.fi>
	<4CA1C6C0.1000709@pfu.pl>	<20100928170227.00665f76@daedalus.pq.iki.fi>
	<4CA21515.4030903@pfu.pl>	<20100929193136.644e0d68@daedalus.pq.iki.fi>	<878w2jike0.fsf@riseup.net>
	<4CA4A934.4080109@pfu.pl>	<87zkuzgqsv.fsf@riseup.net>
	<4CA4D199.8010403@pfu.pl>	<87pqvuhksw.fsf@riseup.net>
	<4CA5B64D.8000608@pfu.pl>	<871v88hgam.fsf@riseup.net>
	<4CAAFB3A.8010804@pfu.pl> <87fwwkhk8h.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87fwwkhk8h.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 10/05/10 14:55, Francisco Jerez wrote:
> Grzesiek S=F3jka<pld-t9zbU3WrWHI@public.gmane.org>  writes:
>
>> On 10/02/10 15:31, Francisco Jerez wrote:
>>> Ah, I think you're hitting the bandwidth limitation of the nv34
>>> integrated TMDS transmitter. The attached patch should help with the
>>> console modesetting problem, but you'll still need to set the modelines
>>> manually (and force panel rescaling) if you want to go up to 1600x1200,
>>> because your GPU *cannot* handle the video mode your monitor is asking
>>> for.
>>
>> Your patch works fine. Now I have clear image at both displays. Only
>> disadvantage is that the resolution is 1280x1024 (PixClk 135MHz). So I
>> was wondering if it is possible to force particular modeline (by
>> editing the kernel source tree??). The mode:
>>
>> Modeline "1600x1200_def" 144  1600 1628 1788 1920  1200 1201 1204 1250
>>
>> works fine with the XServer. Is it possible to force it at the console??
>>
> You could try to force a reduced blanking mode in the kernel command
> line like: "video=3DDVI-I-1:1600x1200RM". But it isn't going to work with
> GPU rescaling, the attached patch (on top of the previous one) will make
> the kernel detect that, and automatically fall back to panel rescaling.
Your patch works grate, again. Thanks
