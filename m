From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: BIG changes to kernel module
Date: Fri, 10 Aug 2012 23:57:52 +0200
Message-ID: <CAGZ4FESnhO84LaUvotRzkbo6w_SkD34q5eW9ide4jGNQH4=Epg@mail.gmail.com>
References: <CACAvsv6XAV4n=9n32weJeLWCQjv2ip2QMz3Zg96DySvyoe6SSw@mail.gmail.com>
	<20120805205637.GA3107@joi.lan>
	<20120806065814.GB17565@turiel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120806065814.GB17565-yqdYmcOkqV0XGNroddHbYwC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Aug 6, 2012 at 8:58 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sun, Aug 05, 2012 at 10:56:37PM +0200, Marcin Slusarz wrote:
>> On Sun, Aug 05, 2012 at 12:40:15PM +1000, Ben Skeggs wrote:
>> > Hey all,
>> >
>> > I've just pushed a major rework/rewrite of the Nouveau kernel module to git[1].
>> >
>> > Details of the whys and what-nots of the rework are in the various commit
>> > messages.  At this point don't expect any exciting cool functionality, the
>> > work so far is merely a restructure to allow moving forward on a number
>> > of fronts in the future.
>> >
>> > I expect that for a while there will be a *lot* of stupid typos/thinkos that
>> > cause all sorts of breakage, so please test everything any anything you can
>> > and report *regressions* from the pre-rework code (vs 3.6-rc1 for example).
>> >
>> > I'll endeavour to hunt down and fix the regressions as quickly as possible, so
>> > please report any issues to this list and/or the freedesktop bugzilla.
>> >
>> > There's two areas that didn't get "properly" ported over, that is PM-related
>> > things and modesetting.  I'll be handling the modesetting and clk/volt reworks
>> > starting from nowish (in between fixing regressions), and I suspect Martin
>> > will handle the rest of the PM bits (therm and fanctrl) since he knows the
>> > design he's going for there.
>> >
>> > One thing to note is that some kernel module options have changed now, the
>> > more important ones are:
>> >
>> > nouveau.vbios=<blah> -> nouveau.config=NvBIOS=<blah>
>> > nouveau.noaccel=<bool> -> nouveau.config=PGRAPH=<bool>
>> >
>> > Multiple options are specified like:
>> >
>> > nouveau.config=NvBIOS=ACPI,PGRAPH=1
>> >
>> > The nouveau.noaccel option now controls acceleration enable/disable for the
>> > DRM's own GPU usage, and for the "abi16" (the new interfaces aren't even
>> > exposed to userspace yet) interfaces.
>> >
>> > The DRM debugging options (drm.debug=<bitfield>) now only effect the DRM
>> > specific parts of the nouveau module.  To enable additional debugging etc
>> > for the core, incantations like the following are used now:
>> >
>> > for debug output
>> >
>> > nouveau.debug=debug
>> >
>> > or for even more verbose debug output
>> >
>> > nouveau.debug=trace
>> >
>> > or for trace output for everything, and register write logging from POST
>> >
>> > nouveau.debug=trace,DEVINIT=spam
>> >
>> > Each individual subdev/engine module has its own debug level that can
>> > override the master debug level.
>>
>> It would be very helpful to document this convention and all options in some
>> text file in-tree (and later update it when things change).
> Yes, good point.  I'll see to that before any of this hits Linus'.
>
>>
>> Some things I noticed:
>> - corruptions / lockups in Warsow (1.0) on one of the bomb maps (I didn't test
>>   too much, so it might happen on others too) - initially bisected to
>>   "drm/nouveau/instmem: completely new implementation, as a subdev module",
>>   but I'm not so sure about it - with this commit most textures are corrupted
>>   and there are PGRAPH_TRAP_MP_EXEC errors in dmesg, but on HEAD I see total
>>   mayhem with DATA_ERROR, followed by TRAP_MP_EXEC and endless stream of page
>>   faults
>> - new lockups triggerable by piglit
>> - VRAM leak? (probably triggered by piglit)
> I'll see if I can reproduce these at all during the week.
>
>> - missing channel id in error messages
> This is actually deliberate, since technically the channel address *is* the
> chid on most engines.  PFIFO errors still log the chid, because there are
> actually indices there.
>
> I do see how it can be useful to have the PFIFO channel ID too though in
> error messages, so I'll bring them back.
>
>> - debugfs removed (not advertised in any commit, so I don't know if it's
>>   intentional or not)
> Oops, that *was* a separate commit at some point.  Might have accidentally
> squashed it.  It's intentional for now, it'll come back (better) later.
>
>> - some leftovers:
>>   - XXX_THIS_IS_A_HACK
>>   - /* yell very loudly!! */ (no code implementing yelling ;)
> Oops, thanks.  I've fixed both of these and I'll push them shortly.
>
> Thanks a LOT for looking this over for me.
>
> Cheers,
> Ben.
>
>>
>> Marcin
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

I've also noticed some problems with huge lag in freespace 2 open, i
see this in dmesg:

[111545.883979] nouveau E[     DRM][0000:01:00.0] nv50cal_space: -16

I can't find anything obviously wrong with the code checking that we
haven't locked up, but that doesn't mean you shouldn't check it :-)

Note that in the past there were always scenes that were a bit laggy,
but these things are almost like temporary lockups.

-- 
Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
