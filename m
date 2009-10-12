From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: 8-bit swizzled textures
Date: Mon, 12 Oct 2009 00:38:35 -0400
Message-ID: <586c2acd0910112138p15eac78fm300b97ba308c804@mail.gmail.com>
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
To: mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

13:28 < pmdata> ymanton> We have a bit more work to do for 8 bits texture.
13:28 < pmdata> Swizzling works by halving dimensions, and using a8r8g8b8 as
                format as seen in dumps for test_texture_format.
13:28 < pmdata> I nearly got text in progs/demos/texenv:
                http://people.freedesktop.org/~pmandin/20091011.png
13:28 < pmdata> My current patch:
                http://people.freedesktop.org/~pmandin/8bit_texture.diff
13:51 < pmdata> ymanton> it appears there is an extra copy done with m2mf when
                dealing with 8 bits texture

Sorry, was not around earlier.

Did you try NV04_SCALED_IMAGE_FROM_MEMORY_COLOR_FORMAT_Y8 instead and
not changing the dimensions? I've seen the blob do strange things
before for swizzling that don't seem necessary, so we might be better
off trying the simplest approach first. I suspect it would work.

...Unless you already tried it and it didn't work, in which case I'd
be interested to see what the PGRAPH errors are.

@@ -51,6 +53,10 @@ static INLINE int
 nv04_scaled_image_format(enum pipe_format format)
 {
 	switch (format) {
+	case PIPE_FORMAT_A8_UNORM:
+	case PIPE_FORMAT_L8_UNORM:
+	case PIPE_FORMAT_I8_UNORM:
-		return NV04_GDI_RECTANGLE_TEXT_COLOR_FORMAT_A8R8G8B8;
+		return NV04_SCALED_IMAGE_FROM_MEMORY_COLOR_FORMAT_Y8;
 	case PIPE_FORMAT_A1R5G5B5_UNORM:
 		return NV04_SCALED_IMAGE_FROM_MEMORY_COLOR_FORMAT_A1R5G5B5;
 	case PIPE_FORMAT_A8R8G8B8_UNORM:
