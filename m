From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: Synchronization mostly missing?
Date: Mon, 28 Dec 2009 05:41:36 +0100
Message-ID: <87d41zn20v.fsf@riseup.net>
References: <ff13bc9a0912271941s5d465634te43213ea9df1d14f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1235806202=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a0912271941s5d465634te43213ea9df1d14f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Luca Barbieri's message of "Mon, 28 Dec 2009 04:41:03 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1235806202==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> writes:

> It seems that Noveau is assuming that once the FIFO pointer is past a
> command, that command has finished executing, and all the buffers it
> used are no longer needed.
>
> However, this seems to be false at least on G71.
> In particular, the card may not have even finished reading the input
> vertex buffers when the pushbuffer "fence" triggers.
> While Mesa does not reuse the buffer object itself, the current
> allocator tends to return memory that has just been freed, resulting
> in the buffer actually been reused.
> Thus Mesa will overwrite the vertices before the GPU has used them.
>
> This results in all kinds of artifacts, such as vertices going to
> infinity, and random polygons appearing.
> This can be seen in progs/demos/engine, progs/demos/dinoshade,
> Blender, Extreme Tux Racer and probably any non-trivial OpenGL
> software.
>

Can you reproduce this with your vertex buffers in VRAM instead of GART?
(to rule out that it's a fencing issue).

> The problem can be significantly reduced by just adding a waiting loop
> at the end of draw_arrays and draw_elements, or by synchronizing
> drawing by adding and calling the following function instead of
> pipe->flush in nv40_vbo.c:
> I think the remaining artifacts may be due to missing 2D engine
> synchronization, but I'm not sure how that works.
> Note that this causes the CPU to wait for rendering, which is not the
> correct solution
>
> static void nv40_sync(struct nv40_context *nv40)
> {
> 	nouveau_notifier_reset(nv40->screen->sync, 0);
>
> //	BEGIN_RING(curie, 0x1d6c, 1);
> //	OUT_RING(0x5c0);
>
> //	static int value = 0x23;
> //	BEGIN_RING(curie, 0x1d70, 1);
> //	OUT_RING(value++);
>
> 	BEGIN_RING(curie, NV40TCL_NOTIFY, 1);
> 	OUT_RING(0);
> 	
> 	BEGIN_RING(curie, NV40TCL_NOP, 1);
> 	OUT_RING(0);
> 	
> 	FIRE_RING(NULL);
>
> 	nouveau_notifier_wait_status(nv40->screen->sync, 0, 0, 0);
> }
>
> It seems that NV40TCL_NOTIFY (which must be followed by a nop for some
> reason) triggers a notification of rendering completion.
> Furthermore, the card will probably put the value set with 0x1d70
> somewhere, where 0x1d6c has an unknown use
> The 1d70/1d6c is frequently used by the nVidia driver, with 0x1d70
> being a sequence number, while 0x1d6c is always set to 0x5c0, while
> NV40TCL_NOTIFY seems to be inserted on demand.
> On my machine, setting 0x1d6c/0x1d70 like the nVidia driver does
> causes a GPU lockup. That is probably because the location where the
> GPU is supposed to put the value has not been setup correctly.
>
> So it seems that the current model is wrong, and the current fence
> should only be used to determine whether the pushbuffer itself can be
> reused.
> It seems that, after figuring out where the GPU writes the value and
> how to use the mechanism properly, this should be used by the kernel
> driver as the bo->sync_obj implementation.
> This will delay destruction of the buffers, and thus prevent
> reallocation of them, and artifacts, without synchronizing rendering.
>
> I'm not sure why this hasn't been noticed before though.
> Is everyone getting randomly misrendered OpenGL or is my machine
> somehow more prone to reusing buffers?
>
> What do you think? Is the analysis correct?
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAks4NwAACgkQ196Zy2qEI5dISACfdsF4d8nhNPqp5DQlbebC4Gqh
v2QAoJ1dtSwJQyPKRmhBOo746U7Xrqn1
=gaNg
-----END PGP SIGNATURE-----
--==-=-=--

--===============1235806202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1235806202==--
