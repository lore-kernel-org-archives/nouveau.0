From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [lm-sensors] hwmon API update
Date: Thu, 03 Mar 2011 14:09:54 +0100
Message-ID: <4D6F9322.3080209@free.fr>
References: <4D57CC24.1040306@free.fr>	<20110213171640.GB13323@ericsson.com>	<20110213230833.0ee2ff16@endymion.delvare>
	<AANLkTindG=m4FhNS202MH8YVBUCoDEADTQLxo-Bf_8qx@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTindG=m4FhNS202MH8YVBUCoDEADTQLxo-Bf_8qx-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Guenter Roeck <guenter.roeck-IzeFyvvaP7pWk0Htik3J/w@public.gmane.org>, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Dave,

The answers are inlined.

Le 03/03/2011 10:36, Dave Airlie a =E9crit :
> Martin,
>
> you probably should have cc'ed Matthew since it was his patch you based t=
his on,
> and I think he can provide a good explaination.
I knew he was monitoring the nouveau ML. He provided a good explanation
but forgot to CC the nouveau ML.

Could someone in the lm-sensors mailing list forward the most important =

thread?
> to clarify some points,
>
> radeon does probably want something exactly like this, we just haven't go=
tten to
> it completely yet, I'd rather not have two drivers in the kernel for
> exact same hardware,
> and I believe sharing the hwmon code to do what we want is a good plan si=
nce you
> don't go around reinventing wheels, but if hwmon/i2c maintainers have
> no interest
> it leaves with little choice but to implement about 5-10 i2c drivers
> again in drm codebase.
>
> Maybe hwmon/i2c maintainers could suggest a cleaner way to implement
> what we want,
> which I think I can summarize as
>
> a) access to monitored values in-kernel
> b) no userspace access to the same values except via sanitised via the dr=
iver.
a) is mandatory, b) would be great!
> though I'm not following this as closely as I should so I may have
> missed something.
I don't think you missed anything but long argue on the lm-sensors ML.
> Dave.
The reason why I didn't answer on this matter earlier was that I was in =

the process
of moving from one city to another. I only got the internet access on =

both my computers
yesterday evening and I was planing to restart the process this week end.

It's good to see you we are not the only one needing this.

Martin
