From: Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
Subject: Re: Removal of Non-KMS support
Date: Wed, 06 Jan 2010 19:59:47 -0600
Message-ID: <1262829587.2486.42.camel@balrog.2hip.net>
References: <1262755950.2346.5.camel@araqiel>
	<20100107005827.466c968e@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100107005827.466c968e-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
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

On Thu, 2010-01-07 at 00:58 +0200, Pekka Paalanen wrote:
> On Wed, 06 Jan 2010 15:32:30 +1000
> Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> > I did a very quick pass at removing all the non-KMS support from
> > the DDX.  It's tested on G80 but nowhere else currently, I
> > thought some discussion would be a good idea rather than just
> > ripping it out :)
> > 
> > The non-KMS paths are messy, and lets face it, rotting badly.
> > IMO the KMS code is stable enough now that we can continue
> > without the UMS crutch, and indeed, the KMS code supports a lot
> > more chipsets (particularly on GF8 and up) than the UMS code ever
> > will.
> 
> Considering that any BSD will not have KMS for quite some time
> (do they?), this sounds very cruel. Is it really such a big
> pain to keep the code around?
> 
> OTOH, BSDs are stuck with pre-TTM Nouveau until they port GEM
> and TTM to BSDs. How much more will it cost to BSDs to add KMS
> to the list of mandatory kernel features... rnoland and others,
> any comments?

Well, I would prefer that this not get ripped out, honestly.  My current
big project queue is GEM, TTM and finally KMS.  I think that I finally
have a handle on how I'm going to finish implementing GEM now.  TTM, I
have started on, but mostly what I have now is stubs, so until I'm
deeper into porting/re-writing the code I don't have a clear plan.  I
think that it will likely be handled in much the same way as GEM, but
I'm sure there will be new things to sort out.

I've looked at KMS less than any of the other stuff so far really, but
the API is designed around linux and while much of the code to interact
with the hardware should be fairly easy to port I think, I'm really not
clear how the current API can/will tie into our (BSD) console code.  So,
basically what I'm saying here is that I don't currently have a plan for
how I'm going to deal with KMS, where I do at least have fairly clear
plans for GEM and hopefully TTM.

Unfortunately, the amount of time that I have available to work on stuff
has just been dramatically reduced, at least for the time being.

robert.

-- 
Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
2Hip Networks
