From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix nouveau_i2c_find bounds checking
Date: Mon, 15 Feb 2010 23:22:40 +0100
Message-ID: <20100215222240.GB2823@joi.lan>
References: <20100215124046.GB18821@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100215124046.GB18821@bicker>
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
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Feb 15, 2010 at 03:40:56PM +0300, Dan Carpenter wrote:
> This is the results from:
>     make C=1 CHECK="/path/to/smatch -p=kernel" bzImage modules | tee warns.txt
>     grep -w overflow warns.txt | uniq -f 3 | tee err-list
> 
> I hacked on the buffer overflow check last weekend and these are the 
> results.  It has way more false positives than the other bug lists 
> I've posted, but it's still kinda neat.
> 
> It works like this:
> 
> lib/zlib_inflate/inftrees.c
>    112      for (min = 1; min <= MAXBITS; min++)
>    113          if (count[min] != 0) break;
>    114      if (root < min) root = min;
> smatch thinks "min" can be MAXBITS here.
> 
> One bad thing is that if you have code like:
>         if (foo == 42)
> 		frob();
> Smatch thinks that "foo" can be 43 after the if statement.
> 
> The format is:
> file.c +<line> function(<lines into function>) warning 'array_name' <array size> <= <offset>
> 
> regards,
> dan carpenter
> 
> Previous bug lists:
> * Putting too much data on the stack
>   http://lkml.indiana.edu/hypermail/linux/kernel/1002.1/01252.html
> 
> * Assigning negative values to unsigned variables
>   http://lkml.indiana.edu/hypermail/linux/kernel/1001.3/01222.html
> 
> * Doing dma on the stack
>   http://lkml.indiana.edu/hypermail/linux/kernel/1001.3/01231.html
> 
> * Dereferencing variables before verifying they are not null
>   http://lkml.indiana.edu/hypermail/linux/kernel/1001.3/01980.html
> 
> (...)
> drivers/gpu/drm/nouveau/nouveau_i2c.c +262 nouveau_i2c_find(9) error: buffer overflow 'bios->bdcb.dcb.i2c' 16 <= 16
> drivers/gpu/drm/nouveau/nouveau_i2c.c +263 nouveau_i2c_find(10) warn: buffer overflow 'bios->bdcb.dcb.i2c' 16 <= 16
> drivers/gpu/drm/nouveau/nouveau_i2c.c +267 nouveau_i2c_find(14) error: buffer overflow 'bios->bdcb.dcb.i2c' 16 <= 16
> (...)


---
From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix nouveau_i2c_find bounds checking

Reported-by: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_i2c.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_i2c.c b/drivers/gpu/drm/nouveau/nouveau_i2c.c
index 70e994d..f0162c4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_i2c.c
+++ b/drivers/gpu/drm/nouveau/nouveau_i2c.c
@@ -256,7 +256,7 @@ nouveau_i2c_find(struct drm_device *dev, int index)
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nvbios *bios = &dev_priv->VBIOS;
 
-	if (index > DCB_MAX_NUM_I2C_ENTRIES)
+	if (index >= DCB_MAX_NUM_I2C_ENTRIES)
 		return NULL;
 
 	if (!bios->bdcb.dcb.i2c[index].chan) {
-- 
1.6.6.1
