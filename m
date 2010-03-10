From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: nv50/gallium: a few comments about latest patches
Date: Wed, 10 Mar 2010 15:33:38 +0100
Message-ID: <4B97ADC2.4050406@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

Just wanted to communicate some thoughts I had while reading the diffs,
even thought I didn't have the time to look at everything in detail yet.

- nv50: use relocs rather than re-uploading TIC all the time
It's nice that we can write relocs to arbitrary buffers, and it's much
less work than emitting the whole state object obviously.
Just, you forgot the card won't care until you write NV50TCL_TIC_FLUSH.
I was waiting for our new memory manager to alleviate the problem.

- nv50: rework state emission
At some point we talked about getting rid of some of these non constant
stateobjs, it doesn't really make much sense to allocate, emit, destroy
them all the time, except for multiple contexts maybe; and even then for
some state like stencil ref or blend color just using RING directly
still seems to be better to me.
Anyway, the code became nicer here :-)

- nv50: always emit dummy relocs for all still-referenced buffers
flush notify took care of that ...

- nv50: remove horrific abuse of nouveau_channel.flush_notify
Horrific ? The card doesn't complain about relocating between Begin/End,
and I think I even remember testing that they take effect immediately.

- nv50: move magic 0x142c stuff to after state emission
It's not too magical, it's used when vertex buffers have been modified,
and when you emit an OpenGL fence, for some reason ...

- nv50: make use of scissor enable/disable method
This isn't actually scissors but a VIEWPORT_HORIZ/VERT, it doesn't
affect CLEAR_BUFFERS.
VIEWPORT_HORIZ/VERT is scissors, and you can't turn that off. The blob
never turns off 0xe00.

- nv50: the whole vertex emission rewrite ...
I've never seen any indication that index emission has to be split in
some way if you have to use multiple push buffers.
But I suspect you'll use that util to lift the edge flag to new heights,
not relegating it to the slow push path ...

The instance_init thing is done too often for my taste now.

Regards,
 Christoph
