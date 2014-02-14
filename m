From: Mike Gulick <Mike.Gulick@mathworks.com>
Subject: RE: [PATCH] drm/nv50/disp: use correct register to determine DP
	display bpp
Date: Fri, 14 Feb 2014 17:30:48 +0000
Message-ID: <75858e84f1004b208c2ecc04269a00b9@ex13amer-00-ah.ad.mathworks.com>
References: <1392346635-29566-1-git-send-email-imirkin@alum.mit.edu>,
	<CAPaq-gOpD8fJOP+UaetaBNtPr0g730XsNL0bmtrY8r2FjE=fNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAPaq-gOpD8fJOP+UaetaBNtPr0g730XsNL0bmtrY8r2FjE=fNQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Torsten Wagner <torsten.wagner@gmail.com>, Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "# 3.9+" <stable@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Yes, this works for me as well.  I tested against 3.14-rc2 as well as the latest 3.10 stable series (3.10.30).  I tested on the both the quadro 400 (gt216gl), and the quadro 600 (gf108gl), and displayport works as expected.  Also tested on quadro k600 (gk107), which was working without this patch, just the make sure it was unaffected.

Thanks for the quick turnaround with this patch.  Hopefully this will get applied to both 3.14 and the 3.10 stable series.

-Mike
________________________________________
From: Torsten Wagner <torsten.wagner@gmail.com>
Sent: Friday, February 14, 2014 5:25 AM
To: Ilia Mirkin
Cc: Ben Skeggs; nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Mike Gulick; # 3.9+
Subject: Re: [PATCH] drm/nv50/disp: use correct register to determine DP display bpp

Works !!!

I applied this patch against the current linux kernel of the Arch
Linux distro (3.12.9-2) including all there magic during package
build, just to see it works downstream. (had to recreate the patch but
the actual changes were not changed).

After applying this patch the bug was gone.

One want to make sure that the address was the culprit and not the
variable soff, which could just be wrong leading to the same problem.

If that is worked out to be ok. I would be happy to see this patch
upstream soon.

Thanks a lot for all the hard work and searching. And sorry for the
hash, have no idea what went wrong during the bug report.
