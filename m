From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] drm/nouveau: fix ring buffer wrap-around
Date: Fri, 21 Aug 2009 12:38:40 +0200
Message-ID: <6d4bc9fc0908210338ke9bb58mbd69a40727cd3e2a@mail.gmail.com>
References: <1250791896-15510-1-git-send-email-pq@iki.fi>
	<1250791896-15510-2-git-send-email-pq@iki.fi>
	<1250791896-15510-3-git-send-email-pq@iki.fi>
	<1250791896-15510-4-git-send-email-pq@iki.fi>
	<6d4bc9fc0908201127r31db8153r36868ea96a624f30@mail.gmail.com>
	<20090821075823.31443f49@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090821075823.31443f49-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
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

On Fri, Aug 21, 2009 at 6:58 AM, Pekka Paalanen<pq-X3B1VOXEql0@public.gmane.org> wrote:
> On Thu, 20 Aug 2009 20:27:49 +0200
> Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> I think the -1 on chan->dma.free is unnecessary.
>
> Maybe it is for the wrap-around jump command, the OUT_RING?
> I don't any other way of reserving memory for writing that.

The initial pushbuf size is deducted by 2, because nv50 needs it for
some reason.
Originally it was 1, to accommodate the jump.

>
> --
> Pekka Paalanen
> http://www.iki.fi/pq/
>
