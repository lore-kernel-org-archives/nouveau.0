From: =?ISO-8859-2?Q?Grzesiek_S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Thu, 07 Oct 2010 21:34:57 +0200
Message-ID: <4CAE20E1.7050302@pfu.pl>
References: <4C9E0167.8000507@pfu.pl>	<20100928004117.0a0ae0ca@daedalus.pq.iki.fi>
	<4CA1C6C0.1000709@pfu.pl>	<20100928170227.00665f76@daedalus.pq.iki.fi>
	<4CA21515.4030903@pfu.pl>	<20100929193136.644e0d68@daedalus.pq.iki.fi>	<878w2jike0.fsf@riseup.net>
	<4CA4A934.4080109@pfu.pl>	<87zkuzgqsv.fsf@riseup.net>
	<4CA4D199.8010403@pfu.pl>	<87pqvuhksw.fsf@riseup.net>
	<4CA5B64D.8000608@pfu.pl>	<871v88hgam.fsf@riseup.net>
	<4CAAFB3A.8010804@pfu.pl>	<87fwwkhk8h.fsf@riseup.net>
	<4CAB3BDC.4070502@pfu.pl> <87wrpug1d0.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87wrpug1d0.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

On 10/07/10 04:53, Francisco Jerez wrote:
> Grzesiek S=F3jka<pld-t9zbU3WrWHI@public.gmane.org>  writes:
>
>> On 10/05/10 14:55, Francisco Jerez wrote:
>>>> PS. I'm afraid that my system is not very stable when the AGP support
>>>> is turned on both using the nouveau kernel source tree and the PLD
>>>> patched 2.6.35-5 version with an extra amd-k7-agp patch. The Xserver
>>>> uses the driver:
>>> Unstable? How? What's the problem?
>>
>> Here are the logs:
>> http://yen.ipipan.waw.pl/~gs159090/tmp/log.tgz
>>
>> BTW: Sometimes the Xserver freezes during normal work. Unfortunately I
>> was not able to generate such a crush now. I send you logs if it
>> happens again.
>>
>> Regards.
>>
>> [...]
>> [  197.374498] kernel BUG at drivers/gpu/drm/ttm/ttm_tt.c:420!
>
> Oops, I overlooked that, updated patch attached.
>

The new patch works fine so fare. System seems to be stable.

cheers


greg
