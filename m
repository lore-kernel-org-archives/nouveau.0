From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: BIG changes to kernel module
Date: Sun, 5 Aug 2012 12:40:15 +1000
Message-ID: <CACAvsv6XAV4n=9n32weJeLWCQjv2ip2QMz3Zg96DySvyoe6SSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Hey all,

I've just pushed a major rework/rewrite of the Nouveau kernel module to git[1].

Details of the whys and what-nots of the rework are in the various commit
messages.  At this point don't expect any exciting cool functionality, the
work so far is merely a restructure to allow moving forward on a number
of fronts in the future.

I expect that for a while there will be a *lot* of stupid typos/thinkos that
cause all sorts of breakage, so please test everything any anything you can
and report *regressions* from the pre-rework code (vs 3.6-rc1 for example).

I'll endeavour to hunt down and fix the regressions as quickly as possible, so
please report any issues to this list and/or the freedesktop bugzilla.

There's two areas that didn't get "properly" ported over, that is PM-related
things and modesetting.  I'll be handling the modesetting and clk/volt reworks
starting from nowish (in between fixing regressions), and I suspect Martin
will handle the rest of the PM bits (therm and fanctrl) since he knows the
design he's going for there.

One thing to note is that some kernel module options have changed now, the
more important ones are:

nouveau.vbios=<blah> -> nouveau.config=NvBIOS=<blah>
nouveau.noaccel=<bool> -> nouveau.config=PGRAPH=<bool>

Multiple options are specified like:

nouveau.config=NvBIOS=ACPI,PGRAPH=1

The nouveau.noaccel option now controls acceleration enable/disable for the
DRM's own GPU usage, and for the "abi16" (the new interfaces aren't even
exposed to userspace yet) interfaces.

The DRM debugging options (drm.debug=<bitfield>) now only effect the DRM
specific parts of the nouveau module.  To enable additional debugging etc
for the core, incantations like the following are used now:

for debug output

nouveau.debug=debug

or for even more verbose debug output

nouveau.debug=trace

or for trace output for everything, and register write logging from POST

nouveau.debug=trace,DEVINIT=spam

Each individual subdev/engine module has its own debug level that can
override the master debug level.

Now, I'm off to relax a bit (read: hide) before the storm of bug reports :)

Cheers,
Ben.


[1] http://cgit.freedesktop.org/nouveau/linux-2.6
