From: Tejun Heo <tj@kernel.org>
Subject: Re: [RFC v4 01/12] kthread: Add kthread_queue_flush_work()
Date: Mon, 11 May 2020 10:49:35 -0400
Message-ID: <20200511144935.GD16815@mtj.duckdns.org>
References: <20200508204751.155488-1-lyude@redhat.com>
 <20200508204751.155488-2-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200508204751.155488-2-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, Petr Mladek <pmladek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Ben Dooks <ben.dooks@codethink.co.uk>, Liang Chen <cl@rock-chips.com>
List-Id: nouveau.vger.kernel.org

Hello,

On Fri, May 08, 2020 at 04:46:51PM -0400, Lyude Paul wrote:
> +bool kthread_queue_flush_work(struct kthread_work *work,
> +			      struct kthread_flush_work *fwork);
> +void __kthread_flush_work_fn(struct kthread_work *work);

As an exposed interface, this doesn't seem great. What the user wants to say
is "wait for the current instance of this guy" and the interface is asking
them to queue an extra work item whose queueing return state should be
checked and depending on that result wait on its internal completion.

I'm skeptical this is a good idea in general given that unless you define
"this instance" at the time of queueing the work item which is being
waited-upon, there's no way to guarantee that the instance you're queueing
the flush work item on is the instance you want unless the queuer is holding
external synchronization which prevents the instance from running. That's a
really confusing semantics to expose in the interface.

What the above means is that the ordering that you want is only defined
through your own locking and that maybe suggests that the sequencing should
be implemented on that side too. It may be a bit more code but a sequence
counter + wait queue might be the better solution here.

Thanks.

-- 
tejun
