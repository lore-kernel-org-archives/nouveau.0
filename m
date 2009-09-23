From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14393] Card detected as NV20 (endian issue?) With nv
 driver run first, fifo lockup on nv11ppc machine
Date: Wed, 23 Sep 2009 04:56:42 -0700 (PDT)
Message-ID: <20090923115642.D3D7013005B@annarchy.freedesktop.org>
References: <bug-14393-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14393-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14393





--- Comment #7 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2009-09-23 04:56:41 PST ---
The code in current DRM still is:

#ifdef __BIG_ENDIAN
        /* Put the card in BE mode if it's not */
        if (nv_rd32(dev, NV03_PMC_BOOT_1))
                nv_wr32(dev, NV03_PMC_BOOT_1, 0x00000001);

        DRM_MEMORYBARRIER();
#endif

Does the patch change anything?
How does Nouveau currently work with and without the patch?

The patch may not apply as is, but you can easily do the equivalent change by
hand in drivers/gpu/drm/nouveau/nouveau_state.c in the nouveau/linux-2.6 kernel
tree, near line 540.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
