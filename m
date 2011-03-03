From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [lm-sensors] hwmon API update
Date: Thu, 3 Mar 2011 19:36:09 +1000
Message-ID: <AANLkTindG=m4FhNS202MH8YVBUCoDEADTQLxo-Bf_8qx@mail.gmail.com>
References: <4D57CC24.1040306@free.fr> <20110213171640.GB13323@ericsson.com>
	<20110213230833.0ee2ff16@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110213230833.0ee2ff16-R0o5gVi9kd7kN2dkZ6Wm7A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Guenter Roeck <guenter.roeck-IzeFyvvaP7pWk0Htik3J/w@public.gmane.org>, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Feb 14, 2011 at 8:08 AM, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org> wrote:
> On Sun, 13 Feb 2011 09:16:40 -0800, Guenter Roeck wrote:
>> On Sun, Feb 13, 2011 at 07:18:44AM -0500, Martin Peres wrote:
>> > Hi,
>> >
>> > I am working on power management on the nouveau driver and I need a way
>> > to get data out of and send commands to the i2c drivers from the kernel
>> > space.

Martin,

you probably should have cc'ed Matthew since it was his patch you based this on,
and I think he can provide a good explaination.

to clarify some points,

radeon does probably want something exactly like this, we just haven't gotten to
it completely yet, I'd rather not have two drivers in the kernel for
exact same hardware,
and I believe sharing the hwmon code to do what we want is a good plan since you
don't go around reinventing wheels, but if hwmon/i2c maintainers have
no interest
it leaves with little choice but to implement about 5-10 i2c drivers
again in drm codebase.

Maybe hwmon/i2c maintainers could suggest a cleaner way to implement
what we want,
which I think I can summarize as

a) access to monitored values in-kernel
b) no userspace access to the same values except via sanitised via the driver.

though I'm not following this as closely as I should so I may have
missed something.

Dave.
