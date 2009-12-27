From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25806] New: NV40 vertex corruption (kernel BO
 deletion too early?)
Date: Sun, 27 Dec 2009 13:45:10 -0800 (PST)
Message-ID: <bug-25806-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25806

           Summary: NV40 vertex corruption (kernel BO deletion too early?)
           Product: Mesa
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: luca.barbieri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


On my G71 system, several programs show vertex corruption issues. In
particular, vertices tend to be corrupted or randomly go to infinity, leading
to spiked triangles or random polygons, in several programs, such as
demos/engine, demos/dinoshade, Blender, Extreme Tux Racer.

The system is running:
Linux 2.6.33-rc2
libdrm 2.4.17
Mesa HEAD (b46bcd8e7b37aa2e9159e126c1cc88234a3c2790)
Detected an NV40 generation card (0x049800a2)
64 MB GART aperture
256 MB VRAM

The problem is solved by either of the following:
1. #define FORCE_SWTNL 1
2. Adding usleep(10000) at the end of nv40_draw_arrays
3. Making nouveau_screen_bo_del do nothing

It seems that the issue is that Mesa deletes a buffer object used for vertex
data while the GPU is still drawing to it. The kernel actually performs the
deletion without waiting for the GPU drawing, the memory (or GART mapping) is
reused, and corruption ensues.

From Gallium tracing, Mesa is sending vertex data in 64 KB buffers, which are
created, written, drawn and then recreated upon reuse (which seems correct
behavior).

It seems, in other words, that the kernel is not keeping an extra reference to
buffers which are currently referenced by an in-flight pushbuffer, and
unreferencing them only once the GPU finished drawing.

Is the kernel already supposed to do so?
If yes, something is broken. If things work for others, maybe my system is
somehow more prone to reusing memory or GART mappings, so they don't see that?

If no, then how are things supposed to work?

(BTW, not freeing buffers leads to X freezing and the kernel oopsing on my
machine upon saturating memory, but that's another issue)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
