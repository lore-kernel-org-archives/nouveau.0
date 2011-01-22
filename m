From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: Low power operational mode of nv50
Date: Sat, 22 Jan 2011 14:05:25 +0100
Message-ID: <4D3AD615.6010101@free.fr>
References: <4D3ABBD6.1070509@web.de> <4D3AC448.5040200@free.fr>
	<4D3ACFD0.6000000@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4D3ACFD0.6000000-S0/GAf8tV78@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jan Kiszka <jan.kiszka-S0/GAf8tV78@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Le 22/01/2011 13:38, Jan Kiszka a =E9crit :
> [please keep me on CC]
ok, sorry about that.
> On 2011-01-22 12:49, Martin Peres wrote:
>>
>> To put it simply, I have no idea :s I spotted some strange behaviour
>> (that could indicate some power management) when tracing the kernel but
>> my attempts to mimic it led to ..... 0.1W less (I guess it's just noise).
> Yeah, I think we are looking something like 3-5 Watt.
Yes
>> I must admit I'm not working enough on it yet, this is because I would
>> like to get safe recloking and fan management out of the door before
>> looking at real power management,
> I agree that being able to safely switch between power modes is
> important. But, at least for the rather common mobile scenarios, it is
> first of all important to have acceptable 2D support (I think that's
> already the case) which does not suck your battery and steal your nerves
> via noisy fans. And that's still preventing me to switch.
Well, I was more pragmatic: "Let's do what we already 'know' we can do".
Also, I wouldn't know what are the normal instructions if I hadn't =

implemented
the reclocking support myself.

I understand your frustration though.
>> but if you have some knowledge in the
>> field, I would love if you could give me a hand on this :)
> Yet I do not know much about the nouveau or the hardware it drives. But
> I'm not really unfamiliar with messing around in drivers and kernels. So
> if you tell me what might be worth looking at or trying out...
Cool, well, what you can do is look at mmiotraces (I can provide you =

with some or you could make one yourself: =

http://nouveau.freedesktop.org/wiki/MmioTrace )

Send me your vbios and the trace when you're done. I'll tell you what to =

look for and what is already known :)

You'll also need to read =

https://github.com/pathscale/pscnv/wiki/Power-Management and =

https://github.com/pathscale/pscnv/wiki/Introductorycourse .

Then, you'll need the demmio tool to easily read the mmiotrace =

(https://github.com/pathscale/pscnv/wiki/RE_Tools).

$ demmio my_mmio_trace.txt | less -R

Then you need to look at the right place, I would suggest going to the =

position where the reclock is happenning (type "/0x4020 <=3D", less will =

search for "0x4020 <=3D" in the text).

I'll tell you more when I receive your mail (send it to mmio dot dumps =

at gmail dot com, my mailbox is already almost full of vbios).
>> Anyway, I'll be in Germany next week, are you living close to Bochum? We
>> could talk about this if you want/can.
> Not really close: Munich. Guess we have to stick with email or chat. :)
Indeed :)

Martin
