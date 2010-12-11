From: "Emil Velikov" <emil.velikov-/E1597aS9LT10XsdtD+oqA@public.gmane.org>
Subject: Re: Display goes off when framebuffer enabled and Kernel
 Panic with fbset
Date: Sat, 11 Dec 2010 02:24:25 -0000
Message-ID: <op.vni2axo3tkuz1w@emo>
References: <20101204072803.GA4170@localhost2.local>
	<20101204075925.GB4170@localhost2.local>
	<20101205070234.GB4102@localhost2.local>
	<20101205133804.5430594f@daedalus.pq.iki.fi>
	<20101206011231.GC4122@localhost2.local>
	<20101208093458.GA11429@localhost2.local>
	<20101208122300.GA4480@localhost2.local>
	<20101209004202.GA4477@localhost2.local> <8762v3ards.fsf@riseup.net>
	<20101210104352.GA4505@localhost2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101210104352.GA4505-bi+AKbBUZKbUbxaO3c2PGA@public.gmane.org>
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

Roger, looking at your logs it appears that you are still running an old  
version of nouveau

Make sure that you are running the latest git as it includes a few AGP  
related bug-fixes
Note that nouveau is NOT only a kernel. For more info on how to download,  
compile and install take a look at the wiki [1] [2]

[1] http://nouveau.freedesktop.org/wiki/InstallNouveau
[2] http://nouveau.freedesktop.org/wiki/GentooEbuilds

On Fri, 10 Dec 2010 10:43:52 -0000, Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Thu, Dec 09, 2010 at 04:38:07PM +0100, Francisco Jerez wrote:
>> Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>
>>> I think I've found the problem.
>>>
>>> # echo "option nouveau noagp=1" >> /etc/modprobe.d/nouveau.conf
>>>
>>> So far, it looks like things have stopped freezing.
>>
>> Do you get the same kind of AGP problems with the other nvidia cards you
>> said you had access to? Have you tried to set a saner AGP aperture size
>> (e.g. 64MB) in your BIOS settings? Does it make any difference?
> No real difference between AGP memory reservations.  Aside from the  
> anomoly I
> saw on the first freeze with 64MB AGP, saw my last framebuffer screen on  
> a good
> halt of the system -- done sometime last night?
>
> Again, I got one working with noagp=0 and then one frozen.  Attaching  
> both
> complete logs using debug settings for the drm/nouveau modules.
>
>
>> The output from "lspci -vvv" (executed as root before having loaded the
>> nouveau kernel module) and *full* kernel logs are likely to be useful
>> too.
> Attaching lscpi -vvv as well.
>
> (Hopefully the mailing list doesn't strip them.)
