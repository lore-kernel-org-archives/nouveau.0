From: Torsten Wagner <torsten.wagner@gmail.com>
Subject: Re: [PATCH] drm/nv50/disp: use correct register to determine DP
 display bpp
Date: Fri, 14 Feb 2014 11:25:50 +0100
Message-ID: <CAPaq-gOpD8fJOP+UaetaBNtPr0g730XsNL0bmtrY8r2FjE=fNQ@mail.gmail.com>
References: <1392346635-29566-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1392346635-29566-1-git-send-email-imirkin@alum.mit.edu>
Sender: stable-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Michael Gulick <mgulick@mathworks.com>, "# 3.9+" <stable@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

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
