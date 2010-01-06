From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Removal of Non-KMS support
Date: Thu, 7 Jan 2010 00:58:27 +0200
Message-ID: <20100107005827.466c968e@daedalus.pq.iki.fi>
References: <1262755950.2346.5.camel@araqiel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1262755950.2346.5.camel@araqiel>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 06 Jan 2010 15:32:30 +1000
Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> I did a very quick pass at removing all the non-KMS support from
> the DDX.  It's tested on G80 but nowhere else currently, I
> thought some discussion would be a good idea rather than just
> ripping it out :)
> 
> The non-KMS paths are messy, and lets face it, rotting badly.
> IMO the KMS code is stable enough now that we can continue
> without the UMS crutch, and indeed, the KMS code supports a lot
> more chipsets (particularly on GF8 and up) than the UMS code ever
> will.

Considering that any BSD will not have KMS for quite some time
(do they?), this sounds very cruel. Is it really such a big
pain to keep the code around?

OTOH, BSDs are stuck with pre-TTM Nouveau until they port GEM
and TTM to BSDs. How much more will it cost to BSDs to add KMS
to the list of mandatory kernel features... rnoland and others,
any comments?

-- 
Pekka Paalanen
http://www.iki.fi/pq/
