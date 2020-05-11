From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC v4 01/12] kthread: Add kthread_queue_flush_work()
Date: Mon, 11 May 2020 17:02:58 +0200
Message-ID: <CAKMK7uFDp_9SWUtMOfKaSLu3FNq5w=HWDo9FOeRsD204eR327g@mail.gmail.com>
References: <20200508204751.155488-1-lyude@redhat.com> <20200508204751.155488-2-lyude@redhat.com>
 <20200511144935.GD16815@mtj.duckdns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200511144935.GD16815@mtj.duckdns.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Nouveau Dev <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, Petr Mladek <pmladek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Ben Dooks <ben.dooks@codethink.co.uk>, Liang Chen <cl@rock-chips.com>
List-Id: nouveau.vger.kernel.org

On Mon, May 11, 2020 at 4:49 PM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Fri, May 08, 2020 at 04:46:51PM -0400, Lyude Paul wrote:
> > +bool kthread_queue_flush_work(struct kthread_work *work,
> > +                           struct kthread_flush_work *fwork);
> > +void __kthread_flush_work_fn(struct kthread_work *work);
>
> As an exposed interface, this doesn't seem great. What the user wants to say
> is "wait for the current instance of this guy" and the interface is asking
> them to queue an extra work item whose queueing return state should be
> checked and depending on that result wait on its internal completion.
>
> I'm skeptical this is a good idea in general given that unless you define
> "this instance" at the time of queueing the work item which is being
> waited-upon, there's no way to guarantee that the instance you're queueing
> the flush work item on is the instance you want unless the queuer is holding
> external synchronization which prevents the instance from running. That's a
> really confusing semantics to expose in the interface.
>
> What the above means is that the ordering that you want is only defined
> through your own locking and that maybe suggests that the sequencing should
> be implemented on that side too. It may be a bit more code but a sequence
> counter + wait queue might be the better solution here.

Aside from this, flush_$stuff interfaces are very easy to deadlock.
That's why e.g. flush_work() for normal workqueues has lockdep
annotations (lockdep doesn't see through wait/wake_up dependencies
without some help because cross-release didn't land for real). So I
think if we need something like this, it needs to be a lot more
explicit, and come with the right lockdep annotations.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
