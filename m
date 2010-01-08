From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Findings on pre-NV50 miptree layout
Date: Fri, 8 Jan 2010 22:56:50 +0100
Message-ID: <ff13bc9a1001081356t9ff579p74b114abebfff12c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1750946949=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1750946949==
Content-Type: multipart/alternative; boundary=0015174c148cc7851a047cae434b

--0015174c148cc7851a047cae434b
Content-Type: text/plain; charset=ISO-8859-1

I wrote a tool for automatically finding out the texture layout for Gallium
drivers.
You can find it attached to
http://sourceforge.net/mailarchive/forum.php?thread_name=ff13bc9a1001081140y18450c3ejdfac25c9260fd367%40mail.gmail.com&forum_name=mesa3d-dev
.
Here are the findings from running it.

The result is that our miptree layout code is partially broken, and overly
complex.
In particular:
1. 3D textures are broken because they are not laid out like cube maps, but
first by level and then by face
2. Swizzled 3D texture are all 3 texture coordinates swizzled together
3. Cube maps have their faces 128 byte aligned, not only 64 like in my patch
or unaligned like without it (not applied IIRC).
4. Swizzled 2D/3D/cube textures don't have any gaps, except for cube map
face alignment. The current code contains a strange dimension check.

I'm in the process of rewriting the miptree layout code and all the 2D
engine code to account this (and to support all case, including unswizzling
and 3D-swizzling).

Here are the findings on NV40.

Not sure what happens with compressed textures (which may be currently
broken since Doom3 misrenders in non-Ultra quality).
I'll check that once the 2D code is otherwise finished and working

* Swizzled 1D/2D/3D textures
Mipmaps are laid sequentially with no gap in between.
Each mipmap is laid "swizzled".
To get the swizzled address of a texel, take an x bit, then an y bit, then a
z bit and so on.
If you exceed a dimension, skip taking their bits.
This means in particular that 3D textures are "3D swizzled": zyxzyxzyx...
The blob loads swizzled 3D textures with the CPU.
It seems that there is no GPU hardware that can write to swizzled 3D
textures (except of course for mapping it as something else and computing in
a fragment shader).

* Swizzled cube maps
Cube maps are sequences of 2D textures, each aligned to 128 bytes.
The hardware seems to have sampling support for non-square cube maps (not
supported by any API afaik) but lays them out as if their height were equal
to the width.

* Linear textures
In linear textures all images have the same pitch, which can apparently be
any value (even 4), aligned to bytes per pixel.
1D textures and 2D textures are laid out in the obvious way.
3D textures are laid with contiguous mipmaps, each containing a 2D texture
for each zslice.
Cube maps are laid with contiguous faces, each a 2D texture. No special face
alignment is used (they will still be aligned to the pitch of course).


# Alignment requirements
Render target pitch must be a multiple of 64 and greater than 0.
For swizzled targets, the blob sets a width * bpp pitch. However, the
hardware seems to ignore pitch for swizzled targets.
Furthermore, the hardware can actually render to any swizzled surface size!
The offset must however be a multiple of 64, even for swizzled surfaces.

# GdiSubRect does not seem to work with SWIZZLED_SURFACE set as surface

# SWIZZLED_SURFACE wants a 64-byte aligned destination

--0015174c148cc7851a047cae434b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I wrote a tool for automatically finding out the texture layout for Gallium=
 drivers.<br>You can find it attached to <a href=3D"http://sourceforge.net/=
mailarchive/forum.php?thread_name=3Dff13bc9a1001081140y18450c3ejdfac25c9260=
fd367%40mail.gmail.com&amp;forum_name=3Dmesa3d-dev">http://sourceforge.net/=
mailarchive/forum.php?thread_name=3Dff13bc9a1001081140y18450c3ejdfac25c9260=
fd367%40mail.gmail.com&amp;forum_name=3Dmesa3d-dev</a>.<br>
Here are the findings from running it.<br><br>The result is that our miptre=
e layout code is partially broken, and overly complex.<br>In particular:<br=
>1. 3D textures are broken because they are not laid out like cube maps, bu=
t first by level and then by face<br>
2. Swizzled 3D texture are all 3 texture coordinates swizzled together<br>3=
. Cube maps have their faces 128 byte aligned, not only 64 like in my patch=
 or unaligned like without it (not applied IIRC).<br>4. Swizzled 2D/3D/cube=
 textures don&#39;t have any gaps, except for cube map face alignment. The =
current code contains a strange dimension check.<br>
<br>I&#39;m in the process of rewriting the miptree layout code and all the=
 2D engine code to account this (and to support all case, including unswizz=
ling and 3D-swizzling).<br><br>Here are the findings on NV40.<br><br>Not su=
re what happens with compressed textures (which may be currently broken sin=
ce Doom3 misrenders in non-Ultra quality).<br>
I&#39;ll check that once the 2D code is otherwise finished and working<br><=
br>* Swizzled 1D/2D/3D textures<br>Mipmaps are laid sequentially with no ga=
p in between.<br>Each mipmap is laid &quot;swizzled&quot;.<br>To get the sw=
izzled address of a texel, take an x bit, then an y bit, then a z bit and s=
o on.<br>
If you exceed a dimension, skip taking their bits.<br>This means in particu=
lar that 3D textures are &quot;3D swizzled&quot;: zyxzyxzyx...<br>The blob =
loads swizzled 3D textures with the CPU.<br>It seems that there is no GPU h=
ardware that can write to swizzled 3D textures (except of course for mappin=
g it as something else and computing in a fragment shader).<br>
<br>* Swizzled cube maps<br>Cube maps are sequences of 2D textures, each al=
igned to 128 bytes.<br>The hardware seems to have sampling support for non-=
square cube maps (not supported by any API afaik) but lays them out as if t=
heir height were equal to the width. <br>
<br>* Linear textures<br>In linear textures all images have the same pitch,=
 which can apparently be any value (even 4), aligned to bytes per pixel.<br=
>1D textures and 2D textures are laid out in the obvious way.<br>3D texture=
s are laid with contiguous mipmaps, each containing a 2D texture for each z=
slice.<br>
Cube maps are laid with contiguous faces, each a 2D texture. No special fac=
e alignment is used (they will still be aligned to the pitch of course).<br=
><br><br># Alignment requirements<br>Render target pitch must be a multiple=
 of 64 and greater than 0.<br>
For swizzled targets, the blob sets a width * bpp pitch. However, the hardw=
are seems to ignore pitch for swizzled targets.<br>Furthermore, the hardwar=
e can actually render to any swizzled surface size!<br>The offset must howe=
ver be a multiple of 64, even for swizzled surfaces.<br>
<br># GdiSubRect does not seem to work with SWIZZLED_SURFACE set as surface=
<br><br># SWIZZLED_SURFACE wants a 64-byte aligned destination<br><br>

--0015174c148cc7851a047cae434b--

--===============1750946949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1750946949==--
