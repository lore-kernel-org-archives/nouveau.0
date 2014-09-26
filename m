From: Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: NVIDIA Falcon Microprocessor Security
Date: Fri, 26 Sep 2014 10:19:39 -0700
Message-ID: <20140926171939.GE6384@parker.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


Hi, all.

Below is a link to a brief document describing some changes in NVIDIA
Falcon processors ("fuc", in Nouveau-speak, IIUC) that happened in
Maxwell: certain aspects of the chip will only be available to Falcon
firmware images signed by NVIDIA.  So far, the set of restricted things
is pretty small, but I expect this list will slowly grow over future
hardware generations.

    ftp://download.nvidia.com/open-gpu-doc/Falcon-Security/1/Falcon-Security.html

I suspect this will not be the most popular decision, but it is the
direction the hardware is taking.

On a slightly different note, we'd like to work out the best way to
make NVIDIA firmware images separately (from the rest of the driver)
available and officially redistributable for use by Nouveau.  At this
point, it is mostly just a release engineering question, but I don't think
we'll have a lot of influence over the content: the engineers working on
Falcon microcode assume it changes in lock-step with NVIDIA's nvidia.ko,
so there are no backwards compatibility guarantees.  How painful has
the lack of backwards compatibility been for Nouveau thus far?

If NVIDIA just released firmware binaries along side each NVIDIA GPU driver
release, would it be reasonable for Nouveau to pick and choose which
firmware you'd like promoted to, e.g.,

    http://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/tree/

?

Anyway, this might be a good topic to discuss at XDC.  It looks I'll
see a lot of you then; I'm looking forward to it!

Thanks,
- Andy
