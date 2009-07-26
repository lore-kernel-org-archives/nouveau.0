From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] drm/nouveau: change FB map to simple
	ioremap
Date: Sun, 26 Jul 2009 21:08:09 +1000
Message-ID: <21d7e9970907260408w17d05e43p4954b8553f574dee@mail.gmail.com>
References: <1248524947-4550-1-git-send-email-pq@iki.fi>
	<1248524947-4550-2-git-send-email-pq@iki.fi>
	<1248524947-4550-3-git-send-email-pq@iki.fi>
	<1248524947-4550-4-git-send-email-pq@iki.fi>
	<1248524947-4550-5-git-send-email-pq@iki.fi>
	<21d7e9970907260403k68294124xcd10802e6d7cd220@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <21d7e9970907260403k68294124xcd10802e6d7cd220-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Jul 26, 2009 at 9:03 PM, Dave Airlie<airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sat, Jul 25, 2009 at 10:29 PM, Pekka Paalanen<pq-X3B1VOXEql0@public.gmane.org> wrote:
>> Remove the use of drm_local_map for the FB mapping and replace it with
>> the equivalent ioremap.
>
> I don't think FBs are ioremapped normally with addmap, unless nouveau
> does something different here. Generally ioremapping the whole framebuffer
> is considered a bad idea as ioremap on 32-bit x86 is limited.
>

/me reads patch properly ;-)

Notice DRM_REGISTERS. oops. looks fine then.

Dave.
