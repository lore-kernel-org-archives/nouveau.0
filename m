From: Thierry Reding <thierry.reding@gmail.com>
Subject: Leaking fences
Date: Thu, 16 Oct 2014 11:49:16 +0200
Message-ID: <20141016094915.GA15517@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0798504129=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org


--===============0798504129==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

While investigating something completely unrelated, I came across this:

	# cat /sys/kernel/debug/kmemleak
	unreferenced object 0xec934200 (size 512):
	  comm "triangle", pid 186, jiffies 4294949362 (age 199.440s)
	  hex dump (first 32 bytes):
	    08 00 08 00 ad 4e ad de ff ff ff ff ff ff ff ff  .....N..........
	    a8 b5 1a c1 38 1a d4 c0 00 00 00 00 4c 73 9d c0  ....8.......Ls..
	  backtrace:
	    [<c00ee72c>] kmem_cache_alloc+0xf4/0x174
	    [<c03edcc8>] nv84_fence_context_new+0x58/0x170
	    [<c03ee564>] nvc0_fence_context_new+0xc/0x34
	    [<c03e2d3c>] nouveau_channel_new+0x374/0x730
	    [<c03eb6d4>] nouveau_abi16_ioctl_channel_alloc+0x148/0x37c
	    [<c0327620>] drm_ioctl+0x1d4/0x50c
	    [<c03e0eac>] nouveau_drm_ioctl+0x58/0xa4
	    [<c0107498>] do_vfs_ioctl+0x3f0/0x614
	    [<c01076f0>] SyS_ioctl+0x34/0x5c
	    [<c000e8e0>] ret_fast_syscall+0x0/0x30
	    [<ffffffff>] 0xffffffff

That's recorded by kmemleak after running a the "triangle" test program,
which is essentially just a program that renders a smooth-shaded
triangle on gk20a and displays it on Tegra DRM. Anyway, I'm pretty sure
the workload isn't anything special, so I suspect that this is happening
for other programs as well.

It seems like this could be due to somebody holding a reference to the
fence. Perhaps this is just kmemleak getting confused, but I thought I'd
bring it up, perhaps somebody has an idea about what's going on here.

Thierry

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUP5SbAAoJEN0jrNd/PrOhtscP/iXKU4ihj56KzD7LnVxwOTOk
fQAdoquOSr0lGIrm2VB7Yx+s0bz7FN80DF6j0k6///zYcXEO6pRpQ/ZgSoo3J3B7
Xp7HxB09uAp28M7DKTpPo3bl9ILirNlYsC+m+ONgc4QmvJmird6V01SJmk5dFTMy
k8pTQAwjtnQpBopUGhBOy6iUivVRuKh0zri464oBgT+bph6JMC8m/s4uh6KYm4V/
e9WSN/NVyeh3qIOLYf+UvdjSRwdKQ+gCAN5FHTkdwbtMVBpMYXV6zmlC8bdMnn8R
rpdlQ7TGK8oB3tKsfdOB3MChF9Jd3WHKTPSEEKb831ERXCUYGKCtmM2py4ZzLkbj
j53PgfedLpkrYMOWFR8AUiyZJYBU92acaWR1K7TYtlYpHWSYoZYJ/fs5zooZKruM
CYPz2JDseeehsHM/UhprCq6M1hV0gEvAE7L9VUEfBQ3ZZtp8WDrxnN+/TpB/bD7z
UbJPkpKnN+nYOBTl40Sr/evnZp2dpW9aGCgWGCEoCtWX6kLX/641UbwJsD+U295B
j3S/jO1WVAe520/l6mYm4ltt2i53LctG+UyWwq6F1waC3n1K+6SfTInbiusg4O7t
vKzJ922Yxr9dOHKDqnzZ4sQM16S1Y3FjVkFdbVIgYuyEUJOcp3vFIbEhON3gPl/M
HcAEZ+PFa4ZtQ5uSrnk7
=htMx
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

--===============0798504129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0798504129==--
