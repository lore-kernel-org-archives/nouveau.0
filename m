From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/TESTING(all hw)/DISCUSSION] FIFO (minor)
	create and (major) destroy instabilities on nv50+
Date: Mon, 4 Jan 2010 23:58:27 +0100
Message-ID: <91752841001041458l57c1db7bgf9a3b17a2add4d96@mail.gmail.com>
References: <6d4bc9fc1001020736r4b17971ftb5e7c718433df181@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc1001020736r4b17971ftb5e7c718433df181-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Jan 2, 2010 at 4:36 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Many people using nv50+ hardware are aware of gpu lockups when a fifo
> closes under certain conditions. Based on a mmio-trace and some trail
> and error testing i've come up with a patch that improves the
> situation on my NV96.
>
> This patch needs testing on NV50+ hardware and regression testing on
> older hardware, since i did change some of the common codepaths. This
> is very much a work in progress, and if you have anything to
> add/correct, please share it.
>
> I've also attached a 2 test apps, once is bitscan-fail from mwk, use
> it like ./bitscan-fail 0x200 to trigger PGRAPH errors. A modified
> version only emits NOPs (method 0x100) and represents the no error
> situation.
>
> For me, i can run the NOP program in loops of 10000 iterations with no
> problems (i've done so several times), the bitscan-fail survives 10000
> iterations sometimes, but can also fail after a few thousand. In
> comparison, a single run of bitscan-fail could cause a gpu lockup for
> me in the past.
>
> Please try the gallium driver, the test apps, suspend to ram. Suspend
> to ram isn't 100% reliable yet for me (this was always the case after
> strange experiments/hammering/etc), but should not regress. This goes
> for older hw as well, whatever worked should still work, but i
> wouldn't expect serious improvements there.
>
> As always, feedback is appreciated, especially since this is a touchy subject.
>

I tried patch v5 on nv84. I get similar results for bitscan-fail and
nop, i.e. a huge improvement compared to before (with or without X).
No apparent regressions on gallium and suspend/resume.
