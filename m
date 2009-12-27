From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nv50: align size of buffer object to
	the right boundaries.
Date: Sun, 27 Dec 2009 15:28:05 +0100
Message-ID: <6d4bc9fc0912270628l4ccddb11ua1811be230bbb15d@mail.gmail.com>
References: <1261914064-3535-1-git-send-email-madman2003@gmail.com>
	<4B37647F.9030402@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B37647F.9030402-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Dec 27, 2009 at 2:43 PM, Christoph Bumiller
<e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> wrote:
> On 12/27/2009 12:41 PM, Maarten Maathuis wrote:
>> - Depth and stencil buffers are supposed to be large enough in general.
>>
>> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0drivers/gpu/drm/nouveau/nouveau_bo.c | =A0 =A09 ++++-----
>> =A01 files changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouv=
eau/nouveau_bo.c
>> index e342a41..9fc4bd6 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> @@ -65,8 +65,9 @@ nouveau_bo_fixup_align(struct drm_device *dev,
>>
>> =A0 =A0 =A0 /*
>> =A0 =A0 =A0 =A0* Some of the tile_flags have a periodic structure of N*4=
096 bytes,
>> - =A0 =A0 =A0* align to to that as well as the page size. Overallocate m=
emory to
>> - =A0 =A0 =A0* avoid corruption of other buffer objects.
>> + =A0 =A0 =A0* align to to that as well as the page size. Align the size=
 to the
>> + =A0 =A0 =A0* appropriate boundaries. This does imply that sizes are ro=
unded up
>> + =A0 =A0 =A0* 3-7 pages, so make sure your "special" buffer sizes are l=
arge enough.
>> =A0 =A0 =A0 =A0*/
> No - 16x16 depth textures or whatever crazy idea some app might have
> won't be large enough.
> Taking care of size in userspace and of alignment in kernel ... not nice
> to split in my opinion.

Userspace doesn't know all constraints, so the kernel has to do
something. How to deal with these limitations is another question.
Either we over allocate (and hide the overallocation from everyone),
align the size, or we try to make the allocator smarter to group them
together based on their tile flags.

>> =A0 =A0 =A0 if (dev_priv->card_type =3D=3D NV_50) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint32_t block_size =3D nouveau_mem_fb_amoun=
t(dev) >> 15;
>> @@ -77,22 +78,20 @@ nouveau_bo_fixup_align(struct drm_device *dev,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 0x2800:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 0x4800:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 0x7a00:
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *size =3D roundup(*size, block=
_size);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (is_power_of_2(block_size=
)) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *size +=3D 3 *=
 block_size;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 1=
; i < 10; i++) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 *align =3D 12 * i * block_size;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 if (!(*align % 65536))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *size +=3D 6 *=
 block_size;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 1=
; i < 10; i++) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 *align =3D 8 * i * block_size;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 if (!(*align % 65536))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *size =3D roundup(*size, *alig=
n);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>
>
