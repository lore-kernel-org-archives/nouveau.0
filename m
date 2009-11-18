From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24996] Wrong display resolution in X,
 "windowed" console. FX 5600 XT
Date: Wed, 18 Nov 2009 11:37:19 -0800 (PST)
Message-ID: <20091118193719.1B8241300D3@annarchy.freedesktop.org>
References: <bug-24996-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24996-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=24996





--- Comment #14 from Simon Siemonsma <simon-ox55uKOtYtiZyCGURLKNQw@public.gmane.org>  2009-11-18 11:37:18 PST ---
(In reply to comment #13)
> Created an attachment (id=31294)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31294) [details]
> dcb_gpio_tvdac_switching3.patch
> 
> (In reply to comment #9)
> > (In reply to comment #6)
> > > Created an attachment (id=31117)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31117) [details] [details] [details]
> > > nv43_tvdac_load.patch
> > > 
> > > > 
> > > 
> > > Does the attached patch fix it for you?
> > > 
> > 
> > The patch doesn't help.
> > Please let me now if you would like to receive more information or if can do
> > some more tests.
> > 
> 
> dcb_gpio_tvdac_switching2.patch no longer applies cleanly over master. Please
> use the one I'm attaching now if you have updated your tree recently enough.
> 

(In reply to comment #13)
> Created an attachment (id=31294)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31294) [details]
> dcb_gpio_tvdac_switching3.patch
> 
> (In reply to comment #9)
> > (In reply to comment #6)
> > > Created an attachment (id=31117)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31117) [details] [details] [details]
> > > nv43_tvdac_load.patch
> > > 
> > > > 
> > > 
> > > Does the attached patch fix it for you?
> > > 
> > 
> > The patch doesn't help.
> > Please let me now if you would like to receive more information or if can do
> > some more tests.
> > 
> 
> dcb_gpio_tvdac_switching2.patch no longer applies cleanly over master. Please
> use the one I'm attaching now if you have updated your tree recently enough.
> 

(In reply to comment #13)
> Created an attachment (id=31294)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31294) [details]
> dcb_gpio_tvdac_switching3.patch
> 
> (In reply to comment #9)
> > (In reply to comment #6)
> > > Created an attachment (id=31117)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31117) [details] [details] [details]
> > > nv43_tvdac_load.patch
> > > 
> > > > 
> > > 
> > > Does the attached patch fix it for you?
> > > 
> > 
> > The patch doesn't help.
> > Please let me now if you would like to receive more information or if can do
> > some more tests.
> > 
> 
> dcb_gpio_tvdac_switching2.patch no longer applies cleanly over master. Please
> use the one I'm attaching now if you have updated your tree recently enough.
> 

Given your comments about ubdating my tree recently enough I downloaded the
latest drm snapshot from http://people.freedesktop.org/~pq/nouveau-drm/

When applying the patch Chunk 1 & 2 didn't apply.
Before applying the patch the kernel did compile.
After applying the patch (except chunk 1 & 2 of course) the kernel didn't
compile.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
