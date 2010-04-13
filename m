From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27603] [nouveau] Celestia 1.6.0 crashes with
 nv04_surface_copy_swizzle assertion
Date: Mon, 12 Apr 2010 17:02:32 -0700 (PDT)
Message-ID: <20100413000233.97BBC13005D@annarchy.freedesktop.org>
References: <bug-27603-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27603-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27603

--- Comment #8 from Alex Buell <alex.buell-XLQCo7u1tb3e9xe1eoZjHA@public.gmane.org> 2010-04-12 17:02:32 PDT ---
(In reply to comment #7)

> You can work around this by setting NOUVEAU_NO_SWIZZLE=1 in your env.

Yes, that got me past the crash, thanks for that one, most helpful. 

Unfortunately, celestia is unusable, lots of corruption on things shown, as if
mipmaps weren't being manipulated correctly. This is with Mesa 7.8.1. 

> If you know your way around GDB maybe you can run your app under it and when it
> asserts do something like:
> 
> 'where'

Sure, doing that now without NOUVEAU_NO_SWIZZLE;

$ gdb `which celestia`
> run
[ ... ]
All ARB vertex programs loaded successfully.
render path: 8
celestia: nv04_surface_2d.c:170: nv04_surface_copy_swizzle: Assertion
`!(dst->offset & 63)' failed.

Program received signal SIGABRT, Aborted.
0xb7fe1424 in __kernel_vsyscall ()
(gdb) where
#0  0xb7fe1424 in __kernel_vsyscall ()
#1  0xb6b2b6e0 in *__GI_raise (sig=6)
    at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
#2  0xb6b2cf15 in *__GI_abort () at abort.c:88
#3  0xb6b2490e in *__GI___assert_fail (
    assertion=0xb5d9fddd "!(dst->offset & 63)", 
    file=0xb5d9fd8b "nv04_surface_2d.c", line=170, 
    function=0xb5da01bd "nv04_surface_copy_swizzle") at assert.c:78
#4  0xb5c26f0d in nv04_surface_copy_swizzle (ctx=0x91c3418, dst=0x930d818, 
    dx=0, dy=0, src=0x92f71c8, sx=0, sy=0, w=64, h=64) at nv04_surface_2d.c:170
#5  nv04_surface_copy (ctx=0x91c3418, dst=0x930d818, dx=0, dy=0, 
    src=0x92f71c8, sx=0, sy=0, w=64, h=64) at nv04_surface_2d.c:297
#6  0xb5bd3a5b in nv30_transfer_del (ptx=0x9366790) at nv30_transfer.c:134
#7  0xb5c300a3 in st_texture_image_unmap (st=0x92f94b0, stImage=0x93c3a30)
    at state_tracker/st_texture.c:221
#8  0xb5cf04df in st_TexImage (ctx=0x92b9088, dims=2, target=34070, level=0, 
    internalFormat=3, width=64, height=64, depth=1, border=0, format=6407, 
    type=5121, pixels=0x93f4fa0, unpack=0x92c7e08, texObj=0x93f12f8, 
    texImage=0x93c3a30, imageSize=0, compressed_src=0 '\000')
    at state_tracker/st_cb_texture.c:735
#9  0xb5cf0db8 in st_TexImage2D (ctx=0x92b9088, target=34070, level=0, 
    internalFormat=3, width=64, height=64, border=0, format=6407, type=5121, 
    pixels=0x93f4fa0, unpack=0x92c7e08, texObj=0x93f12f8, texImage=0x93c3a30)
---Type <return> to continue, or q <return> to quit---
    at state_tracker/st_cb_texture.c:768
#10 0xb5cc1d66 in _mesa_TexImage2D (target=34070, level=0, internalFormat=3, 
    width=64, height=64, border=0, format=6407, type=5121, pixels=0x93f4fa0)
    at main/teximage.c:2278
#11 0xb789af87 in gluBuild2DMipmapLevelsCore (target=34070, internalFormat=3, 
    width=64, height=64, widthPowerOf2=64, heightPowerOf2=64, format=6407, 
    type=5121, userLevel=0, baseLevel=0, maxLevel=6, data=0x93f4fa0)
    at libutil/mipmap.c:3873
#12 0xb789c6e8 in gluBuild2DMipmaps (target=34070, internalFormat=3, width=64, 
    height=64, format=6407, type=5121, data=0x93f4fa0) at libutil/mipmap.c:4606

> 'print *dst'

(gdb) print *dst
No symbol "dst" in current context.

Is this useful? I hope it helps improve Gallium3D. At least it works quite
nicely with Oolite (a space trading / strategy game based on Elite 20 years
ago)

Thanks.

I also tried to check out the official mesa.git but it gave up at this point:


% git clone http://cgit.freedesktop.org/mesa/mesa
[ ... ]
got ef916e4c4555c77f0f597f71c68056b22f052557
error: inflate: data stream error (incorrect header check)
error: inflate: data stream error (incorrect header check)
got 6320f9f860a80dba076e172cfeb76b9417833e04
error: File fcbe4171b46d72c388a67c1602460633c29611b3
(http://cgit.freedesktop.org/mesa/mesa/objects/fc/be4171b46d72c388a67c1602460633c29611b3)
corrupt
error: Unable to find fcbe4171b46d72c388a67c1602460633c29611b3 under
http://cgit.freedesktop.org/mesa/mesa
Cannot obtain needed tree fcbe4171b46d72c388a67c1602460633c29611b3
while processing commit c28dd492cd4f44f11de17f3b4fe569d3665736ca.
fatal: Fetch failed.

I've never used git before, but I've got experience using subversion and cvs
(shows my age!), and am getting to grips with it!

Thanks!

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
