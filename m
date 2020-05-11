From: Tejun Heo <tj@kernel.org>
Subject: Re: [RFC v4 02/12] kthread: Add kthread_(un)block_work_queuing() and
 kthread_work_queuable()
Date: Mon, 11 May 2020 11:02:51 -0400
Message-ID: <20200511150251.GE16815@mtj.duckdns.org>
References: <20200508204751.155488-1-lyude@redhat.com>
 <20200508204751.155488-3-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200508204751.155488-3-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Suren Baghdasaryan <surenb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liang Chen <cl@rock-chips.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Thomas Gleixner <tglx@linutronix.de>
List-Id: nouveau.vger.kernel.org

On Fri, May 08, 2020 at 04:46:52PM -0400, Lyude Paul wrote:
> Add some simple wrappers around incrementing/decrementing
> kthread_work.cancelling under lock, along with checking whether queuing
> is currently allowed on a given kthread_work, which we'll use want to
> implement work cancelling with DRM's vblank work helpers.

Am I correct in assuming that what you want is "cancel this and block
further queueing until the state is cleared"? I agree that'd be something
really useful to have. That said, There are a few areas that I think can be
improved upon:

* It'd be better if we separate this state into its own thing rather than
  mixing with canceling state which has potential to make things really
  confusing. It doesn't have to be a separate field unless you want disable
  depth for work item disable (and I don't think you do). It can just be a
  high bit in the same field but I think the two states should be separate
  one way or the other.

* I'm always a bit skeptical about state querying interfaces which aren't
  synchronized to anything. They're useful in many cases but also prone to
  being misused. If you absoultely have to have them, can you please add
  explicit comment explaining the lack of synchronization around it - ie.
  unless you're the one setting and clearing the flag and queueing the task,
  it isn't synchronized against anything.

* In the same vein, I'm not too sure about stand-alone block interface.
  Unless I'm the sole queuer or there are further locking around queueing,
  what good does setting blocking do? There's no way to guarantee that the
  flag is seen by someone else trying to queue it and trying to flush the
  work item after queueing doesn't help either. The only way to make that
  interface meaningful is doing it together with cancel - so, you say "block
  further queueing and cancel / flush whatever is in flight or queued",
  which actually gives you a useful invariant.

* A simliar argument can be made about unblock too although that's an a lot
  more relaxed situation in that unblocking and queueing oneself always
  works and that the user might not care which future instance of queueing
  will start succeeding.

Thanks.

-- 
tejun
