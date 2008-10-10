From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Nvidia regs (Re: need help relating your post on
	freedesktop)
Date: Fri, 10 Oct 2008 21:04:04 +0300
Message-ID: <20081010210404.406dc239@daedalus.pq.iki.fi>
References: <20081005172955.13083587@daedalus.pq.iki.fi>
	<1912509596.908171223590194934.JavaMail.root@mail6.gatech.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1912509596.908171223590194934.JavaMail.root-+uv3tkLL0AUsTUYHLfqkUA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "Kolakkar, Pranay B" <pranay.kolakkar-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 9 Oct 2008 18:09:54 -0400 (EDT)
"Kolakkar, Pranay B" <pranay.kolakkar-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org> wrote:

> I have multithreaded jobs to run on GPU using GPUs as GPGPUs and I want to
> monitor the amount of free memory over it and the number of threads that
> each of the process generates!

Okay, so you want to watch the proprietary driver. I'm not sure how
possible that is without getting too deep into the driver. Maybe it
could be enough to sample the GPU page tables, and memory and context
objects?

> I am going thru the mailing list as well! I am trying to see how can I
> reverse engineer the performance counters. NVidia has NVPerf but the API
> doesn't seem to work for 8800 GPUs!!! Tired of doing this now! Need to
> come up with something of my own!

Hm, I was hoping you could use the NVPerfKit and mmiotrace to find the
regs. Or renouveau, depending on if the regs are accessed via MMIO in
kernel, or commands via the FIFO. There are also tools to trap MMIO
accesses in user space.

Are you using the latest NVPrefKit, which was released some time this
year, IIRC?
I tried that with gf 6600, and the GLExpert part worked, until I had
two GL contexts running at the same time. I didn't try PerfSDK, and
gDEBugger simply froze, whatever I did.

Hmm, it claims GTX 200 support... could they have updated it again?

> Ill let you know if I can help you with my tool in the project Noveau!
> 
> Thanks for your support. Good to see im not the only one dying :)
> 
> Regards,
> Pranay B. Kolakkar.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
