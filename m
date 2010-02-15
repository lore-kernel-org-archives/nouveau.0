From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [git pull] drm
Date: Mon, 15 Feb 2010 21:39:00 +0100
Message-ID: <6d4bc9fc1002151239x2b994ea9l7f868d9bb8f789e9@mail.gmail.com>
References: <alpine.DEB.2.00.1002110417200.516@skynet.skynet.ie>
	<201002151053.48681.borntraeger@de.ibm.com>
	<20100215201201.GA3332@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100215201201.GA3332-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christian Borntraeger <borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, dri-devel-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: nouveau.vger.kernel.org

The channel/context switch lock related patches (to the best of
knowledge) haven't even gone outside the nouveau tree, so the initial
damage isn't even there. At least not for the first path. As for the
2nd patch, that one was squished into the original patch for this pull
iirc.

Maarten.

On Mon, Feb 15, 2010 at 9:12 PM, Marcin Slusarz
<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Feb 15, 2010 at 10:53:48AM +0100, Christian Borntraeger wrote:
>> Am Donnerstag 11 Februar 2010 05:20:07 schrieb Dave Airlie:
>>
>> Dave,
>>
>> I just updated from to rc8 and got the a scheduling while atomic warning in
>> nouveau. (see below).
>
> Linus' tree is missing two fixes:
>
> drm/nouveau: don't hold spin lock while calling kzalloc with GFP_KERNEL
> drm/nouveau: spin_lock_init after memset'ing the bios struct
>
> The first one fixes your bug.
>
> http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=ed64797d153ecf0da79b8b849642d7a109fd97fd
> http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=9da76700072a00c39e21553df0998c7b3b620d88
>
> If they won't go into 2.6.33, they are perfect candidates for -stable.
>
> Marcin
>
