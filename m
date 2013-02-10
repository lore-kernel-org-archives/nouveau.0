From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Monitor with corrupted EDID
Date: Mon, 11 Feb 2013 09:33:58 +1000
Message-ID: <CAPM=9tzoj=QiOts0qEqL+Q34VEa8cBd4fNoX6sm+bTw_ob2t8w@mail.gmail.com>
References: <CAAs+i9J0jFhD1==NYEGtwJDUPCH4oaxH7_9rdOsgU-R7iu=Gtg@mail.gmail.com>
	<51140285.4000108@verizon.net> <5114B61C.40308@castelli.me>
	<5114D712.4060600@verizon.net> <5114F991.3030703@castelli.me>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5114F991.3030703-2uVk4PVEUg6lnMjI0IkVqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Flavio Castelli <flavio-2uVk4PVEUg6lnMjI0IkVqw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

>>
>> My suspicion is that if the EDID data got corrupted in the first place,
>> then it's not protected.  I don't know about i2cset, or any other methods.
>
>
> That's exactly what I'm thinking. I'm trying to overwrite the EEPROM using a
> DVI cable (since it's the DVI EDID which is broken). I saw other people used
> a vga -> dvi cable to do that because some pins could not be "exposed" by
> the DVI cable. I'm don't fully believe in this explanation.

I've found with some monitors, that unplugging everything, power, and
all monitor cables, and leaving it for a few minutes, then plugging it
all back in, can sometimes restore the EDID. Some EDID chips stop a
copy in RAM that gets powered from both mains and the ddc lines, so
you really need to disconnect everything.

(though I'm not sure how common this configuration is in monitors).

Dave.
